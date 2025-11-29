import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_bike_customer_app/data/models/pickup_location_model.dart';
import 'package:sample_bike_customer_app/data/models/rent_duration_model.dart';

part 'bike_rent_form_provider.g.dart';

@riverpod
class SelectedPickupLocation extends _$SelectedPickupLocation {
  @override
  PickupLocationModel? build() {
    return null;
  }

  void setLocation(PickupLocationModel? location) {
    state = location;
  }

  void clear() {
    state = null;
  }
}

@riverpod
class SelectedRentDuration extends _$SelectedRentDuration {
  @override
  RentDurationModel? build() {
    return null;
  }

  void setDuration(RentDurationModel? rentDuration) {
    state = rentDuration;
  }

  void clear() {
    state = null;
  }
}

@riverpod
class SelectedStartDate extends _$SelectedStartDate {
  @override
  DateTime? build() {
    return null;
  }

  void setDate(DateTime? date) {
    state = date;
  }

  void clear() {
    state = null;
  }
}

@riverpod
class PhoneNumber extends _$PhoneNumber {
  @override
  String build() {
    return '';
  }

  void setPhoneNumber(String phoneNumber) {
    state = phoneNumber;
  }

  void clear() {
    state = '';
  }
}
