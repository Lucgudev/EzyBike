import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

enum SectionType {
  @JsonValue('promotion')
  promotion,
  @JsonValue('rental_package')
  rentalPackage,
  @JsonValue('list_bike')
  listBike,
}

@freezed
class SectionModel with _$SectionModel {
  const factory SectionModel({
    required String title,
    required String description,
    required SectionType sectionType,
  }) = _SectionModel;

  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);
}

@freezed
class HomeModel with _$HomeModel {
  const factory HomeModel({
    required List<SectionModel> sections,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}
