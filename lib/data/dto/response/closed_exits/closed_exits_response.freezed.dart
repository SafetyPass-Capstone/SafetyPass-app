// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'closed_exits_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClosedExitsResponse _$ClosedExitsResponseFromJson(Map<String, dynamic> json) {
  return _ClosedExitsResponse.fromJson(json);
}

/// @nodoc
mixin _$ClosedExitsResponse {
  @JsonKey(name: 'closed_exits')
  List<String>? get closedExits => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_exits')
  int? get totalExits => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_exits')
  int? get activeExits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClosedExitsResponseCopyWith<ClosedExitsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosedExitsResponseCopyWith<$Res> {
  factory $ClosedExitsResponseCopyWith(
          ClosedExitsResponse value, $Res Function(ClosedExitsResponse) then) =
      _$ClosedExitsResponseCopyWithImpl<$Res, ClosedExitsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'closed_exits') List<String>? closedExits,
      @JsonKey(name: 'total_exits') int? totalExits,
      @JsonKey(name: 'active_exits') int? activeExits});
}

/// @nodoc
class _$ClosedExitsResponseCopyWithImpl<$Res, $Val extends ClosedExitsResponse>
    implements $ClosedExitsResponseCopyWith<$Res> {
  _$ClosedExitsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? closedExits = freezed,
    Object? totalExits = freezed,
    Object? activeExits = freezed,
  }) {
    return _then(_value.copyWith(
      closedExits: freezed == closedExits
          ? _value.closedExits
          : closedExits // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      totalExits: freezed == totalExits
          ? _value.totalExits
          : totalExits // ignore: cast_nullable_to_non_nullable
              as int?,
      activeExits: freezed == activeExits
          ? _value.activeExits
          : activeExits // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClosedExitsResponseImplCopyWith<$Res>
    implements $ClosedExitsResponseCopyWith<$Res> {
  factory _$$ClosedExitsResponseImplCopyWith(_$ClosedExitsResponseImpl value,
          $Res Function(_$ClosedExitsResponseImpl) then) =
      __$$ClosedExitsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'closed_exits') List<String>? closedExits,
      @JsonKey(name: 'total_exits') int? totalExits,
      @JsonKey(name: 'active_exits') int? activeExits});
}

/// @nodoc
class __$$ClosedExitsResponseImplCopyWithImpl<$Res>
    extends _$ClosedExitsResponseCopyWithImpl<$Res, _$ClosedExitsResponseImpl>
    implements _$$ClosedExitsResponseImplCopyWith<$Res> {
  __$$ClosedExitsResponseImplCopyWithImpl(_$ClosedExitsResponseImpl _value,
      $Res Function(_$ClosedExitsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? closedExits = freezed,
    Object? totalExits = freezed,
    Object? activeExits = freezed,
  }) {
    return _then(_$ClosedExitsResponseImpl(
      closedExits: freezed == closedExits
          ? _value._closedExits
          : closedExits // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      totalExits: freezed == totalExits
          ? _value.totalExits
          : totalExits // ignore: cast_nullable_to_non_nullable
              as int?,
      activeExits: freezed == activeExits
          ? _value.activeExits
          : activeExits // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClosedExitsResponseImpl implements _ClosedExitsResponse {
  const _$ClosedExitsResponseImpl(
      {@JsonKey(name: 'closed_exits') required final List<String>? closedExits,
      @JsonKey(name: 'total_exits') required this.totalExits,
      @JsonKey(name: 'active_exits') required this.activeExits})
      : _closedExits = closedExits;

  factory _$ClosedExitsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClosedExitsResponseImplFromJson(json);

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

  @override
  @JsonKey(name: 'total_exits')
  final int? totalExits;
  @override
  @JsonKey(name: 'active_exits')
  final int? activeExits;

  @override
  String toString() {
    return 'ClosedExitsResponse(closedExits: $closedExits, totalExits: $totalExits, activeExits: $activeExits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosedExitsResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._closedExits, _closedExits) &&
            (identical(other.totalExits, totalExits) ||
                other.totalExits == totalExits) &&
            (identical(other.activeExits, activeExits) ||
                other.activeExits == activeExits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_closedExits),
      totalExits,
      activeExits);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosedExitsResponseImplCopyWith<_$ClosedExitsResponseImpl> get copyWith =>
      __$$ClosedExitsResponseImplCopyWithImpl<_$ClosedExitsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClosedExitsResponseImplToJson(
      this,
    );
  }
}

abstract class _ClosedExitsResponse implements ClosedExitsResponse {
  const factory _ClosedExitsResponse(
      {@JsonKey(name: 'closed_exits') required final List<String>? closedExits,
      @JsonKey(name: 'total_exits') required final int? totalExits,
      @JsonKey(name: 'active_exits')
      required final int? activeExits}) = _$ClosedExitsResponseImpl;

  factory _ClosedExitsResponse.fromJson(Map<String, dynamic> json) =
      _$ClosedExitsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'closed_exits')
  List<String>? get closedExits;
  @override
  @JsonKey(name: 'total_exits')
  int? get totalExits;
  @override
  @JsonKey(name: 'active_exits')
  int? get activeExits;
  @override
  @JsonKey(ignore: true)
  _$$ClosedExitsResponseImplCopyWith<_$ClosedExitsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
