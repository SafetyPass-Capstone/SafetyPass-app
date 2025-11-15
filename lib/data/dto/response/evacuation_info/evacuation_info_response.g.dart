// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evacuation_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EvacuationInfoResponseImpl _$$EvacuationInfoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EvacuationInfoResponseImpl(
      isEmergency: json['is_emergency'] as bool,
      message: json['message'] as String?,
      seatId: json['seat_id'] as String?,
      optimalExit: json['optimal_exit'] as String?,
      estimatedTime: json['estimated_time'] as String?,
      fireLocation: json['fire_location'] as String?,
      fireSpreadNodes: (json['fire_spread_nodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      closedExits: (json['closed_exits'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      evacuationPath: (json['evacuation_path'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pathLength: (json['path_length'] as num?)?.toInt(),
      totalDistanceMm: (json['total_distance_mm'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$EvacuationInfoResponseImplToJson(
        _$EvacuationInfoResponseImpl instance) =>
    <String, dynamic>{
      'is_emergency': instance.isEmergency,
      'message': instance.message,
      'seat_id': instance.seatId,
      'optimal_exit': instance.optimalExit,
      'estimated_time': instance.estimatedTime,
      'fire_location': instance.fireLocation,
      'fire_spread_nodes': instance.fireSpreadNodes,
      'closed_exits': instance.closedExits,
      'evacuation_path': instance.evacuationPath,
      'path_length': instance.pathLength,
      'total_distance_mm': instance.totalDistanceMm,
    };
