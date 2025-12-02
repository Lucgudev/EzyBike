import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_bike_customer_app/data/models/rental_package_model.dart';
import 'package:sample_bike_customer_app/data/repositories/home_repository_impl.dart';
import 'package:sample_bike_customer_app/domain/repositories/home_repository.dart';
import 'package:sample_bike_customer_app/presentation/page/home/widget/list_package/list_package_widget_viewmodel.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late MockHomeRepository mockHomeRepository;
  late ProviderContainer container;

  final testPackages = [
    const RentalPackageModel(
      id: 1,
      title: 'Basic Package',
      price: 100000,
      terms: '1 bike for 1 day',
      description: 'Perfect for short trips',
    ),
    const RentalPackageModel(
      id: 2,
      title: 'Premium Package',
      price: 500000,
      terms: '1 bike for 7 days',
      description: 'Best value for extended rentals',
    ),
  ];

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    container = ProviderContainer(
      overrides: [
        homeRepositoryProvider.overrideWithValue(mockHomeRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('ListPackageWidgetViewModel', () {
    test('build should load packages successfully', () async {
      when(() => mockHomeRepository.getPackages())
          .thenAnswer((_) async => testPackages);

      final viewModel = container.read(listPackageWidgetViewModelProvider.future);

      final state = await viewModel;
      expect(state.packages.length, 2);
      expect(state.packages[0].title, 'Basic Package');
      expect(state.packages[1].title, 'Premium Package');

      verify(() => mockHomeRepository.getPackages()).called(1);
    });

    test('build should handle empty package list', () async {
      when(() => mockHomeRepository.getPackages())
          .thenAnswer((_) async => []);

      final viewModel = container.read(listPackageWidgetViewModelProvider.future);

      final state = await viewModel;
      expect(state.packages, isEmpty);
    });

    test('build should handle errors', () async {
      when(() => mockHomeRepository.getPackages())
          .thenThrow(Exception('Failed to load packages'));

      expect(
        () => container.read(listPackageWidgetViewModelProvider.future),
        throwsA(isA<Exception>()),
      );
    });

    test('refresh should reload packages', () async {
      when(() => mockHomeRepository.getPackages())
          .thenAnswer((_) async => testPackages);

      // Initial load
      await container.read(listPackageWidgetViewModelProvider.future);

      final newPackages = [
        const RentalPackageModel(
          id: 3,
          title: 'Deluxe Package',
          price: 1000000,
          terms: '1 bike for 30 days',
        ),
      ];

      when(() => mockHomeRepository.getPackages())
          .thenAnswer((_) async => newPackages);

      final viewModel = container.read(listPackageWidgetViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(listPackageWidgetViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value?.packages.length, 1);
      expect(state.value?.packages[0].title, 'Deluxe Package');

      verify(() => mockHomeRepository.getPackages()).called(2);
    });

    test('refresh should update state to loading then success', () async {
      when(() => mockHomeRepository.getPackages())
          .thenAnswer((_) async => testPackages);

      // Initial load
      await container.read(listPackageWidgetViewModelProvider.future);

      final viewModel = container.read(listPackageWidgetViewModelProvider.notifier);
      final future = viewModel.refresh();

      // Should be loading
      expect(container.read(listPackageWidgetViewModelProvider).isLoading, true);

      await future;

      // Should have data
      final state = container.read(listPackageWidgetViewModelProvider);
      expect(state.hasValue, true);
    });

    test('refresh should handle errors gracefully', () async {
      when(() => mockHomeRepository.getPackages())
          .thenAnswer((_) async => testPackages);

      // Initial load
      await container.read(listPackageWidgetViewModelProvider.future);

      when(() => mockHomeRepository.getPackages())
          .thenThrow(Exception('Network error'));

      final viewModel = container.read(listPackageWidgetViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(listPackageWidgetViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Network error'));
    });
  });
}
