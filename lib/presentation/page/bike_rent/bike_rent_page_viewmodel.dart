import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_bike_customer_app/data/models/bike_model.dart';
import 'package:sample_bike_customer_app/data/models/bike_rent_request_model.dart';
import 'package:sample_bike_customer_app/data/repositories/auth_repository_impl.dart';
import 'package:sample_bike_customer_app/data/repositories/order_repository_impl.dart';
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
    try {
      // Get current user
      final authRepo = ref.read(authRepositoryProvider);
      final currentUser = await authRepo.getCurrentUser();

      if (currentUser == null) {
        throw Exception('User not authenticated');
      }

      // Get form values
      final selectedDate = ref.read(selectedStartDateProvider);
      final selectedPickupLocation = ref.read(selectedPickupLocationProvider);
      final selectedDuration = ref.read(selectedRentDurationProvider);
      final phoneNumber = ref.read(phoneNumberProvider);

      if (selectedDate == null ||
          selectedPickupLocation == null ||
          selectedDuration == null) {
        throw Exception('Please fill all required fields');
      }

      // Create rent request
      final request = BikeRentRequestModel(
        startDate: selectedDate,
        duration: selectedDuration.id,
        userId: currentUser.id,
        email: currentUser.email,
        bikeId: bike.id,
        phoneNumber: phoneNumber,
        pickupAreaId: selectedPickupLocation.id,
      );

      // Submit rent request
      final orderRepo = ref.read(orderRepositoryProvider);
      await orderRepo.createBikeRent(request);
    } catch (e) {
      rethrow;
    }
  }
}
