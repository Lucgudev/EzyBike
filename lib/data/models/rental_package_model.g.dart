// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentalPackageModelImpl _$$RentalPackageModelImplFromJson(
  Map<String, dynamic> json,
) => _$RentalPackageModelImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  price: json['price'] as num,
  terms: json['terms'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$$RentalPackageModelImplToJson(
  _$RentalPackageModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'price': instance.price,
  'terms': instance.terms,
  'description': instance.description,
};
