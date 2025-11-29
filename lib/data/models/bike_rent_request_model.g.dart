// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bike_rent_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BikeRentRequestModelImpl _$$BikeRentRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$BikeRentRequestModelImpl(
  startDate: DateTime.parse(json['start_date'] as String),
  duration: json['duration_id'] as String,
  userId: json['user_id'] as String,
  email: json['email'] as String,
  bikeId: (json['bike_id'] as num).toInt(),
  phoneNumber: json['phone_number'] as String,
  pickupAreaId: json['pickup_area_id'] as String,
);

Map<String, dynamic> _$$BikeRentRequestModelImplToJson(
  _$BikeRentRequestModelImpl instance,
) => <String, dynamic>{
  'start_date': instance.startDate.toIso8601String(),
  'duration_id': instance.duration,
  'user_id': instance.userId,
  'email': instance.email,
  'bike_id': instance.bikeId,
  'phone_number': instance.phoneNumber,
  'pickup_area_id': instance.pickupAreaId,
};
