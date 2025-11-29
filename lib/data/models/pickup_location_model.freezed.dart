// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pickup_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PickupLocationModel _$PickupLocationModelFromJson(Map<String, dynamic> json) {
  return _PickupLocationModel.fromJson(json);
}

/// @nodoc
mixin _$PickupLocationModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this PickupLocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PickupLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PickupLocationModelCopyWith<PickupLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickupLocationModelCopyWith<$Res> {
  factory $PickupLocationModelCopyWith(
    PickupLocationModel value,
    $Res Function(PickupLocationModel) then,
  ) = _$PickupLocationModelCopyWithImpl<$Res, PickupLocationModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$PickupLocationModelCopyWithImpl<$Res, $Val extends PickupLocationModel>
    implements $PickupLocationModelCopyWith<$Res> {
  _$PickupLocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PickupLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PickupLocationModelImplCopyWith<$Res>
    implements $PickupLocationModelCopyWith<$Res> {
  factory _$$PickupLocationModelImplCopyWith(
    _$PickupLocationModelImpl value,
    $Res Function(_$PickupLocationModelImpl) then,
  ) = __$$PickupLocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$PickupLocationModelImplCopyWithImpl<$Res>
    extends _$PickupLocationModelCopyWithImpl<$Res, _$PickupLocationModelImpl>
    implements _$$PickupLocationModelImplCopyWith<$Res> {
  __$$PickupLocationModelImplCopyWithImpl(
    _$PickupLocationModelImpl _value,
    $Res Function(_$PickupLocationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PickupLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$PickupLocationModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PickupLocationModelImpl implements _PickupLocationModel {
  const _$PickupLocationModelImpl({required this.id, required this.name});

  factory _$PickupLocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PickupLocationModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'PickupLocationModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickupLocationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of PickupLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickupLocationModelImplCopyWith<_$PickupLocationModelImpl> get copyWith =>
      __$$PickupLocationModelImplCopyWithImpl<_$PickupLocationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PickupLocationModelImplToJson(this);
  }
}

abstract class _PickupLocationModel implements PickupLocationModel {
  const factory _PickupLocationModel({
    required final String id,
    required final String name,
  }) = _$PickupLocationModelImpl;

  factory _PickupLocationModel.fromJson(Map<String, dynamic> json) =
      _$PickupLocationModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of PickupLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickupLocationModelImplCopyWith<_$PickupLocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
