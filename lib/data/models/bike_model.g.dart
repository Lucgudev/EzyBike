// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bike_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BikeModelImpl _$$BikeModelImplFromJson(Map<String, dynamic> json) =>
    _$BikeModelImpl(
      id: json['id'] as String,
      model: json['model'] as String,
      photoUrl: json['photoUrl'] as String,
      range: (json['range'] as num).toInt(),
      isAvailable: json['isAvailable'] as bool,
      description: json['description'] as String?,
      specifications: json['specifications'] as String?,
      batteryCapacity: (json['batteryCapacity'] as num?)?.toDouble(),
      maxSpeed: (json['maxSpeed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$BikeModelImplToJson(_$BikeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'photoUrl': instance.photoUrl,
      'range': instance.range,
      'isAvailable': instance.isAvailable,
      'description': instance.description,
      'specifications': instance.specifications,
      'batteryCapacity': instance.batteryCapacity,
      'maxSpeed': instance.maxSpeed,
    };
