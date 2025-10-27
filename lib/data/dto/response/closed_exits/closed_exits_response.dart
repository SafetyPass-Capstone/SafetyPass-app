import 'package:freezed_annotation/freezed_annotation.dart';

part 'closed_exits_response.freezed.dart';
part 'closed_exits_response.g.dart';

/// 닫힌 출구 목록 조회
@freezed
class ClosedExitsResponse with _$ClosedExitsResponse {
  const factory ClosedExitsResponse({
    @JsonKey(name: 'closed_exits') required List<String>? closedExits,
    @JsonKey(name: 'total_exits') required int? totalExits,
    @JsonKey(name: 'active_exits') required int? activeExits,
  }) = _ClosedExitsResponse;

  factory ClosedExitsResponse.fromJson(Map<String, dynamic> json) =>
      _$ClosedExitsResponseFromJson(json);
}
