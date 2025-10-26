import 'package:flutter/material.dart';

/// 좌석 노드
class SeatNode {
  final String node;
  final double x, y;
  final int floor;
  final String zone;

  const SeatNode({
    required this.node,
    required this.x,
    required this.y,
    required this.floor,
    required this.zone,
  });
}

/// 출구 노드
class ExitNode {
  final String nodeId;
  final int floor;
  final double x, y, capacity;

  const ExitNode({
    required this.nodeId,
    required this.floor,
    required this.x,
    required this.y,
    required this.capacity,
  });
}

/// 통로 노드
class AisleNode {
  final String id;
  final double x, y, capacity;
  final int floor;
  final String layerName;

  AisleNode({
    required this.id,
    required this.x,
    required this.y,
    required this.floor,
    required this.layerName,
    required this.capacity,
  });
}

/// 엣지 연결
class EdgeConnection {
  final String fromNode, toNode;
  final double fromX, fromY, toX, toY;

  EdgeConnection({
    required this.fromNode,
    required this.toNode,
    required this.fromX,
    required this.fromY,
    required this.toX,
    required this.toY,
  });
}

/// 레이어 폴리곤
class LayerPolygon {
  final String layer;
  final List<Offset> points;

  LayerPolygon({
    required this.layer,
    required this.points,
  });
}
