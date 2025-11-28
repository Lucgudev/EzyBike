import 'package:freezed_annotation/freezed_annotation.dart';

part 'bike_model.freezed.dart';
part 'bike_model.g.dart';

@freezed
class BikeModel with _$BikeModel {
  const factory BikeModel({
    required String id,
    required String model,
    required String photoUrl,
    required int range,
    required int stock,
    String? description,
    double? batteryCapacity,
    double? maxSpeed,
  }) = _BikeModel;

  factory BikeModel.fromJson(Map<String, dynamic> json) =>
      _$BikeModelFromJson(json);
}
