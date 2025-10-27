import 'package:freezed_annotation/freezed_annotation.dart';

part 'evacuation_info_response.freezed.dart';
part 'evacuation_info_response.g.dart';

@freezed
class EvacuationInfoResponse with _$EvacuationInfoResponse {
  const factory EvacuationInfoResponse({
    @JsonKey(name: 'is_emergency') required bool isEmergency,

    // 일반 상황일 때
    @JsonKey(name: 'message') String? message,

    // 긴급 상황일 때
    @JsonKey(name: 'seat_id') String? seatId,
    @JsonKey(name: 'optimal_exit') String? optimalExit,
    @JsonKey(name: 'estimated_time') String? estimatedTime,
    @JsonKey(name: 'fire_location') String? fireLocation,
    @JsonKey(name: 'closed_exits') List<String>? closedExits,
    @JsonKey(name: 'evacuation_path') List<String>? evacuationPath,
    @JsonKey(name: 'path_length') int? pathLength,
    @JsonKey(name: 'total_distance_mm') double? totalDistanceMm,
  }) = _EvacuationInfoResponse;

  factory EvacuationInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$EvacuationInfoResponseFromJson(json);
}
