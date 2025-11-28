// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentalRequestModelImpl _$$RentalRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$RentalRequestModelImpl(
  id: json['id'] as String?,
  userId: json['userId'] as String,
  bikeId: json['bikeId'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  pickupLocation: json['pickupLocation'] as String,
  phoneContact: json['phoneContact'] as String,
  status: json['status'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$RentalRequestModelImplToJson(
  _$RentalRequestModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'bikeId': instance.bikeId,
  'startDate': instance.startDate.toIso8601String(),
  'pickupLocation': instance.pickupLocation,
  'phoneContact': instance.phoneContact,
  'status': instance.status,
  'createdAt': instance.createdAt?.toIso8601String(),
};
