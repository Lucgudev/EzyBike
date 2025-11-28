// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannerModelImpl _$$BannerModelImplFromJson(Map<String, dynamic> json) =>
    _$BannerModelImpl(
      id: (json['id'] as num).toInt(),
      photoUrl: json['photo_url'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      actionUrl: json['action_url'] as String?,
    );

Map<String, dynamic> _$$BannerModelImplToJson(_$BannerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photo_url': instance.photoUrl,
      'title': instance.title,
      'description': instance.description,
      'action_url': instance.actionUrl,
    };
