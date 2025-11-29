import 'package:freezed_annotation/freezed_annotation.dart';

part 'bike_model.freezed.dart';
part 'bike_model.g.dart';

@freezed
class BikeModel with _$BikeModel {
  const factory BikeModel({
    required int id,
    required String model,
    @JsonKey(name: 'photo_url') required String photoUrl,
    required int range,
    required int stock,
    String? description,
    String? color,
    @JsonKey(name: 'battery_capacity') double? batteryCapacity,
    @JsonKey(name: 'max_speed') double? maxSpeed,
    @JsonKey(name: 'rental_price_per_day') required num rentalPricePerDay,
  }) = _BikeModel;

  factory BikeModel.fromJson(Map<String, dynamic> json) =>
      _$BikeModelFromJson(json);
}
