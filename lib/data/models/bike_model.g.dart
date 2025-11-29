// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bike_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BikeModelImpl _$$BikeModelImplFromJson(Map<String, dynamic> json) =>
    _$BikeModelImpl(
      id: (json['id'] as num).toInt(),
      model: json['model'] as String,
      photoUrl: json['photo_url'] as String,
      range: (json['range'] as num).toInt(),
      stock: (json['stock'] as num).toInt(),
      description: json['description'] as String?,
      color: json['color'] as String?,
      batteryCapacity: (json['battery_capacity'] as num?)?.toDouble(),
      maxSpeed: (json['max_speed'] as num?)?.toDouble(),
      rentalPricePerDay: json['rental_price_per_day'] as num,
    );

Map<String, dynamic> _$$BikeModelImplToJson(_$BikeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'photo_url': instance.photoUrl,
      'range': instance.range,
      'stock': instance.stock,
      'description': instance.description,
      'color': instance.color,
      'battery_capacity': instance.batteryCapacity,
      'max_speed': instance.maxSpeed,
      'rental_price_per_day': instance.rentalPricePerDay,
    };
