import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_bike_customer_app/data/models/rent_duration_model.dart';
import 'package:sample_bike_customer_app/data/repositories/order_repository_impl.dart';
import 'package:sample_bike_customer_app/domain/repositories/order_repository.dart';
import 'package:sample_bike_customer_app/presentation/page/bike_rent/widget/rent_duration/rent_duration_view_model.dart';

class MockOrderRepository extends Mock implements OrderRepository {}

void main() {
  late MockOrderRepository mockOrderRepository;
  late ProviderContainer container;

  final testDurations = [
    const RentDurationModel(
      id: '1',
      duration: '1 Day',
      value: 1,
    ),
    const RentDurationModel(
      id: '2',
      duration: '3 Days',
      value: 3,
    ),
    const RentDurationModel(
      id: '3',
      duration: '1 Week',
      value: 7,
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

  group('RentDurationViewModel', () {
    test('build should load rent durations successfully', () async {
      when(() => mockOrderRepository.getRentDurations())
          .thenAnswer((_) async => testDurations);

      final viewModel = container.read(rentDurationViewModelProvider.future);

      final durations = await viewModel;
      expect(durations.length, 3);
      expect(durations[0].duration, '1 Day');
      expect(durations[0].value, 1);
      expect(durations[1].duration, '3 Days');
      expect(durations[1].value, 3);
      expect(durations[2].duration, '1 Week');
      expect(durations[2].value, 7);

      verify(() => mockOrderRepository.getRentDurations()).called(1);
    });

    test('build should handle empty duration list', () async {
      when(() => mockOrderRepository.getRentDurations())
          .thenAnswer((_) async => []);

      final viewModel = container.read(rentDurationViewModelProvider.future);

      final durations = await viewModel;
      expect(durations, isEmpty);
    });

    test('build should handle errors', () async {
      when(() => mockOrderRepository.getRentDurations())
          .thenThrow(Exception('Failed to load rent durations'));

      expect(
        () => container.read(rentDurationViewModelProvider.future),
        throwsA(isA<Exception>()),
      );
    });

    test('refresh should reload rent durations', () async {
      when(() => mockOrderRepository.getRentDurations())
          .thenAnswer((_) async => testDurations);

      // Initial load
      await container.read(rentDurationViewModelProvider.future);

      final newDurations = [
        const RentDurationModel(
          id: '4',
          duration: '1 Month',
          value: 30,
        ),
      ];

      when(() => mockOrderRepository.getRentDurations())
          .thenAnswer((_) async => newDurations);

      final viewModel = container.read(rentDurationViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(rentDurationViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value?.length, 1);
      expect(state.value?[0].duration, '1 Month');
      expect(state.value?[0].value, 30);

      verify(() => mockOrderRepository.getRentDurations()).called(2);
    });

    test('refresh should update state to loading then success', () async {
      when(() => mockOrderRepository.getRentDurations())
          .thenAnswer((_) async => testDurations);

      // Initial load
      await container.read(rentDurationViewModelProvider.future);

      final viewModel = container.read(rentDurationViewModelProvider.notifier);
      final future = viewModel.refresh();

      // Should be loading
      expect(container.read(rentDurationViewModelProvider).isLoading, true);

      await future;

      // Should have data
      final state = container.read(rentDurationViewModelProvider);
      expect(state.hasValue, true);
    });

    test('refresh should handle errors gracefully', () async {
      when(() => mockOrderRepository.getRentDurations())
          .thenAnswer((_) async => testDurations);

      // Initial load
      await container.read(rentDurationViewModelProvider.future);

      when(() => mockOrderRepository.getRentDurations())
          .thenThrow(Exception('Network error'));

      final viewModel = container.read(rentDurationViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(rentDurationViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Network error'));
    });
  });
}
