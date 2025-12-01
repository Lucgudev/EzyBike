// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bike_rent_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BikeRentOrderModel _$BikeRentOrderModelFromJson(Map<String, dynamic> json) {
  return _BikeRentOrderModel.fromJson(json);
}

/// @nodoc
mixin _$BikeRentOrderModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime get startDate => throw _privateConstructorUsedError;
  BikeModel get bike => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_area')
  PickupLocationModel get pickupArea => throw _privateConstructorUsedError;
  RentDurationModel get duration => throw _privateConstructorUsedError;
  num get total => throw _privateConstructorUsedError;

  /// Serializes this BikeRentOrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BikeRentOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BikeRentOrderModelCopyWith<BikeRentOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BikeRentOrderModelCopyWith<$Res> {
  factory $BikeRentOrderModelCopyWith(
    BikeRentOrderModel value,
    $Res Function(BikeRentOrderModel) then,
  ) = _$BikeRentOrderModelCopyWithImpl<$Res, BikeRentOrderModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'start_date') DateTime startDate,
    BikeModel bike,
    @JsonKey(name: 'pickup_area') PickupLocationModel pickupArea,
    RentDurationModel duration,
    num total,
  });

  $BikeModelCopyWith<$Res> get bike;
  $PickupLocationModelCopyWith<$Res> get pickupArea;
  $RentDurationModelCopyWith<$Res> get duration;
}

/// @nodoc
class _$BikeRentOrderModelCopyWithImpl<$Res, $Val extends BikeRentOrderModel>
    implements $BikeRentOrderModelCopyWith<$Res> {
  _$BikeRentOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BikeRentOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? startDate = null,
    Object? bike = null,
    Object? pickupArea = null,
    Object? duration = null,
    Object? total = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            bike: null == bike
                ? _value.bike
                : bike // ignore: cast_nullable_to_non_nullable
                      as BikeModel,
            pickupArea: null == pickupArea
                ? _value.pickupArea
                : pickupArea // ignore: cast_nullable_to_non_nullable
                      as PickupLocationModel,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as RentDurationModel,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as num,
          )
          as $Val,
    );
  }

  /// Create a copy of BikeRentOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BikeModelCopyWith<$Res> get bike {
    return $BikeModelCopyWith<$Res>(_value.bike, (value) {
      return _then(_value.copyWith(bike: value) as $Val);
    });
  }

  /// Create a copy of BikeRentOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PickupLocationModelCopyWith<$Res> get pickupArea {
    return $PickupLocationModelCopyWith<$Res>(_value.pickupArea, (value) {
      return _then(_value.copyWith(pickupArea: value) as $Val);
    });
  }

  /// Create a copy of BikeRentOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RentDurationModelCopyWith<$Res> get duration {
    return $RentDurationModelCopyWith<$Res>(_value.duration, (value) {
      return _then(_value.copyWith(duration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BikeRentOrderModelImplCopyWith<$Res>
    implements $BikeRentOrderModelCopyWith<$Res> {
  factory _$$BikeRentOrderModelImplCopyWith(
    _$BikeRentOrderModelImpl value,
    $Res Function(_$BikeRentOrderModelImpl) then,
  ) = __$$BikeRentOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'start_date') DateTime startDate,
    BikeModel bike,
    @JsonKey(name: 'pickup_area') PickupLocationModel pickupArea,
    RentDurationModel duration,
    num total,
  });

  @override
  $BikeModelCopyWith<$Res> get bike;
  @override
  $PickupLocationModelCopyWith<$Res> get pickupArea;
  @override
  $RentDurationModelCopyWith<$Res> get duration;
}

/// @nodoc
class __$$BikeRentOrderModelImplCopyWithImpl<$Res>
    extends _$BikeRentOrderModelCopyWithImpl<$Res, _$BikeRentOrderModelImpl>
    implements _$$BikeRentOrderModelImplCopyWith<$Res> {
  __$$BikeRentOrderModelImplCopyWithImpl(
    _$BikeRentOrderModelImpl _value,
    $Res Function(_$BikeRentOrderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BikeRentOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? startDate = null,
    Object? bike = null,
    Object? pickupArea = null,
    Object? duration = null,
    Object? total = null,
  }) {
    return _then(
      _$BikeRentOrderModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        bike: null == bike
            ? _value.bike
            : bike // ignore: cast_nullable_to_non_nullable
                  as BikeModel,
        pickupArea: null == pickupArea
            ? _value.pickupArea
            : pickupArea // ignore: cast_nullable_to_non_nullable
                  as PickupLocationModel,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as RentDurationModel,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as num,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BikeRentOrderModelImpl implements _BikeRentOrderModel {
  const _$BikeRentOrderModelImpl({
    required this.id,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'start_date') required this.startDate,
    required this.bike,
    @JsonKey(name: 'pickup_area') required this.pickupArea,
    required this.duration,
    required this.total,
  });

  factory _$BikeRentOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BikeRentOrderModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  final BikeModel bike;
  @override
  @JsonKey(name: 'pickup_area')
  final PickupLocationModel pickupArea;
  @override
  final RentDurationModel duration;
  @override
  final num total;

  @override
  String toString() {
    return 'BikeRentOrderModel(id: $id, createdAt: $createdAt, startDate: $startDate, bike: $bike, pickupArea: $pickupArea, duration: $duration, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BikeRentOrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.bike, bike) || other.bike == bike) &&
            (identical(other.pickupArea, pickupArea) ||
                other.pickupArea == pickupArea) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    startDate,
    bike,
    pickupArea,
    duration,
    total,
  );

  /// Create a copy of BikeRentOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BikeRentOrderModelImplCopyWith<_$BikeRentOrderModelImpl> get copyWith =>
      __$$BikeRentOrderModelImplCopyWithImpl<_$BikeRentOrderModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BikeRentOrderModelImplToJson(this);
  }
}

abstract class _BikeRentOrderModel implements BikeRentOrderModel {
  const factory _BikeRentOrderModel({
    required final int id,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'start_date') required final DateTime startDate,
    required final BikeModel bike,
    @JsonKey(name: 'pickup_area') required final PickupLocationModel pickupArea,
    required final RentDurationModel duration,
    required final num total,
  }) = _$BikeRentOrderModelImpl;

  factory _BikeRentOrderModel.fromJson(Map<String, dynamic> json) =
      _$BikeRentOrderModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @override
  BikeModel get bike;
  @override
  @JsonKey(name: 'pickup_area')
  PickupLocationModel get pickupArea;
  @override
  RentDurationModel get duration;
  @override
  num get total;

  /// Create a copy of BikeRentOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BikeRentOrderModelImplCopyWith<_$BikeRentOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
