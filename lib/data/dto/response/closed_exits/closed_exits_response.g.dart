// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closed_exits_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClosedExitsResponseImpl _$$ClosedExitsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ClosedExitsResponseImpl(
      closedExits: (json['closed_exits'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      totalExits: (json['total_exits'] as num?)?.toInt(),
      activeExits: (json['active_exits'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ClosedExitsResponseImplToJson(
        _$ClosedExitsResponseImpl instance) =>
    <String, dynamic>{
      'closed_exits': instance.closedExits,
      'total_exits': instance.totalExits,
      'active_exits': instance.activeExits,
    };
