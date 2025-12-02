import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_bike_customer_app/data/models/bike_model.dart';
import 'package:sample_bike_customer_app/data/models/bike_rent_request_model.dart';
import 'package:sample_bike_customer_app/data/models/pickup_location_model.dart';
import 'package:sample_bike_customer_app/data/models/rent_duration_model.dart';
import 'package:sample_bike_customer_app/data/models/user_model.dart';
import 'package:sample_bike_customer_app/data/repositories/auth_repository_impl.dart';
import 'package:sample_bike_customer_app/data/repositories/order_repository_impl.dart';
import 'package:sample_bike_customer_app/domain/repositories/auth_repository.dart';
import 'package:sample_bike_customer_app/domain/repositories/order_repository.dart';
import 'package:sample_bike_customer_app/presentation/page/bike_rent/bike_rent_page_viewmodel.dart';
import 'package:sample_bike_customer_app/presentation/page/bike_rent/provider/bike_rent_form_provider.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockOrderRepository extends Mock implements OrderRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late MockOrderRepository mockOrderRepository;
  late ProviderContainer container;

  final testUser = UserModel(
    id: '123',
    email: 'test@example.com',
    name: 'Test User',
    phone: null,
    profileImageUrl: null,
    createdAt: DateTime.now(),
  );

  final testBike = BikeModel(
    id: 1,
    model: 'Test Bike',
    photoUrl: 'https://example.com/bike.jpg',
    range: 100,
    stock: 5,
    rentalPricePerDay: 50000,
  );

  final testPickupLocation = PickupLocationModel(
    id: '1',
    name: 'Test Location',
  );

  final testDuration = RentDurationModel(
    id: '1',
    duration: '1 Day',
    value: 1,
  );

  final testDate = DateTime(2024, 12, 15);

  setUpAll(() {
    registerFallbackValue(BikeRentRequestModel(
      startDate: DateTime.now(),
      duration: '1',
      userId: '123',
      email: 'test@example.com',
      bikeId: 1,
      phoneNumber: '+1234567890',
      pickupAreaId: '1',
    ));
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockOrderRepository = MockOrderRepository();
    container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(mockAuthRepository),
        orderRepositoryProvider.overrideWithValue(mockOrderRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('BikeRentPageViewModel', () {
    test('build should return invalid form state when all fields are empty', () {
      final viewModel = container.read(bikeRentPageViewModelProvider);

      expect(viewModel.hasValue, true);
      expect(viewModel.value?.isFormValid, false);
    });

    test('build should return valid form state when all fields are filled', () {
      // Set all form fields
      container.read(selectedStartDateProvider.notifier).setDate(testDate);
      container.read(selectedPickupLocationProvider.notifier).setLocation(testPickupLocation);
      container.read(selectedRentDurationProvider.notifier).setDuration(testDuration);
      container.read(phoneNumberProvider.notifier).setPhoneNumber('+1234567890');

      final viewModel = container.read(bikeRentPageViewModelProvider);

      expect(viewModel.hasValue, true);
      expect(viewModel.value?.isFormValid, true);
    });

    test('build should return invalid form when date is missing', () {
      container.read(selectedPickupLocationProvider.notifier).setLocation(testPickupLocation);
      container.read(selectedRentDurationProvider.notifier).setDuration(testDuration);
      container.read(phoneNumberProvider.notifier).setPhoneNumber('+1234567890');

      final viewModel = container.read(bikeRentPageViewModelProvider);

      expect(viewModel.value?.isFormValid, false);
    });

    test('build should return invalid form when pickup location is missing', () {
      container.read(selectedStartDateProvider.notifier).setDate(testDate);
      container.read(selectedRentDurationProvider.notifier).setDuration(testDuration);
      container.read(phoneNumberProvider.notifier).setPhoneNumber('+1234567890');

      final viewModel = container.read(bikeRentPageViewModelProvider);

      expect(viewModel.value?.isFormValid, false);
    });

    test('build should return invalid form when duration is missing', () {
      container.read(selectedStartDateProvider.notifier).setDate(testDate);
      container.read(selectedPickupLocationProvider.notifier).setLocation(testPickupLocation);
      container.read(phoneNumberProvider.notifier).setPhoneNumber('+1234567890');

      final viewModel = container.read(bikeRentPageViewModelProvider);

      expect(viewModel.value?.isFormValid, false);
    });

    test('build should return invalid form when phone number is empty', () {
      container.read(selectedStartDateProvider.notifier).setDate(testDate);
      container.read(selectedPickupLocationProvider.notifier).setLocation(testPickupLocation);
      container.read(selectedRentDurationProvider.notifier).setDuration(testDuration);

      final viewModel = container.read(bikeRentPageViewModelProvider);

      expect(viewModel.value?.isFormValid, false);
    });

    test('submitRent should successfully create bike rent when all fields are valid', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => testUser);
      when(() => mockOrderRepository.createBikeRent(any()))
          .thenAnswer((_) async {});

      // Set all form fields
      container.read(selectedStartDateProvider.notifier).setDate(testDate);
      container.read(selectedPickupLocationProvider.notifier).setLocation(testPickupLocation);
      container.read(selectedRentDurationProvider.notifier).setDuration(testDuration);
      container.read(phoneNumberProvider.notifier).setPhoneNumber('+1234567890');

      final viewModel = container.read(bikeRentPageViewModelProvider.notifier);
      await viewModel.submitRent(testBike);

      final state = container.read(bikeRentPageViewModelProvider);
      expect(state.hasValue, true);

      verify(() => mockAuthRepository.getCurrentUser()).called(1);
      verify(() => mockOrderRepository.createBikeRent(any())).called(1);
    });

    test('submitRent should throw error when user is not authenticated', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => null);

      // Set all form fields
      container.read(selectedStartDateProvider.notifier).setDate(testDate);
      container.read(selectedPickupLocationProvider.notifier).setLocation(testPickupLocation);
      container.read(selectedRentDurationProvider.notifier).setDuration(testDuration);
      container.read(phoneNumberProvider.notifier).setPhoneNumber('+1234567890');

      final viewModel = container.read(bikeRentPageViewModelProvider.notifier);
      await viewModel.submitRent(testBike);

      final state = container.read(bikeRentPageViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('User not authenticated'));
    });

    test('submitRent should throw error when date is missing', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => testUser);

      // Set form fields except date
      container.read(selectedPickupLocationProvider.notifier).setLocation(testPickupLocation);
      container.read(selectedRentDurationProvider.notifier).setDuration(testDuration);
      container.read(phoneNumberProvider.notifier).setPhoneNumber('+1234567890');

      final viewModel = container.read(bikeRentPageViewModelProvider.notifier);
      await viewModel.submitRent(testBike);

      final state = container.read(bikeRentPageViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Please select a start date'));
    });

    test('submitRent should throw error when pickup location is missing', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => testUser);

      // Set form fields except location
      container.read(selectedStartDateProvider.notifier).setDate(testDate);
      container.read(selectedRentDurationProvider.notifier).setDuration(testDuration);
      container.read(phoneNumberProvider.notifier).setPhoneNumber('+1234567890');

      final viewModel = container.read(bikeRentPageViewModelProvider.notifier);
      await viewModel.submitRent(testBike);

      final state = container.read(bikeRentPageViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Please select a pickup location'));
    });

    test('submitRent should throw error when duration is missing', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => testUser);

      // Set form fields except duration
      container.read(selectedStartDateProvider.notifier).setDate(testDate);
      container.read(selectedPickupLocationProvider.notifier).setLocation(testPickupLocation);
      container.read(phoneNumberProvider.notifier).setPhoneNumber('+1234567890');

      final viewModel = container.read(bikeRentPageViewModelProvider.notifier);
      await viewModel.submitRent(testBike);

      final state = container.read(bikeRentPageViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Please select a duration'));
    });

    test('submitRent should throw error when phone number is invalid', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => testUser);

      // Set form fields with empty phone
      container.read(selectedStartDateProvider.notifier).setDate(testDate);
      container.read(selectedPickupLocationProvider.notifier).setLocation(testPickupLocation);
      container.read(selectedRentDurationProvider.notifier).setDuration(testDuration);
      container.read(phoneNumberProvider.notifier).setPhoneNumber('');

      final viewModel = container.read(bikeRentPageViewModelProvider.notifier);
      await viewModel.submitRent(testBike);

      final state = container.read(bikeRentPageViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Please enter a valid phone number'));
    });

    test('submitRent should handle repository errors', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => testUser);
      when(() => mockOrderRepository.createBikeRent(any()))
          .thenThrow(Exception('Failed to create rent'));

      // Set all form fields
      container.read(selectedStartDateProvider.notifier).setDate(testDate);
      container.read(selectedPickupLocationProvider.notifier).setLocation(testPickupLocation);
      container.read(selectedRentDurationProvider.notifier).setDuration(testDuration);
      container.read(phoneNumberProvider.notifier).setPhoneNumber('+1234567890');

      final viewModel = container.read(bikeRentPageViewModelProvider.notifier);
      await viewModel.submitRent(testBike);

      final state = container.read(bikeRentPageViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Failed to create rent'));
    });
  });
}
