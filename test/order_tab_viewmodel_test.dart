import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_bike_customer_app/data/models/bike_model.dart';
import 'package:sample_bike_customer_app/data/models/bike_rent_order_model.dart';
import 'package:sample_bike_customer_app/data/models/pickup_location_model.dart';
import 'package:sample_bike_customer_app/data/models/rent_duration_model.dart';
import 'package:sample_bike_customer_app/data/repositories/order_repository_impl.dart';
import 'package:sample_bike_customer_app/domain/repositories/order_repository.dart';
import 'package:sample_bike_customer_app/presentation/page/home/tab_page/order_tab/order_tab_viewmodel.dart';

class MockOrderRepository extends Mock implements OrderRepository {}

void main() {
  late MockOrderRepository mockOrderRepository;
  late ProviderContainer container;

  final testBike = BikeModel(
    id: 1,
    model: 'Test Bike',
    photoUrl: 'https://example.com/bike.jpg',
    range: 100,
    stock: 5,
    description: 'Test bike description',
    color: 'Red',
    batteryCapacity: 48.0,
    maxSpeed: 25.0,
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

  final testOrder1 = BikeRentOrderModel(
    id: 1,
    createdAt: DateTime(2024, 1, 1),
    startDate: DateTime(2024, 1, 2),
    bike: testBike,
    pickupArea: testPickupLocation,
    duration: testDuration,
    total: 50000,
  );

  final testOrder2 = BikeRentOrderModel(
    id: 2,
    createdAt: DateTime(2024, 1, 5),
    startDate: DateTime(2024, 1, 6),
    bike: testBike,
    pickupArea: testPickupLocation,
    duration: testDuration,
    total: 50000,
  );

  setUp(() {
    mockOrderRepository = MockOrderRepository();
    container = ProviderContainer(
      overrides: [
        orderRepositoryProvider.overrideWithValue(mockOrderRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('OrderTabViewModel', () {
    test('build should load orders successfully', () async {
      when(() => mockOrderRepository.getOrderHistory())
          .thenAnswer((_) async => [testOrder1, testOrder2]);

      final viewModel = container.read(orderTabViewModelProvider.future);

      final state = await viewModel;
      expect(state.orders.length, 2);
      expect(state.orders[0].id, 1);
      expect(state.orders[1].id, 2);

      verify(() => mockOrderRepository.getOrderHistory()).called(1);
    });

    test('build should handle empty order list', () async {
      when(() => mockOrderRepository.getOrderHistory())
          .thenAnswer((_) async => []);

      final viewModel = container.read(orderTabViewModelProvider.future);

      final state = await viewModel;
      expect(state.orders, isEmpty);
    });

    test('build should handle errors', () async {
      when(() => mockOrderRepository.getOrderHistory())
          .thenThrow(Exception('Failed to load orders'));

      expect(
        () => container.read(orderTabViewModelProvider.future),
        throwsA(isA<Exception>()),
      );
    });

    test('refresh should reload orders', () async {
      when(() => mockOrderRepository.getOrderHistory())
          .thenAnswer((_) async => [testOrder1]);

      // Initial load
      await container.read(orderTabViewModelProvider.future);

      // Update mock to return different data
      when(() => mockOrderRepository.getOrderHistory())
          .thenAnswer((_) async => [testOrder1, testOrder2]);

      final viewModel = container.read(orderTabViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(orderTabViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value?.orders.length, 2);

      // Should be called twice: once on build, once on refresh
      verify(() => mockOrderRepository.getOrderHistory()).called(2);
    });

    test('refresh should update state to loading then success', () async {
      when(() => mockOrderRepository.getOrderHistory())
          .thenAnswer((_) async => [testOrder1]);

      // Initial load
      await container.read(orderTabViewModelProvider.future);

      when(() => mockOrderRepository.getOrderHistory())
          .thenAnswer((_) async => [testOrder1, testOrder2]);

      final viewModel = container.read(orderTabViewModelProvider.notifier);
      final future = viewModel.refresh();

      // Should be loading
      expect(container.read(orderTabViewModelProvider).isLoading, true);

      await future;

      // Should have data
      final state = container.read(orderTabViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value?.orders.length, 2);
    });

    test('refresh should handle errors gracefully', () async {
      when(() => mockOrderRepository.getOrderHistory())
          .thenAnswer((_) async => [testOrder1]);

      // Initial load
      await container.read(orderTabViewModelProvider.future);

      // Simulate error on refresh
      when(() => mockOrderRepository.getOrderHistory())
          .thenThrow(Exception('Network error'));

      final viewModel = container.read(orderTabViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(orderTabViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Network error'));
    });
  });
}
