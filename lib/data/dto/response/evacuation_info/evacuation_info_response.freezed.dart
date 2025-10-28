// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evacuation_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EvacuationInfoResponse _$EvacuationInfoResponseFromJson(
    Map<String, dynamic> json) {
  return _EvacuationInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$EvacuationInfoResponse {
  @JsonKey(name: 'is_emergency')
  bool get isEmergency => throw _privateConstructorUsedError; // 일반 상황일 때
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError; // 긴급 상황일 때
  @JsonKey(name: 'seat_id')
  String? get seatId => throw _privateConstructorUsedError;
  @JsonKey(name: 'optimal_exit')
  String? get optimalExit => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_time')
  String? get estimatedTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'fire_location')
  String? get fireLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'closed_exits')
  List<String>? get closedExits => throw _privateConstructorUsedError;
  @JsonKey(name: 'evacuation_path')
  List<String>? get evacuationPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'path_length')
  int? get pathLength => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_distance_mm')
  double? get totalDistanceMm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvacuationInfoResponseCopyWith<EvacuationInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvacuationInfoResponseCopyWith<$Res> {
  factory $EvacuationInfoResponseCopyWith(EvacuationInfoResponse value,
          $Res Function(EvacuationInfoResponse) then) =
      _$EvacuationInfoResponseCopyWithImpl<$Res, EvacuationInfoResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_emergency') bool isEmergency,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'seat_id') String? seatId,
      @JsonKey(name: 'optimal_exit') String? optimalExit,
      @JsonKey(name: 'estimated_time') String? estimatedTime,
      @JsonKey(name: 'fire_location') String? fireLocation,
      @JsonKey(name: 'closed_exits') List<String>? closedExits,
      @JsonKey(name: 'evacuation_path') List<String>? evacuationPath,
      @JsonKey(name: 'path_length') int? pathLength,
      @JsonKey(name: 'total_distance_mm') double? totalDistanceMm});
}

