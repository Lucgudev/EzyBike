import 'package:freezed_annotation/freezed_annotation.dart';

part 'pickup_location_model.freezed.dart';
part 'pickup_location_model.g.dart';

@freezed
class PickupLocationModel with _$PickupLocationModel {
  const factory PickupLocationModel({
    required String id,
    required String name,
  }) = _PickupLocationModel;

  factory PickupLocationModel.fromJson(Map<String, dynamic> json) =>
      _$PickupLocationModelFromJson(json);
}
