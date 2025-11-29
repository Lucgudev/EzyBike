// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bike_rent_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BikeRentRequestModel _$BikeRentRequestModelFromJson(Map<String, dynamic> json) {
  return _BikeRentRequestModel.fromJson(json);
}

/// @nodoc
mixin _$BikeRentRequestModel {
  @JsonKey(name: 'start_date')
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_id')
  String get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'bike_id')
  int get bikeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_area_id')
  String get pickupAreaId => throw _privateConstructorUsedError;

  /// Serializes this BikeRentRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BikeRentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BikeRentRequestModelCopyWith<BikeRentRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BikeRentRequestModelCopyWith<$Res> {
  factory $BikeRentRequestModelCopyWith(
    BikeRentRequestModel value,
    $Res Function(BikeRentRequestModel) then,
  ) = _$BikeRentRequestModelCopyWithImpl<$Res, BikeRentRequestModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'start_date') DateTime startDate,
    @JsonKey(name: 'duration_id') String duration,
    @JsonKey(name: 'user_id') String userId,
    String email,
    @JsonKey(name: 'bike_id') int bikeId,
    @JsonKey(name: 'phone_number') String phoneNumber,
    @JsonKey(name: 'pickup_area_id') String pickupAreaId,
  });
}

/// @nodoc
class _$BikeRentRequestModelCopyWithImpl<
  $Res,
  $Val extends BikeRentRequestModel
>
    implements $BikeRentRequestModelCopyWith<$Res> {
  _$BikeRentRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BikeRentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? duration = null,
    Object? userId = null,
    Object? email = null,
    Object? bikeId = null,
    Object? phoneNumber = null,
    Object? pickupAreaId = null,
  }) {
    return _then(
      _value.copyWith(
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            bikeId: null == bikeId
                ? _value.bikeId
                : bikeId // ignore: cast_nullable_to_non_nullable
                      as int,
            phoneNumber: null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            pickupAreaId: null == pickupAreaId
                ? _value.pickupAreaId
                : pickupAreaId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BikeRentRequestModelImplCopyWith<$Res>
    implements $BikeRentRequestModelCopyWith<$Res> {
  factory _$$BikeRentRequestModelImplCopyWith(
    _$BikeRentRequestModelImpl value,
    $Res Function(_$BikeRentRequestModelImpl) then,
  ) = __$$BikeRentRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'start_date') DateTime startDate,
    @JsonKey(name: 'duration_id') String duration,
    @JsonKey(name: 'user_id') String userId,
    String email,
    @JsonKey(name: 'bike_id') int bikeId,
    @JsonKey(name: 'phone_number') String phoneNumber,
    @JsonKey(name: 'pickup_area_id') String pickupAreaId,
  });
}

/// @nodoc
class __$$BikeRentRequestModelImplCopyWithImpl<$Res>
    extends _$BikeRentRequestModelCopyWithImpl<$Res, _$BikeRentRequestModelImpl>
    implements _$$BikeRentRequestModelImplCopyWith<$Res> {
  __$$BikeRentRequestModelImplCopyWithImpl(
    _$BikeRentRequestModelImpl _value,
    $Res Function(_$BikeRentRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BikeRentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? duration = null,
    Object? userId = null,
    Object? email = null,
    Object? bikeId = null,
    Object? phoneNumber = null,
    Object? pickupAreaId = null,
  }) {
    return _then(
      _$BikeRentRequestModelImpl(
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        bikeId: null == bikeId
            ? _value.bikeId
            : bikeId // ignore: cast_nullable_to_non_nullable
                  as int,
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        pickupAreaId: null == pickupAreaId
            ? _value.pickupAreaId
            : pickupAreaId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BikeRentRequestModelImpl implements _BikeRentRequestModel {
  const _$BikeRentRequestModelImpl({
    @JsonKey(name: 'start_date') required this.startDate,
    @JsonKey(name: 'duration_id') required this.duration,
    @JsonKey(name: 'user_id') required this.userId,
    required this.email,
    @JsonKey(name: 'bike_id') required this.bikeId,
    @JsonKey(name: 'phone_number') required this.phoneNumber,
    @JsonKey(name: 'pickup_area_id') required this.pickupAreaId,
  });

  factory _$BikeRentRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BikeRentRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  @JsonKey(name: 'duration_id')
  final String duration;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String email;
  @override
  @JsonKey(name: 'bike_id')
  final int bikeId;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  @JsonKey(name: 'pickup_area_id')
  final String pickupAreaId;

  @override
  String toString() {
    return 'BikeRentRequestModel(startDate: $startDate, duration: $duration, userId: $userId, email: $email, bikeId: $bikeId, phoneNumber: $phoneNumber, pickupAreaId: $pickupAreaId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BikeRentRequestModelImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.bikeId, bikeId) || other.bikeId == bikeId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.pickupAreaId, pickupAreaId) ||
                other.pickupAreaId == pickupAreaId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    startDate,
    duration,
    userId,
    email,
    bikeId,
    phoneNumber,
    pickupAreaId,
  );

  /// Create a copy of BikeRentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BikeRentRequestModelImplCopyWith<_$BikeRentRequestModelImpl>
  get copyWith =>
      __$$BikeRentRequestModelImplCopyWithImpl<_$BikeRentRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BikeRentRequestModelImplToJson(this);
  }
}

abstract class _BikeRentRequestModel implements BikeRentRequestModel {
  const factory _BikeRentRequestModel({
    @JsonKey(name: 'start_date') required final DateTime startDate,
    @JsonKey(name: 'duration_id') required final String duration,
    @JsonKey(name: 'user_id') required final String userId,
    required final String email,
    @JsonKey(name: 'bike_id') required final int bikeId,
    @JsonKey(name: 'phone_number') required final String phoneNumber,
    @JsonKey(name: 'pickup_area_id') required final String pickupAreaId,
  }) = _$BikeRentRequestModelImpl;

  factory _BikeRentRequestModel.fromJson(Map<String, dynamic> json) =
      _$BikeRentRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @override
  @JsonKey(name: 'duration_id')
  String get duration;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String get email;
  @override
  @JsonKey(name: 'bike_id')
  int get bikeId;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  @JsonKey(name: 'pickup_area_id')
  String get pickupAreaId;

  /// Create a copy of BikeRentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BikeRentRequestModelImplCopyWith<_$BikeRentRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
