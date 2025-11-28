// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentalPackageModelImpl _$$RentalPackageModelImplFromJson(
  Map<String, dynamic> json,
) => _$RentalPackageModelImpl(
  id: json['id'] as String,
  plan: json['plan'] as String,
  pricePerDay: (json['pricePerDay'] as num).toDouble(),
  pricePerWeek: (json['pricePerWeek'] as num).toDouble(),
  pricePerMonth: (json['pricePerMonth'] as num).toDouble(),
  terms: json['terms'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$$RentalPackageModelImplToJson(
  _$RentalPackageModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'plan': instance.plan,
  'pricePerDay': instance.pricePerDay,
  'pricePerWeek': instance.pricePerWeek,
  'pricePerMonth': instance.pricePerMonth,
  'terms': instance.terms,
  'description': instance.description,
};
