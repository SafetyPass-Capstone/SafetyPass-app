import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:csv/csv.dart';

import 'package:safetypass_app/constants/colors.dart';
import 'package:safetypass_app/widgets/organisms/stadium_map_painter.dart';
import 'package:safetypass_app/models/stadium_map_models.dart';

class StadiumMapWidget extends StatefulWidget {
  const StadiumMapWidget({Key? key}) : super(key: key);

  @override
  State<StadiumMapWidget> createState() => _StadiumMapWidgetState();
}

class _StadiumMapWidgetState extends State<StadiumMapWidget> {
  // 데이터
  List<SeatNode> seats = [];
  List<ExitNode> exits = [];
  List<LayerPolygon> aisles = [];
  List<LayerPolygon> stages = [];
  List<AisleNode> aisleNodes = [];
  List<EdgeConnection> edges = [];

  // 상태
  bool isLoading = true;
  String? errorMessage;

  // 컨트롤러
  final TransformationController _transformationController =
      TransformationController();

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  Future<void> _loadAllData() async {
    await Future.wait([
      _loadCSVData(),
      _loadLayerData(),
      _loadAisleNodesData(),
      _loadEdgesData(),
    ]);
  }

  Future<void> _loadAisleNodesData() async {
    try {
      final csvString = await rootBundle.loadString('assets/AisleNodes_I.csv');
      final rows = const CsvToListConverter(eol: '\n').convert(csvString);

      for (int i = 1; i < rows.length; i++) {
        if (rows[i].length >= 6) {
          try {
            aisleNodes.add(AisleNode(
              id: rows[i][0].toString(),
              x: double.parse(rows[i][1].toString()),
              y: double.parse(rows[i][2].toString()),
              floor: int.parse(rows[i][3].toString()),
              layerName: rows[i][4].toString(),
              capacity: double.parse(rows[i][5].toString()),
            ));
          } catch (e) {
            print('Error parsing aisle node row $i: $e');
          }
        }
      }

      print('✓ Loaded ${aisleNodes.length} aisle nodes');
    } catch (e) {
      print('✗ Error loading aisle nodes: $e');
    }
  }

  Future<void> _loadEdgesData() async {
    try {
      final csvString =
          await rootBundle.loadString('assets/Edges_I_withXY.csv');
      final rows = const CsvToListConverter(eol: '\n').convert(csvString);

      for (int i = 1; i < rows.length; i++) {
        if (rows[i].length >= 7) {
          try {
            edges.add(EdgeConnection(
              fromNode: rows[i][0].toString(),
              toNode: rows[i][1].toString(),
              fromX: double.parse(rows[i][3].toString()),
              fromY: double.parse(rows[i][4].toString()),
              toX: double.parse(rows[i][5].toString()),
              toY: double.parse(rows[i][6].toString()),
            ));
          } catch (e) {
            if (i <= 3) {
              print('Error parsing edge row $i: $e');
            }
          }
        }
      }

      print('✓ Loaded ${edges.length} edges from CSV');
    } catch (e) {
      print('✗ Error loading edges: $e');
    }
  }

  Future<void> _loadLayerData() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/I_Layer_geometry.json');
      final jsonData = json.decode(jsonString);

      final features = jsonData['features'] as List;

      for (var feature in features) {
        final layer = feature['properties']['layer'] as String;
        final coordinates = feature['geometry']['coordinates'][0] as List;

        List<Offset> points = [];
        for (var coord in coordinates) {
          points.add(Offset(
            (coord[0] as num).toDouble(),
            (coord[1] as num).toDouble(),
          ));
        }

        if (layer.contains('aisle')) {
          aisles.add(LayerPolygon(layer: layer, points: points));
        } else if (layer.contains('stage')) {
          stages.add(LayerPolygon(layer: layer, points: points));
        }
      }

      print('✓ Loaded ${aisles.length} aisle polygons');
      print('✓ Loaded ${stages.length} stage polygons');
    } catch (e) {
      print('✗ Error loading layer data: $e');
    }
  }

  Future<void> _loadCSVData() async {
    try {
      final seatCsvString =
          await rootBundle.loadString('assets/Seat_Node_mapped_I.csv');
      final exitCsvString =
          await rootBundle.loadString('assets/ExitNodes_I.csv');

      final seatRows =
          const CsvToListConverter(eol: '\n').convert(seatCsvString);
      final exitRows =
          const CsvToListConverter(eol: '\n').convert(exitCsvString);

      for (int i = 1; i < seatRows.length; i++) {
        if (seatRows[i].length >= 6) {
          try {
            seats.add(SeatNode(
              node: seatRows[i][5].toString(),
              floor: int.parse(seatRows[i][1].toString()),
              zone: seatRows[i][2].toString(),
              x: double.parse(seatRows[i][3].toString()),
              y: double.parse(seatRows[i][4].toString()),
            ));
          } catch (e) {
            // Silent
          }
        }
      }

      for (int i = 1; i < exitRows.length; i++) {
        try {
          if (exitRows[i].length >= 5) {
            exits.add(ExitNode(
              nodeId: exitRows[i][0].toString(),
              floor: int.parse(exitRows[i][1].toString()),
              x: double.parse(exitRows[i][2].toString()),
              y: double.parse(exitRows[i][3].toString()),
              capacity: double.parse(exitRows[i][4].toString()),
            ));
          }
        } catch (e) {
          // Silent
        }
      }

      print('✓ Loaded ${seats.length} seats');
      print('✓ Loaded ${exits.length} exits');

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'CSV 파일을 불러오는 중 오류가 발생했습니다: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Text(
          errorMessage!,
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
      );
    }

    return InteractiveViewer(
      transformationController: _transformationController,
      boundaryMargin: const EdgeInsets.all(100),
      minScale: 0.5,
      maxScale: 5.0,
      child: Container(
        width: 370,
        height: 250,
        decoration: BoxDecoration(
          color: SafetyPassColor.systemGray05,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: SafetyPassColor.white, width: 1),
        ),
        child: CustomPaint(
          painter: StadiumMapPainter(
            seats: seats,
            exits: exits,
            aisles: aisles,
            stages: stages,
            aisleNodes: aisleNodes,
            edges: edges,
          ),
        ),
      ),
    );
  }
}
