import 'package:freezed_annotation/freezed_annotation.dart';

part 'rent_duration_model.freezed.dart';
part 'rent_duration_model.g.dart';

@freezed
class RentDurationModel with _$RentDurationModel {
  const factory RentDurationModel({
    required String id,
    required String duration,
    required int value,
  }) = _RentDurationModel;

  factory RentDurationModel.fromJson(Map<String, dynamic> json) =>
      _$RentDurationModelFromJson(json);
}
