// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmergencyStatusResponseImpl _$$EmergencyStatusResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EmergencyStatusResponseImpl(
      isEmergency: json['is_emergency'] as String?,
      fireNode: json['fire_node'] as String?,
    );

Map<String, dynamic> _$$EmergencyStatusResponseImplToJson(
        _$EmergencyStatusResponseImpl instance) =>
    <String, dynamic>{
      'is_emergency': instance.isEmergency,
      'fire_node': instance.fireNode,
    };
