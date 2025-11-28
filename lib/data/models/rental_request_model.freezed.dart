// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RentalRequestModel _$RentalRequestModelFromJson(Map<String, dynamic> json) {
  return _RentalRequestModel.fromJson(json);
}

/// @nodoc
mixin _$RentalRequestModel {
  String? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get bikeId => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  String get pickupLocation => throw _privateConstructorUsedError;
  String get phoneContact => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this RentalRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RentalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentalRequestModelCopyWith<RentalRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalRequestModelCopyWith<$Res> {
  factory $RentalRequestModelCopyWith(
    RentalRequestModel value,
    $Res Function(RentalRequestModel) then,
  ) = _$RentalRequestModelCopyWithImpl<$Res, RentalRequestModel>;
  @useResult
  $Res call({
    String? id,
    String userId,
    String bikeId,
    DateTime startDate,
    String pickupLocation,
    String phoneContact,
    String? status,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$RentalRequestModelCopyWithImpl<$Res, $Val extends RentalRequestModel>
    implements $RentalRequestModelCopyWith<$Res> {
  _$RentalRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? bikeId = null,
    Object? startDate = null,
    Object? pickupLocation = null,
    Object? phoneContact = null,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            bikeId:
                null == bikeId
                    ? _value.bikeId
                    : bikeId // ignore: cast_nullable_to_non_nullable
                        as String,
            startDate:
                null == startDate
                    ? _value.startDate
                    : startDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            pickupLocation:
                null == pickupLocation
                    ? _value.pickupLocation
                    : pickupLocation // ignore: cast_nullable_to_non_nullable
                        as String,
            phoneContact:
                null == phoneContact
                    ? _value.phoneContact
                    : phoneContact // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RentalRequestModelImplCopyWith<$Res>
    implements $RentalRequestModelCopyWith<$Res> {
  factory _$$RentalRequestModelImplCopyWith(
    _$RentalRequestModelImpl value,
    $Res Function(_$RentalRequestModelImpl) then,
  ) = __$$RentalRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String userId,
    String bikeId,
    DateTime startDate,
    String pickupLocation,
    String phoneContact,
    String? status,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$RentalRequestModelImplCopyWithImpl<$Res>
    extends _$RentalRequestModelCopyWithImpl<$Res, _$RentalRequestModelImpl>
    implements _$$RentalRequestModelImplCopyWith<$Res> {
  __$$RentalRequestModelImplCopyWithImpl(
    _$RentalRequestModelImpl _value,
    $Res Function(_$RentalRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RentalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? bikeId = null,
    Object? startDate = null,
    Object? pickupLocation = null,
    Object? phoneContact = null,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$RentalRequestModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        bikeId:
            null == bikeId
                ? _value.bikeId
                : bikeId // ignore: cast_nullable_to_non_nullable
                    as String,
        startDate:
            null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        pickupLocation:
            null == pickupLocation
                ? _value.pickupLocation
                : pickupLocation // ignore: cast_nullable_to_non_nullable
                    as String,
        phoneContact:
            null == phoneContact
                ? _value.phoneContact
                : phoneContact // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RentalRequestModelImpl implements _RentalRequestModel {
  const _$RentalRequestModelImpl({
    this.id,
    required this.userId,
    required this.bikeId,
    required this.startDate,
    required this.pickupLocation,
    required this.phoneContact,
    this.status,
    this.createdAt,
  });

  factory _$RentalRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentalRequestModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String userId;
  @override
  final String bikeId;
  @override
  final DateTime startDate;
  @override
  final String pickupLocation;
  @override
  final String phoneContact;
  @override
  final String? status;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'RentalRequestModel(id: $id, userId: $userId, bikeId: $bikeId, startDate: $startDate, pickupLocation: $pickupLocation, phoneContact: $phoneContact, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentalRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.bikeId, bikeId) || other.bikeId == bikeId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.phoneContact, phoneContact) ||
                other.phoneContact == phoneContact) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    bikeId,
    startDate,
    pickupLocation,
    phoneContact,
    status,
    createdAt,
  );

  /// Create a copy of RentalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentalRequestModelImplCopyWith<_$RentalRequestModelImpl> get copyWith =>
      __$$RentalRequestModelImplCopyWithImpl<_$RentalRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RentalRequestModelImplToJson(this);
  }
}

abstract class _RentalRequestModel implements RentalRequestModel {
  const factory _RentalRequestModel({
    final String? id,
    required final String userId,
    required final String bikeId,
    required final DateTime startDate,
    required final String pickupLocation,
    required final String phoneContact,
    final String? status,
    final DateTime? createdAt,
  }) = _$RentalRequestModelImpl;

  factory _RentalRequestModel.fromJson(Map<String, dynamic> json) =
      _$RentalRequestModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get userId;
  @override
  String get bikeId;
  @override
  DateTime get startDate;
  @override
  String get pickupLocation;
  @override
  String get phoneContact;
  @override
  String? get status;
  @override
  DateTime? get createdAt;

  /// Create a copy of RentalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentalRequestModelImplCopyWith<_$RentalRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
