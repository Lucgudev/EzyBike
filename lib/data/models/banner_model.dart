import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

@freezed
class BannerModel with _$BannerModel {
  const factory BannerModel({
    required int id,
    @JsonKey(name: 'photo_url') required String photoUrl,
    String? title,
    String? description,
    @JsonKey(name: 'action_url') String? actionUrl,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}
