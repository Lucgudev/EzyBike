import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_bike_customer_app/data/models/bike_model.dart';
import 'bike_rent_page_state.dart';
import 'provider/bike_rent_form_provider.dart';

part 'bike_rent_page_viewmodel.g.dart';

@riverpod
class BikeRentPageViewModel extends _$BikeRentPageViewModel {
  @override
  BikeRentPageState build() {
    // Watch all form providers
    final selectedDate = ref.watch(selectedStartDateProvider);
    final selectedPickupLocation = ref.watch(selectedPickupLocationProvider);
    final selectedDuration = ref.watch(selectedRentDurationProvider);
    final phoneNumber = ref.watch(phoneNumberProvider);

    // Calculate form validity
    final isFormValid = _validateForm(
      selectedDate: selectedDate,
      selectedPickupLocation: selectedPickupLocation != null,
      selectedDuration: selectedDuration != null,
      phoneNumber: phoneNumber,
    );

    return BikeRentPageState(isFormValid: isFormValid);
  }

  bool _validateForm({
    required DateTime? selectedDate,
    required bool selectedPickupLocation,
    required bool selectedDuration,
    required String phoneNumber,
  }) {
    return selectedDate != null &&
        selectedPickupLocation &&
        selectedDuration &&
        phoneNumber.isNotEmpty;
  }

  Future<void> submitRent(BikeModel bike) async {
    // TODO: Implement rent submission
    try {
      // Get form values
      // final selectedDate = ref.read(selectedStartDateProvider);
      // final selectedPickupLocation = ref.read(selectedPickupLocationProvider);
      // final selectedDuration = ref.read(selectedRentDurationProvider);
      // final phoneNumber = ref.read(phoneNumberProvider);

      // TODO: Call repository to submit rent request
    } catch (e) {
      rethrow;
    }
  }
}
