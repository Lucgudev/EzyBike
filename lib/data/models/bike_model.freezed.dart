// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bike_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BikeModel _$BikeModelFromJson(Map<String, dynamic> json) {
  return _BikeModel.fromJson(json);
}

/// @nodoc
mixin _$BikeModel {
  String get id => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  int get range => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get specifications => throw _privateConstructorUsedError;
  double? get batteryCapacity => throw _privateConstructorUsedError;
  double? get maxSpeed => throw _privateConstructorUsedError;

  /// Serializes this BikeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BikeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BikeModelCopyWith<BikeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BikeModelCopyWith<$Res> {
  factory $BikeModelCopyWith(BikeModel value, $Res Function(BikeModel) then) =
      _$BikeModelCopyWithImpl<$Res, BikeModel>;
  @useResult
  $Res call({
    String id,
    String model,
    String photoUrl,
    int range,
    bool isAvailable,
    String? description,
    String? specifications,
    double? batteryCapacity,
    double? maxSpeed,
  });
}

/// @nodoc
class _$BikeModelCopyWithImpl<$Res, $Val extends BikeModel>
    implements $BikeModelCopyWith<$Res> {
  _$BikeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BikeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? model = null,
    Object? photoUrl = null,
    Object? range = null,
    Object? isAvailable = null,
    Object? description = freezed,
    Object? specifications = freezed,
    Object? batteryCapacity = freezed,
    Object? maxSpeed = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            model: null == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                      as String,
            photoUrl: null == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            range: null == range
                ? _value.range
                : range // ignore: cast_nullable_to_non_nullable
                      as int,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            specifications: freezed == specifications
                ? _value.specifications
                : specifications // ignore: cast_nullable_to_non_nullable
                      as String?,
            batteryCapacity: freezed == batteryCapacity
                ? _value.batteryCapacity
                : batteryCapacity // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxSpeed: freezed == maxSpeed
                ? _value.maxSpeed
                : maxSpeed // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BikeModelImplCopyWith<$Res>
    implements $BikeModelCopyWith<$Res> {
  factory _$$BikeModelImplCopyWith(
    _$BikeModelImpl value,
    $Res Function(_$BikeModelImpl) then,
  ) = __$$BikeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String model,
    String photoUrl,
    int range,
    bool isAvailable,
    String? description,
    String? specifications,
    double? batteryCapacity,
    double? maxSpeed,
  });
}

/// @nodoc
class __$$BikeModelImplCopyWithImpl<$Res>
    extends _$BikeModelCopyWithImpl<$Res, _$BikeModelImpl>
    implements _$$BikeModelImplCopyWith<$Res> {
  __$$BikeModelImplCopyWithImpl(
    _$BikeModelImpl _value,
    $Res Function(_$BikeModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BikeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? model = null,
    Object? photoUrl = null,
    Object? range = null,
    Object? isAvailable = null,
    Object? description = freezed,
    Object? specifications = freezed,
    Object? batteryCapacity = freezed,
    Object? maxSpeed = freezed,
  }) {
    return _then(
      _$BikeModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        model: null == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
        photoUrl: null == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        range: null == range
            ? _value.range
            : range // ignore: cast_nullable_to_non_nullable
                  as int,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        specifications: freezed == specifications
            ? _value.specifications
            : specifications // ignore: cast_nullable_to_non_nullable
                  as String?,
        batteryCapacity: freezed == batteryCapacity
            ? _value.batteryCapacity
            : batteryCapacity // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxSpeed: freezed == maxSpeed
            ? _value.maxSpeed
            : maxSpeed // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BikeModelImpl implements _BikeModel {
  const _$BikeModelImpl({
    required this.id,
    required this.model,
    required this.photoUrl,
    required this.range,
    required this.isAvailable,
    this.description,
    this.specifications,
    this.batteryCapacity,
    this.maxSpeed,
  });

  factory _$BikeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BikeModelImplFromJson(json);

  @override
  final String id;
  @override
  final String model;
  @override
  final String photoUrl;
  @override
  final int range;
  @override
  final bool isAvailable;
  @override
  final String? description;
  @override
  final String? specifications;
  @override
  final double? batteryCapacity;
  @override
  final double? maxSpeed;

  @override
  String toString() {
    return 'BikeModel(id: $id, model: $model, photoUrl: $photoUrl, range: $range, isAvailable: $isAvailable, description: $description, specifications: $specifications, batteryCapacity: $batteryCapacity, maxSpeed: $maxSpeed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BikeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.range, range) || other.range == range) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.specifications, specifications) ||
                other.specifications == specifications) &&
            (identical(other.batteryCapacity, batteryCapacity) ||
                other.batteryCapacity == batteryCapacity) &&
            (identical(other.maxSpeed, maxSpeed) ||
                other.maxSpeed == maxSpeed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    model,
    photoUrl,
    range,
    isAvailable,
    description,
    specifications,
    batteryCapacity,
    maxSpeed,
  );

  /// Create a copy of BikeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BikeModelImplCopyWith<_$BikeModelImpl> get copyWith =>
      __$$BikeModelImplCopyWithImpl<_$BikeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BikeModelImplToJson(this);
  }
}

abstract class _BikeModel implements BikeModel {
  const factory _BikeModel({
    required final String id,
    required final String model,
    required final String photoUrl,
    required final int range,
    required final bool isAvailable,
    final String? description,
    final String? specifications,
    final double? batteryCapacity,
    final double? maxSpeed,
  }) = _$BikeModelImpl;

  factory _BikeModel.fromJson(Map<String, dynamic> json) =
      _$BikeModelImpl.fromJson;

  @override
  String get id;
  @override
  String get model;
  @override
  String get photoUrl;
  @override
  int get range;
  @override
  bool get isAvailable;
  @override
  String? get description;
  @override
  String? get specifications;
  @override
  double? get batteryCapacity;
  @override
  double? get maxSpeed;

  /// Create a copy of BikeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BikeModelImplCopyWith<_$BikeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
