// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rent_duration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RentDurationModel _$RentDurationModelFromJson(Map<String, dynamic> json) {
  return _RentDurationModel.fromJson(json);
}

/// @nodoc
mixin _$RentDurationModel {
  String get id => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  /// Serializes this RentDurationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RentDurationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentDurationModelCopyWith<RentDurationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentDurationModelCopyWith<$Res> {
  factory $RentDurationModelCopyWith(
    RentDurationModel value,
    $Res Function(RentDurationModel) then,
  ) = _$RentDurationModelCopyWithImpl<$Res, RentDurationModel>;
  @useResult
  $Res call({String id, String duration, int value});
}

/// @nodoc
class _$RentDurationModelCopyWithImpl<$Res, $Val extends RentDurationModel>
    implements $RentDurationModelCopyWith<$Res> {
  _$RentDurationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentDurationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? duration = null,
    Object? value = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RentDurationModelImplCopyWith<$Res>
    implements $RentDurationModelCopyWith<$Res> {
  factory _$$RentDurationModelImplCopyWith(
    _$RentDurationModelImpl value,
    $Res Function(_$RentDurationModelImpl) then,
  ) = __$$RentDurationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String duration, int value});
}

/// @nodoc
class __$$RentDurationModelImplCopyWithImpl<$Res>
    extends _$RentDurationModelCopyWithImpl<$Res, _$RentDurationModelImpl>
    implements _$$RentDurationModelImplCopyWith<$Res> {
  __$$RentDurationModelImplCopyWithImpl(
    _$RentDurationModelImpl _value,
    $Res Function(_$RentDurationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RentDurationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? duration = null,
    Object? value = null,
  }) {
    return _then(
      _$RentDurationModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RentDurationModelImpl implements _RentDurationModel {
  const _$RentDurationModelImpl({
    required this.id,
    required this.duration,
    required this.value,
  });

  factory _$RentDurationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentDurationModelImplFromJson(json);

  @override
  final String id;
  @override
  final String duration;
  @override
  final int value;

  @override
  String toString() {
    return 'RentDurationModel(id: $id, duration: $duration, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentDurationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, duration, value);

  /// Create a copy of RentDurationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentDurationModelImplCopyWith<_$RentDurationModelImpl> get copyWith =>
      __$$RentDurationModelImplCopyWithImpl<_$RentDurationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RentDurationModelImplToJson(this);
  }
}

abstract class _RentDurationModel implements RentDurationModel {
  const factory _RentDurationModel({
    required final String id,
    required final String duration,
    required final int value,
  }) = _$RentDurationModelImpl;

  factory _RentDurationModel.fromJson(Map<String, dynamic> json) =
      _$RentDurationModelImpl.fromJson;

  @override
  String get id;
  @override
  String get duration;
  @override
  int get value;

  /// Create a copy of RentDurationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentDurationModelImplCopyWith<_$RentDurationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
