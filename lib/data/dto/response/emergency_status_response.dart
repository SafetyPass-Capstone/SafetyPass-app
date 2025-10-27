import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency_status_response.freezed.dart';
part 'emergency_status_response.g.dart';

///특정 코고 조회
@freezed
class EmergencyStatusResponse with _$EmergencyStatusResponse {
  const factory EmergencyStatusResponse({
    @JsonKey(name: 'is_emergency') required String? isEmergency,
    @JsonKey(name: 'fire_node') required String? fireNode,
  }) = _EmergencyStatusResponse;

  factory EmergencyStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$EmergencyStatusResponseFromJson(json);
}
