import 'package:freezed_annotation/freezed_annotation.dart';

part 'rental_request_model.freezed.dart';
part 'rental_request_model.g.dart';

@freezed
class RentalRequestModel with _$RentalRequestModel {
  const factory RentalRequestModel({
    String? id,
    required String userId,
    required String bikeId,
    required DateTime startDate,
    required String pickupLocation,
    required String phoneContact,
    String? status,
    DateTime? createdAt,
  }) = _RentalRequestModel;

  factory RentalRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RentalRequestModelFromJson(json);
}
