// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_duration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentDurationModelImpl _$$RentDurationModelImplFromJson(
  Map<String, dynamic> json,
) => _$RentDurationModelImpl(
  id: json['id'] as String,
  duration: json['duration'] as String,
  value: (json['value'] as num).toInt(),
);

Map<String, dynamic> _$$RentDurationModelImplToJson(
  _$RentDurationModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'duration': instance.duration,
  'value': instance.value,
};
