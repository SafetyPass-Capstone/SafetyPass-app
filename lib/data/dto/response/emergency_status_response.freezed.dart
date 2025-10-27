// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmergencyStatusResponse _$EmergencyStatusResponseFromJson(
    Map<String, dynamic> json) {
  return _EmergencyStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$EmergencyStatusResponse {
  @JsonKey(name: 'is_emergency')
  String? get isEmergency => throw _privateConstructorUsedError;
  @JsonKey(name: 'fire_node')
  String? get fireNode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmergencyStatusResponseCopyWith<EmergencyStatusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyStatusResponseCopyWith<$Res> {
  factory $EmergencyStatusResponseCopyWith(EmergencyStatusResponse value,
          $Res Function(EmergencyStatusResponse) then) =
      _$EmergencyStatusResponseCopyWithImpl<$Res, EmergencyStatusResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_emergency') String? isEmergency,
      @JsonKey(name: 'fire_node') String? fireNode});
}

/// @nodoc
class _$EmergencyStatusResponseCopyWithImpl<$Res,
        $Val extends EmergencyStatusResponse>
    implements $EmergencyStatusResponseCopyWith<$Res> {
  _$EmergencyStatusResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmergency = freezed,
    Object? fireNode = freezed,
  }) {
    return _then(_value.copyWith(
      isEmergency: freezed == isEmergency
          ? _value.isEmergency
          : isEmergency // ignore: cast_nullable_to_non_nullable
              as String?,
      fireNode: freezed == fireNode
          ? _value.fireNode
          : fireNode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmergencyStatusResponseImplCopyWith<$Res>
    implements $EmergencyStatusResponseCopyWith<$Res> {
  factory _$$EmergencyStatusResponseImplCopyWith(
          _$EmergencyStatusResponseImpl value,
          $Res Function(_$EmergencyStatusResponseImpl) then) =
      __$$EmergencyStatusResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_emergency') String? isEmergency,
      @JsonKey(name: 'fire_node') String? fireNode});
}

/// @nodoc
class __$$EmergencyStatusResponseImplCopyWithImpl<$Res>
    extends _$EmergencyStatusResponseCopyWithImpl<$Res,
        _$EmergencyStatusResponseImpl>
    implements _$$EmergencyStatusResponseImplCopyWith<$Res> {
  __$$EmergencyStatusResponseImplCopyWithImpl(
      _$EmergencyStatusResponseImpl _value,
      $Res Function(_$EmergencyStatusResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmergency = freezed,
    Object? fireNode = freezed,
  }) {
    return _then(_$EmergencyStatusResponseImpl(
      isEmergency: freezed == isEmergency
          ? _value.isEmergency
          : isEmergency // ignore: cast_nullable_to_non_nullable
              as String?,
      fireNode: freezed == fireNode
          ? _value.fireNode
          : fireNode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmergencyStatusResponseImpl implements _EmergencyStatusResponse {
  const _$EmergencyStatusResponseImpl(
      {@JsonKey(name: 'is_emergency') required this.isEmergency,
      @JsonKey(name: 'fire_node') required this.fireNode});

  factory _$EmergencyStatusResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmergencyStatusResponseImplFromJson(json);

  @override
  @JsonKey(name: 'is_emergency')
  final String? isEmergency;
  @override
  @JsonKey(name: 'fire_node')
  final String? fireNode;

  @override
  String toString() {
    return 'EmergencyStatusResponse(isEmergency: $isEmergency, fireNode: $fireNode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyStatusResponseImpl &&
            (identical(other.isEmergency, isEmergency) ||
                other.isEmergency == isEmergency) &&
            (identical(other.fireNode, fireNode) ||
                other.fireNode == fireNode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isEmergency, fireNode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencyStatusResponseImplCopyWith<_$EmergencyStatusResponseImpl>
      get copyWith => __$$EmergencyStatusResponseImplCopyWithImpl<
          _$EmergencyStatusResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmergencyStatusResponseImplToJson(
      this,
    );
  }
}

abstract class _EmergencyStatusResponse implements EmergencyStatusResponse {
  const factory _EmergencyStatusResponse(
          {@JsonKey(name: 'is_emergency') required final String? isEmergency,
          @JsonKey(name: 'fire_node') required final String? fireNode}) =
      _$EmergencyStatusResponseImpl;

  factory _EmergencyStatusResponse.fromJson(Map<String, dynamic> json) =
      _$EmergencyStatusResponseImpl.fromJson;

  @override
  @JsonKey(name: 'is_emergency')
  String? get isEmergency;
  @override
  @JsonKey(name: 'fire_node')
  String? get fireNode;
  @override
  @JsonKey(ignore: true)
  _$$EmergencyStatusResponseImplCopyWith<_$EmergencyStatusResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
