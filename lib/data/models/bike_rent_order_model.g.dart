// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bike_rent_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BikeRentOrderModelImpl _$$BikeRentOrderModelImplFromJson(
  Map<String, dynamic> json,
) => _$BikeRentOrderModelImpl(
  id: (json['id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  startDate: DateTime.parse(json['start_date'] as String),
  bike: BikeModel.fromJson(json['bike'] as Map<String, dynamic>),
  pickupArea: PickupLocationModel.fromJson(
    json['pickup_area'] as Map<String, dynamic>,
  ),
  duration: RentDurationModel.fromJson(
    json['duration'] as Map<String, dynamic>,
  ),
  total: json['total'] as num,
);

Map<String, dynamic> _$$BikeRentOrderModelImplToJson(
  _$BikeRentOrderModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'start_date': instance.startDate.toIso8601String(),
  'bike': instance.bike,
  'pickup_area': instance.pickupArea,
  'duration': instance.duration,
  'total': instance.total,
};
