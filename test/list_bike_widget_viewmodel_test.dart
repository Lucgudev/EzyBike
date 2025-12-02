import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_bike_customer_app/data/models/bike_model.dart';
import 'package:sample_bike_customer_app/data/repositories/bike_repository_impl.dart';
import 'package:sample_bike_customer_app/domain/repositories/bike_repository.dart';
import 'package:sample_bike_customer_app/presentation/page/home/widget/list_bike/list_bike_widget_viewmodel.dart';

class MockBikeRepository extends Mock implements BikeRepository {}

void main() {
  late MockBikeRepository mockBikeRepository;
  late ProviderContainer container;

  final testBikes = [
    const BikeModel(
      id: 1,
      model: 'Red Bike',
      photoUrl: 'https://example.com/bike1.jpg',
      range: 100,
      stock: 5,
      color: 'Red',
      rentalPricePerDay: 50000,
    ),
    const BikeModel(
      id: 2,
      model: 'Blue Bike',
      photoUrl: 'https://example.com/bike2.jpg',
      range: 120,
      stock: 3,
      color: 'Blue',
      rentalPricePerDay: 60000,
    ),
    const BikeModel(
      id: 3,
      model: 'Red Scooter',
      photoUrl: 'https://example.com/bike3.jpg',
      range: 80,
      stock: 10,
      color: 'Red',
      rentalPricePerDay: 40000,
    ),
  ];

  setUp(() {
    mockBikeRepository = MockBikeRepository();
    container = ProviderContainer(
      overrides: [
        bikeRepositoryProvider.overrideWithValue(mockBikeRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('ListBikeWidgetViewModel', () {
    test('build should load bikes successfully', () async {
      when(() => mockBikeRepository.getBikes())
          .thenAnswer((_) async => testBikes);

      final viewModel = container.read(listBikeWidgetViewModelProvider.future);

      final state = await viewModel;
      expect(state.bikes.length, 3);
      expect(state.filteredBikes.length, 3);
      expect(state.availableColors.length, 2);
      expect(state.availableColors, containsAll(['Red', 'Blue']));

      verify(() => mockBikeRepository.getBikes()).called(1);
    });

    test('build should extract unique colors from bikes', () async {
      when(() => mockBikeRepository.getBikes())
          .thenAnswer((_) async => testBikes);

      final viewModel = container.read(listBikeWidgetViewModelProvider.future);

      final state = await viewModel;
      expect(state.availableColors, ['Red', 'Blue']);
    });

    test('build should handle bikes without colors', () async {
      final bikesWithoutColors = [
        const BikeModel(
          id: 1,
          model: 'Basic Bike',
          photoUrl: 'https://example.com/bike1.jpg',
          range: 100,
          stock: 5,
          rentalPricePerDay: 50000,
        ),
      ];

      when(() => mockBikeRepository.getBikes())
          .thenAnswer((_) async => bikesWithoutColors);

      final viewModel = container.read(listBikeWidgetViewModelProvider.future);

      final state = await viewModel;
      expect(state.availableColors, isEmpty);
    });

    test('build should handle empty bike list', () async {
      when(() => mockBikeRepository.getBikes())
          .thenAnswer((_) async => []);

      final viewModel = container.read(listBikeWidgetViewModelProvider.future);

      final state = await viewModel;
      expect(state.bikes, isEmpty);
      expect(state.filteredBikes, isEmpty);
      expect(state.availableColors, isEmpty);
    });

    test('build should handle errors', () async {
      when(() => mockBikeRepository.getBikes())
          .thenThrow(Exception('Failed to load bikes'));

      expect(
        () => container.read(listBikeWidgetViewModelProvider.future),
        throwsA(isA<Exception>()),
      );
    });

    test('filterByColor should filter bikes by selected color', () async {
      when(() => mockBikeRepository.getBikes())
          .thenAnswer((_) async => testBikes);

      await container.read(listBikeWidgetViewModelProvider.future);

      final viewModel = container.read(listBikeWidgetViewModelProvider.notifier);
      viewModel.filterByColor('Red');

      final state = container.read(listBikeWidgetViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value?.filteredBikes.length, 2);
      expect(state.value?.filteredBikes[0].color, 'Red');
      expect(state.value?.filteredBikes[1].color, 'Red');
      expect(state.value?.selectedColor, 'Red');
    });

    test('filterByColor should clear filter when null is passed', () async {
      when(() => mockBikeRepository.getBikes())
          .thenAnswer((_) async => testBikes);

      await container.read(listBikeWidgetViewModelProvider.future);

      final viewModel = container.read(listBikeWidgetViewModelProvider.notifier);

      // First filter by Red
      viewModel.filterByColor('Red');
      var state = container.read(listBikeWidgetViewModelProvider);
      expect(state.value?.filteredBikes.length, 2);

      // Then clear filter
      viewModel.filterByColor(null);
      state = container.read(listBikeWidgetViewModelProvider);
      expect(state.value?.filteredBikes.length, 3);
      expect(state.value?.selectedColor, null);
    });

    test('filterByColor should handle non-existent color', () async {
      when(() => mockBikeRepository.getBikes())
          .thenAnswer((_) async => testBikes);

      await container.read(listBikeWidgetViewModelProvider.future);

      final viewModel = container.read(listBikeWidgetViewModelProvider.notifier);
      viewModel.filterByColor('Green');

      final state = container.read(listBikeWidgetViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value?.filteredBikes, isEmpty);
      expect(state.value?.selectedColor, 'Green');
    });

    test('refresh should reload bikes', () async {
      when(() => mockBikeRepository.getBikes())
          .thenAnswer((_) async => testBikes);

      // Initial load
      await container.read(listBikeWidgetViewModelProvider.future);

      final newBikes = [
        const BikeModel(
          id: 4,
          model: 'Green Bike',
          photoUrl: 'https://example.com/bike4.jpg',
          range: 150,
          stock: 8,
          color: 'Green',
          rentalPricePerDay: 70000,
        ),
      ];

      when(() => mockBikeRepository.getBikes())
          .thenAnswer((_) async => newBikes);

      final viewModel = container.read(listBikeWidgetViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(listBikeWidgetViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value?.bikes.length, 1);
      expect(state.value?.bikes[0].model, 'Green Bike');
      expect(state.value?.availableColors, ['Green']);

      verify(() => mockBikeRepository.getBikes()).called(2);
    });

    test('refresh should reset filter', () async {
      when(() => mockBikeRepository.getBikes())
          .thenAnswer((_) async => testBikes);

      await container.read(listBikeWidgetViewModelProvider.future);

      final viewModel = container.read(listBikeWidgetViewModelProvider.notifier);

      // Apply filter
      viewModel.filterByColor('Red');
      var state = container.read(listBikeWidgetViewModelProvider);
      expect(state.value?.selectedColor, 'Red');

      // Refresh
      await viewModel.refresh();
      state = container.read(listBikeWidgetViewModelProvider);
      expect(state.value?.selectedColor, null);
      expect(state.value?.filteredBikes.length, 3);
    });

    test('refresh should update state to loading then success', () async {
      when(() => mockBikeRepository.getBikes())
          .thenAnswer((_) async => testBikes);

      // Initial load
      await container.read(listBikeWidgetViewModelProvider.future);

      final viewModel = container.read(listBikeWidgetViewModelProvider.notifier);
      final future = viewModel.refresh();

      // Should be loading
      expect(container.read(listBikeWidgetViewModelProvider).isLoading, true);

      await future;

      // Should have data
      final state = container.read(listBikeWidgetViewModelProvider);
      expect(state.hasValue, true);
    });

    test('refresh should handle errors gracefully', () async {
      when(() => mockBikeRepository.getBikes())
          .thenAnswer((_) async => testBikes);

      // Initial load
      await container.read(listBikeWidgetViewModelProvider.future);

      when(() => mockBikeRepository.getBikes())
          .thenThrow(Exception('Network error'));

      final viewModel = container.read(listBikeWidgetViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(listBikeWidgetViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Network error'));
    });
  });
}
