import 'package:freezed_annotation/freezed_annotation.dart';
import 'bike_model.dart';
import 'pickup_location_model.dart';
import 'rent_duration_model.dart';

part 'bike_rent_order_model.freezed.dart';
part 'bike_rent_order_model.g.dart';

@freezed
class BikeRentOrderModel with _$BikeRentOrderModel {
  const factory BikeRentOrderModel({
    required int id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'start_date') required DateTime startDate,
    required BikeModel bike,
    @JsonKey(name: 'pickup_area') required PickupLocationModel pickupArea,
    required RentDurationModel duration,
    required num total,
  }) = _BikeRentOrderModel;

  factory BikeRentOrderModel.fromJson(Map<String, dynamic> json) =>
      _$BikeRentOrderModelFromJson(json);
}
