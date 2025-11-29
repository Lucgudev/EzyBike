import 'package:freezed_annotation/freezed_annotation.dart';

part 'bike_rent_request_model.freezed.dart';
part 'bike_rent_request_model.g.dart';

@freezed
class BikeRentRequestModel with _$BikeRentRequestModel {
  const factory BikeRentRequestModel({
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'duration_id') required String duration,
    @JsonKey(name: 'user_id') required String userId,
    required String email,
    @JsonKey(name: 'bike_id') required int bikeId,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'pickup_area_id') required String pickupAreaId,
  }) = _BikeRentRequestModel;

  factory BikeRentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BikeRentRequestModelFromJson(json);
}
