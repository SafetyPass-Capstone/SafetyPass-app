import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency_status_response.freezed.dart';
part 'emergency_status_response.g.dart';

/// 긴급 상황 여부 확인
@freezed
class EmergencyStatusResponse with _$EmergencyStatusResponse {
  const factory EmergencyStatusResponse({
    @JsonKey(name: 'is_emergency') required String? isEmergency,
    @JsonKey(name: 'fire_node') required String? fireNode,
  }) = _EmergencyStatusResponse;

  factory EmergencyStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$EmergencyStatusResponseFromJson(json);
}
