import 'package:freezed_annotation/freezed_annotation.dart';

part 'rental_package_model.freezed.dart';
part 'rental_package_model.g.dart';

@freezed
class RentalPackageModel with _$RentalPackageModel {
  const factory RentalPackageModel({
    required String id,
    required String plan,
    required double pricePerDay,
    required double pricePerWeek,
    required double pricePerMonth,
    required String terms,
    String? description,
  }) = _RentalPackageModel;

  factory RentalPackageModel.fromJson(Map<String, dynamic> json) =>
      _$RentalPackageModelFromJson(json);
}
