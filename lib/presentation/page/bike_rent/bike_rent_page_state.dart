import 'package:freezed_annotation/freezed_annotation.dart';

part 'bike_rent_page_state.freezed.dart';

@freezed
class BikeRentPageState with _$BikeRentPageState {
  const factory BikeRentPageState({
    @Default(false) bool isFormValid,
  }) = _BikeRentPageState;
}
