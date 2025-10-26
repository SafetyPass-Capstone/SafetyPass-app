import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:safetypass_app/widgets/atoms/texts/texts.dart';
import 'package:safetypass_app/constants/colors.dart';
import 'package:safetypass_app/models/stadium_map_models.dart';

class StadiumMapPainter extends CustomPainter {
  final List<SeatNode> seats;
  final List<ExitNode> exits;
  final List<LayerPolygon> aisles;
  final List<LayerPolygon> stages;
  final List<AisleNode> aisleNodes;
  final List<EdgeConnection> edges;

  StadiumMapPainter({
    required this.seats,
    required this.exits,
    required this.aisles,
    required this.stages,
    required this.aisleNodes,
    required this.edges,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (seats.isEmpty) {
      _drawNoData(canvas, size);
      return;
    }

    // 좌표 변환을 위한 범위 계산
    final bounds = _calculateBounds();
    final transform = _createTransformFunction(bounds, size);

    // 레이어별 그리기
    _drawAisles(canvas, transform);
    _drawStages(canvas, transform);
    _drawSeats(canvas, transform);
    _drawEdges(canvas, transform);
    _drawAisleNodes(canvas, transform);
    _drawExits(canvas, transform);
  }

  MapBounds _calculateBounds() {
    double minX = seats.map((s) => s.x).reduce(math.min);
    double maxX = seats.map((s) => s.x).reduce(math.max);
    double minY = seats.map((s) => s.y).reduce(math.min);
    double maxY = seats.map((s) => s.y).reduce(math.max);

    // Exit 좌표 포함
    for (var exit in exits) {
      minX = math.min(minX, exit.x);
      maxX = math.max(maxX, exit.x);
      minY = math.min(minY, exit.y);
      maxY = math.max(maxY, exit.y);
    }

    // AisleNode 좌표 포함
    for (var node in aisleNodes) {
      minX = math.min(minX, node.x);
      maxX = math.max(maxX, node.x);
      minY = math.min(minY, node.y);
      maxY = math.max(maxY, node.y);
    }

    // Layer 좌표 포함
    for (var aisle in aisles) {
      for (var point in aisle.points) {
        minX = math.min(minX, point.dx);
        maxX = math.max(maxX, point.dx);
        minY = math.min(minY, point.dy);
        maxY = math.max(maxY, point.dy);
      }
    }

    for (var stage in stages) {
      for (var point in stage.points) {
        minX = math.min(minX, point.dx);
        maxX = math.max(maxX, point.dx);
        minY = math.min(minY, point.dy);
        maxY = math.max(maxY, point.dy);
      }
    }

    return MapBounds(minX: minX, maxX: maxX, minY: minY, maxY: maxY);
  }

  Offset Function(double, double) _createTransformFunction(
      MapBounds bounds, Size size) {
    const padding = 40.0;
    final drawWidth = size.width - padding * 2;
    final drawHeight = size.height - padding * 2;

    return (double x, double y) {
      final normalizedX = (x - bounds.minX) / (bounds.maxX - bounds.minX);
      final normalizedY = (y - bounds.minY) / (bounds.maxY - bounds.minY);
      return Offset(
        padding + normalizedX * drawWidth,
        padding + (1.0 - normalizedY) * drawHeight,
      );
    };
  }

  void _drawAisles(Canvas canvas, Offset Function(double, double) transform) {
    if (aisles.isEmpty) return;

    final fillPaint = Paint()
      ..color = const Color(0xFF505356)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = const Color(0xFF505356)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    for (var aisle in aisles) {
      final path = _createPath(aisle.points, transform);
      canvas.drawPath(path, fillPaint);
      canvas.drawPath(path, borderPaint);
    }
  }

  void _drawStages(Canvas canvas, Offset Function(double, double) transform) {
    if (stages.isEmpty) return;

    final fillPaint = Paint()
      ..color = const Color(0xFF9D9D9D)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = const Color(0xFF9D9D9D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    for (var stage in stages) {
      final path = _createPath(stage.points, transform);
      canvas.drawPath(path, fillPaint);
      canvas.drawPath(path, borderPaint);

      // Stage 텍스트
      final bounds = path.getBounds();
      if (bounds.width > 20 && bounds.height > 10) {
        _drawText(canvas, 'STAGE', bounds.center, 8);
      }
    }
  }

  void _drawSeats(Canvas canvas, Offset Function(double, double) transform) {
    final zoneColors = _getZoneColors();
    final seatsByZone = <String, List<SeatNode>>{};

    for (var seat in seats) {
      final zoneKey = seat.zone.substring(0, 1);
      seatsByZone.putIfAbsent(zoneKey, () => []).add(seat);
    }

    for (var entry in seatsByZone.entries) {
      final color = zoneColors[entry.key] ?? const Color(0xFF4A90E2);
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      for (var seat in entry.value) {
        final point = transform(seat.x, seat.y);
        canvas.drawCircle(point, 0.8, paint);
      }
    }
  }

  void _drawEdges(Canvas canvas, Offset Function(double, double) transform) {
    if (edges.isEmpty) return;

    final paint = Paint()
      ..color = const Color(0xFF7F8380)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5
      ..strokeCap = StrokeCap.round;

    for (var edge in edges) {
      final from = transform(edge.fromX, edge.fromY);
      final to = transform(edge.toX, edge.toY);
      canvas.drawLine(from, to, paint);
    }
  }

  void _drawAisleNodes(
      Canvas canvas, Offset Function(double, double) transform) {
    if (aisleNodes.isEmpty) return;

    final fillPaint = Paint()
      ..color = const Color(0xFF7F8380)
      ..style = PaintingStyle.fill;

    final outlinePaint = Paint()
      ..color = const Color(0xFF9FA09D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;

    for (var node in aisleNodes) {
      final point = transform(node.x, node.y);
      canvas.drawCircle(point, 0.5, fillPaint);
      canvas.drawCircle(point, 0.5, outlinePaint);
    }
  }

  void _drawExits(Canvas canvas, Offset Function(double, double) transform) {
    if (exits.isEmpty) return;

    for (var exit in exits) {
      final point = transform(exit.x, exit.y);

      // 글로우 효과
      _drawGlow(canvas, point);

      // 배경
      final bgPaint = Paint()
        ..color = const Color(0xFFD6FFE0)
        ..style = PaintingStyle.fill;

      final rect = RRect.fromRectAndRadius(
        Rect.fromCenter(center: point, width: 43, height: 13),
        const Radius.circular(8),
      );

      canvas.drawRRect(rect, bgPaint);

      // 텍스트
      final textPainter = TextPainter(
        text: TextSpan(
          text: exit.nodeId.toUpperCase(),
          style: SafetyPassTextStyle.bodyEB10
              .copyWith(color: SafetyPassColor.systemGray05),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          point.dx - textPainter.width / 2,
          point.dy - textPainter.height / 2,
        ),
      );
    }
  }

  // Helper methods
  Path _createPath(
      List<Offset> points, Offset Function(double, double) transform) {
    final path = Path();
    bool first = true;

    for (var point in points) {
      final transformed = transform(point.dx, point.dy);
      if (first) {
        path.moveTo(transformed.dx, transformed.dy);
        first = false;
      } else {
        path.lineTo(transformed.dx, transformed.dy);
      }
    }
    path.close();
    return path;
  }

  void _drawText(Canvas canvas, String text, Offset center, double fontSize) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }

  void _drawGlow(Canvas canvas, Offset point) {
    final rect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: point, width: 50, height: 15),
      const Radius.circular(8),
    );

    final paints = [
      Paint()
        ..color = const Color(0x4D3AF766)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15)
        ..style = PaintingStyle.fill,
      Paint()
        ..color = const Color(0x663AF766)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10)
        ..style = PaintingStyle.fill,
      Paint()
        ..color = const Color(0x993AF766)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5)
        ..style = PaintingStyle.fill,
    ];

    for (var paint in paints) {
      canvas.drawRRect(rect, paint);
    }
  }

  Map<String, Color> _getZoneColors() {
    return {
      'A': const Color(0xFF9E876D),
      'B': const Color(0xFF9E876D),
      'C': const Color(0xFF9E876D),
      'D': const Color(0xFF9E876D),
      'E': const Color(0xFF9E876D),
      'G': const Color(0xFF9E876D),
      'H': const Color(0xFF9E876D),
    };
  }

  void _drawNoData(Canvas canvas, Size size) {
    _drawText(
      canvas,
      '데이터를 불러오는 중...',
      Offset(size.width / 2, size.height / 2),
      20,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MapBounds {
  final double minX, maxX, minY, maxY;

  MapBounds({
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
  });
}
