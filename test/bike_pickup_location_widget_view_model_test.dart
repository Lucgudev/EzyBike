import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_bike_customer_app/data/models/pickup_location_model.dart';
import 'package:sample_bike_customer_app/data/repositories/order_repository_impl.dart';
import 'package:sample_bike_customer_app/domain/repositories/order_repository.dart';
import 'package:sample_bike_customer_app/presentation/page/bike_rent/widget/bike_pickup_location/bike_pickup_location_widget_view_model.dart';

class MockOrderRepository extends Mock implements OrderRepository {}

void main() {
  late MockOrderRepository mockOrderRepository;
  late ProviderContainer container;

  final testLocations = [
    const PickupLocationModel(
      id: '1',
      name: 'Downtown Station',
    ),
    const PickupLocationModel(
      id: '2',
      name: 'Airport Terminal',
    ),
    const PickupLocationModel(
      id: '3',
      name: 'Shopping Mall',
    ),
  ];

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

  group('BikePickupLocationWidgetViewModel', () {
    test('build should load pickup locations successfully', () async {
      when(() => mockOrderRepository.getPickupLocations())
          .thenAnswer((_) async => testLocations);

      final viewModel =
          container.read(bikePickupLocationWidgetViewModelProvider.future);

      final locations = await viewModel;
      expect(locations.length, 3);
      expect(locations[0].name, 'Downtown Station');
      expect(locations[1].name, 'Airport Terminal');
      expect(locations[2].name, 'Shopping Mall');

      verify(() => mockOrderRepository.getPickupLocations()).called(1);
    });

    test('build should handle empty location list', () async {
      when(() => mockOrderRepository.getPickupLocations())
          .thenAnswer((_) async => []);

      final viewModel =
          container.read(bikePickupLocationWidgetViewModelProvider.future);

      final locations = await viewModel;
      expect(locations, isEmpty);
    });

    test('build should handle errors', () async {
      when(() => mockOrderRepository.getPickupLocations())
          .thenThrow(Exception('Failed to load pickup locations'));

      expect(
        () => container.read(bikePickupLocationWidgetViewModelProvider.future),
        throwsA(isA<Exception>()),
      );
    });

    test('refresh should reload pickup locations', () async {
      when(() => mockOrderRepository.getPickupLocations())
          .thenAnswer((_) async => testLocations);

      // Initial load
      await container.read(bikePickupLocationWidgetViewModelProvider.future);

      final newLocations = [
        const PickupLocationModel(
          id: '4',
          name: 'City Center',
        ),
      ];

      when(() => mockOrderRepository.getPickupLocations())
          .thenAnswer((_) async => newLocations);

      final viewModel =
          container.read(bikePickupLocationWidgetViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(bikePickupLocationWidgetViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value?.length, 1);
      expect(state.value?[0].name, 'City Center');

      verify(() => mockOrderRepository.getPickupLocations()).called(2);
    });

    test('refresh should update state to loading then success', () async {
      when(() => mockOrderRepository.getPickupLocations())
          .thenAnswer((_) async => testLocations);

      // Initial load
      await container.read(bikePickupLocationWidgetViewModelProvider.future);

      final viewModel =
          container.read(bikePickupLocationWidgetViewModelProvider.notifier);
      final future = viewModel.refresh();

      // Should be loading
      expect(
          container.read(bikePickupLocationWidgetViewModelProvider).isLoading,
          true);

      await future;

      // Should have data
      final state = container.read(bikePickupLocationWidgetViewModelProvider);
      expect(state.hasValue, true);
    });

    test('refresh should handle errors gracefully', () async {
      when(() => mockOrderRepository.getPickupLocations())
          .thenAnswer((_) async => testLocations);

      // Initial load
      await container.read(bikePickupLocationWidgetViewModelProvider.future);

      when(() => mockOrderRepository.getPickupLocations())
          .thenThrow(Exception('Network error'));

      final viewModel =
          container.read(bikePickupLocationWidgetViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(bikePickupLocationWidgetViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Network error'));
    });
  });
}