/// @nodoc
class _$EvacuationInfoResponseCopyWithImpl<$Res,
        $Val extends EvacuationInfoResponse>
    implements $EvacuationInfoResponseCopyWith<$Res> {
  _$EvacuationInfoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmergency = null,
    Object? message = freezed,
    Object? seatId = freezed,
    Object? optimalExit = freezed,
    Object? estimatedTime = freezed,
    Object? fireLocation = freezed,
    Object? closedExits = freezed,
    Object? evacuationPath = freezed,
    Object? pathLength = freezed,
    Object? totalDistanceMm = freezed,
  }) {
    return _then(_value.copyWith(
      isEmergency: null == isEmergency
          ? _value.isEmergency
          : isEmergency // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      seatId: freezed == seatId
          ? _value.seatId
          : seatId // ignore: cast_nullable_to_non_nullable
              as String?,
      optimalExit: freezed == optimalExit
          ? _value.optimalExit
          : optimalExit // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedTime: freezed == estimatedTime
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      fireLocation: freezed == fireLocation
          ? _value.fireLocation
          : fireLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      closedExits: freezed == closedExits
          ? _value.closedExits
          : closedExits // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      evacuationPath: freezed == evacuationPath
          ? _value.evacuationPath
          : evacuationPath // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pathLength: freezed == pathLength
          ? _value.pathLength
          : pathLength // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDistanceMm: freezed == totalDistanceMm
          ? _value.totalDistanceMm
          : totalDistanceMm // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EvacuationInfoResponseImplCopyWith<$Res>
    implements $EvacuationInfoResponseCopyWith<$Res> {
  factory _$$EvacuationInfoResponseImplCopyWith(
          _$EvacuationInfoResponseImpl value,
          $Res Function(_$EvacuationInfoResponseImpl) then) =
      __$$EvacuationInfoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_emergency') bool isEmergency,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'seat_id') String? seatId,
      @JsonKey(name: 'optimal_exit') String? optimalExit,
      @JsonKey(name: 'estimated_time') String? estimatedTime,
      @JsonKey(name: 'fire_location') String? fireLocation,
      @JsonKey(name: 'closed_exits') List<String>? closedExits,
      @JsonKey(name: 'evacuation_path') List<String>? evacuationPath,
      @JsonKey(name: 'path_length') int? pathLength,
      @JsonKey(name: 'total_distance_mm') double? totalDistanceMm});
}

/// @nodoc
class __$$EvacuationInfoResponseImplCopyWithImpl<$Res>
    extends _$EvacuationInfoResponseCopyWithImpl<$Res,
        _$EvacuationInfoResponseImpl>
    implements _$$EvacuationInfoResponseImplCopyWith<$Res> {
  __$$EvacuationInfoResponseImplCopyWithImpl(
      _$EvacuationInfoResponseImpl _value,
      $Res Function(_$EvacuationInfoResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmergency = null,
    Object? message = freezed,
    Object? seatId = freezed,
    Object? optimalExit = freezed,
    Object? estimatedTime = freezed,
    Object? fireLocation = freezed,
    Object? closedExits = freezed,
    Object? evacuationPath = freezed,
    Object? pathLength = freezed,
    Object? totalDistanceMm = freezed,
  }) {
    return _then(_$EvacuationInfoResponseImpl(
      isEmergency: null == isEmergency
          ? _value.isEmergency
          : isEmergency // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      seatId: freezed == seatId
          ? _value.seatId
          : seatId // ignore: cast_nullable_to_non_nullable
              as String?,
      optimalExit: freezed == optimalExit
          ? _value.optimalExit
          : optimalExit // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedTime: freezed == estimatedTime
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      fireLocation: freezed == fireLocation
          ? _value.fireLocation
          : fireLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      closedExits: freezed == closedExits
          ? _value._closedExits
          : closedExits // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      evacuationPath: freezed == evacuationPath
          ? _value._evacuationPath
          : evacuationPath // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pathLength: freezed == pathLength
          ? _value.pathLength
          : pathLength // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDistanceMm: freezed == totalDistanceMm
          ? _value.totalDistanceMm
          : totalDistanceMm // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EvacuationInfoResponseImpl implements _EvacuationInfoResponse {
  const _$EvacuationInfoResponseImpl(
      {@JsonKey(name: 'is_emergency') required this.isEmergency,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'seat_id') this.seatId,
      @JsonKey(name: 'optimal_exit') this.optimalExit,
      @JsonKey(name: 'estimated_time') this.estimatedTime,
      @JsonKey(name: 'fire_location') this.fireLocation,
      @JsonKey(name: 'closed_exits') final List<String>? closedExits,
      @JsonKey(name: 'evacuation_path') final List<String>? evacuationPath,
      @JsonKey(name: 'path_length') this.pathLength,
      @JsonKey(name: 'total_distance_mm') this.totalDistanceMm})
      : _closedExits = closedExits,
        _evacuationPath = evacuationPath;

  factory _$EvacuationInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EvacuationInfoResponseImplFromJson(json);

  @override
  @JsonKey(name: 'is_emergency')
  final bool isEmergency;
// 일반 상황일 때
  @override
  @JsonKey(name: 'message')
  final String? message;
// 긴급 상황일 때
  @override
  @JsonKey(name: 'seat_id')
  final String? seatId;
  @override
  @JsonKey(name: 'optimal_exit')
  final String? optimalExit;
  @override
  @JsonKey(name: 'estimated_time')
  final String? estimatedTime;
  @override
  @JsonKey(name: 'fire_location')
  final String? fireLocation;
  final List<String>? _closedExits;
  @override
  @JsonKey(name: 'closed_exits')
  List<String>? get closedExits {
    final value = _closedExits;
    if (value == null) return null;
    if (_closedExits is EqualUnmodifiableListView) return _closedExits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _evacuationPath;
  @override
  @JsonKey(name: 'evacuation_path')
  List<String>? get evacuationPath {
    final value = _evacuationPath;
    if (value == null) return null;
    if (_evacuationPath is EqualUnmodifiableListView) return _evacuationPath;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'path_length')
  final int? pathLength;
  @override
  @JsonKey(name: 'total_distance_mm')
  final double? totalDistanceMm;

  @override
  String toString() {
    return 'EvacuationInfoResponse(isEmergency: $isEmergency, message: $message, seatId: $seatId, optimalExit: $optimalExit, estimatedTime: $estimatedTime, fireLocation: $fireLocation, closedExits: $closedExits, evacuationPath: $evacuationPath, pathLength: $pathLength, totalDistanceMm: $totalDistanceMm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvacuationInfoResponseImpl &&
            (identical(other.isEmergency, isEmergency) ||
                other.isEmergency == isEmergency) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.seatId, seatId) || other.seatId == seatId) &&
            (identical(other.optimalExit, optimalExit) ||
                other.optimalExit == optimalExit) &&
            (identical(other.estimatedTime, estimatedTime) ||
                other.estimatedTime == estimatedTime) &&
            (identical(other.fireLocation, fireLocation) ||
                other.fireLocation == fireLocation) &&
            const DeepCollectionEquality()
                .equals(other._closedExits, _closedExits) &&
            const DeepCollectionEquality()
                .equals(other._evacuationPath, _evacuationPath) &&
            (identical(other.pathLength, pathLength) ||
                other.pathLength == pathLength) &&
            (identical(other.totalDistanceMm, totalDistanceMm) ||
                other.totalDistanceMm == totalDistanceMm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isEmergency,
      message,
      seatId,
      optimalExit,
      estimatedTime,
      fireLocation,
      const DeepCollectionEquality().hash(_closedExits),
      const DeepCollectionEquality().hash(_evacuationPath),
      pathLength,
      totalDistanceMm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EvacuationInfoResponseImplCopyWith<_$EvacuationInfoResponseImpl>
      get copyWith => __$$EvacuationInfoResponseImplCopyWithImpl<
          _$EvacuationInfoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EvacuationInfoResponseImplToJson(
      this,
    );
  }
}

abstract class _EvacuationInfoResponse implements EvacuationInfoResponse {
  const factory _EvacuationInfoResponse(
          {@JsonKey(name: 'is_emergency') required final bool isEmergency,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'seat_id') final String? seatId,
          @JsonKey(name: 'optimal_exit') final String? optimalExit,
          @JsonKey(name: 'estimated_time') final String? estimatedTime,
          @JsonKey(name: 'fire_location') final String? fireLocation,
          @JsonKey(name: 'closed_exits') final List<String>? closedExits,
          @JsonKey(name: 'evacuation_path') final List<String>? evacuationPath,
          @JsonKey(name: 'path_length') final int? pathLength,
          @JsonKey(name: 'total_distance_mm') final double? totalDistanceMm}) =
      _$EvacuationInfoResponseImpl;

  factory _EvacuationInfoResponse.fromJson(Map<String, dynamic> json) =
      _$EvacuationInfoResponseImpl.fromJson;

  @override
  @JsonKey(name: 'is_emergency')
  bool get isEmergency;
  @override // 일반 상황일 때
  @JsonKey(name: 'message')
  String? get message;
  @override // 긴급 상황일 때
  @JsonKey(name: 'seat_id')
  String? get seatId;
  @override
  @JsonKey(name: 'optimal_exit')
  String? get optimalExit;
  @override
  @JsonKey(name: 'estimated_time')
  String? get estimatedTime;
  @override
  @JsonKey(name: 'fire_location')
  String? get fireLocation;
  @override
  @JsonKey(name: 'closed_exits')
  List<String>? get closedExits;
  @override
  @JsonKey(name: 'evacuation_path')
  List<String>? get evacuationPath;
  @override
  @JsonKey(name: 'path_length')
  int? get pathLength;
  @override
  @JsonKey(name: 'total_distance_mm')
  double? get totalDistanceMm;
  @override
  @JsonKey(ignore: true)
  _$$EvacuationInfoResponseImplCopyWith<_$EvacuationInfoResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
