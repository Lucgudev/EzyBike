// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SectionModelImpl _$$SectionModelImplFromJson(Map<String, dynamic> json) =>
    _$SectionModelImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      sectionType: $enumDecode(_$SectionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$SectionModelImplToJson(_$SectionModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'type': _$SectionTypeEnumMap[instance.sectionType]!,
    };

const _$SectionTypeEnumMap = {
  SectionType.promotion: 'promotion',
  SectionType.rentalPackage: 'rental_package',
  SectionType.listBike: 'list_bike',
};

_$HomeModelImpl _$$HomeModelImplFromJson(Map<String, dynamic> json) =>
    _$HomeModelImpl(
      sections: (json['sections'] as List<dynamic>)
          .map((e) => SectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomeModelImplToJson(_$HomeModelImpl instance) =>
    <String, dynamic>{'sections': instance.sections};
