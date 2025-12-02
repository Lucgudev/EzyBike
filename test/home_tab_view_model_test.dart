import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_bike_customer_app/data/models/home_model.dart';
import 'package:sample_bike_customer_app/data/repositories/home_repository_impl.dart';
import 'package:sample_bike_customer_app/domain/repositories/home_repository.dart';
import 'package:sample_bike_customer_app/presentation/page/home/tab_page/home_tab/home_tab_view_model.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late MockHomeRepository mockHomeRepository;
  late ProviderContainer container;

  final testHomeModel = HomeModel(
    sections: [
      const SectionModel(
        title: 'Promotions',
        description: 'Check out our latest promotions',
        sectionType: SectionType.promotion,
      ),
      const SectionModel(
        title: 'Rental Packages',
        description: 'Choose your rental package',
        sectionType: SectionType.rentalPackage,
      ),
      const SectionModel(
        title: 'Available Bikes',
        description: 'Browse our bike collection',
        sectionType: SectionType.listBike,
      ),
    ],
  );

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

  group('HomeTabViewModel', () {
    test('build should load home sections successfully', () async {
      when(() => mockHomeRepository.getHomeSections())
          .thenAnswer((_) async => testHomeModel);

      final viewModel = container.read(homeTabViewModelProvider.future);

      final state = await viewModel;
      expect(state, isNotNull);
      expect(state?.sections.length, 3);
      expect(state?.sections[0].title, 'Promotions');
      expect(state?.sections[0].sectionType, SectionType.promotion);

      verify(() => mockHomeRepository.getHomeSections()).called(1);
    });

    test('build should handle empty sections list', () async {
      final emptyHomeModel = HomeModel(sections: []);
      when(() => mockHomeRepository.getHomeSections())
          .thenAnswer((_) async => emptyHomeModel);

      final viewModel = container.read(homeTabViewModelProvider.future);

      final state = await viewModel;
      expect(state?.sections, isEmpty);
    });

    test('build should handle errors', () async {
      when(() => mockHomeRepository.getHomeSections())
          .thenThrow(Exception('Failed to load home sections'));

      expect(
        () => container.read(homeTabViewModelProvider.future),
        throwsA(isA<Exception>()),
      );
    });

    test('refresh should reload home sections', () async {
      when(() => mockHomeRepository.getHomeSections())
          .thenAnswer((_) async => testHomeModel);

      // Initial load
      await container.read(homeTabViewModelProvider.future);

      // Create updated model
      final updatedHomeModel = HomeModel(
        sections: [
          const SectionModel(
            title: 'Updated Promotions',
            description: 'New promotions',
            sectionType: SectionType.promotion,
          ),
        ],
      );

      when(() => mockHomeRepository.getHomeSections())
          .thenAnswer((_) async => updatedHomeModel);

      final viewModel = container.read(homeTabViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(homeTabViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value?.sections.length, 1);
      expect(state.value?.sections[0].title, 'Updated Promotions');

      // Should be called twice: once on build, once on refresh
      verify(() => mockHomeRepository.getHomeSections()).called(2);
    });

    test('refresh should update state to loading then success', () async {
      when(() => mockHomeRepository.getHomeSections())
          .thenAnswer((_) async => testHomeModel);

      // Initial load
      await container.read(homeTabViewModelProvider.future);

      final viewModel = container.read(homeTabViewModelProvider.notifier);
      final future = viewModel.refresh();

      // Should be loading
      expect(container.read(homeTabViewModelProvider).isLoading, true);

      await future;

      // Should have data
      final state = container.read(homeTabViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value, isNotNull);
    });

    test('refresh should handle errors gracefully', () async {
      when(() => mockHomeRepository.getHomeSections())
          .thenAnswer((_) async => testHomeModel);

      // Initial load
      await container.read(homeTabViewModelProvider.future);

      // Simulate error on refresh
      when(() => mockHomeRepository.getHomeSections())
          .thenThrow(Exception('Network error'));

      final viewModel = container.read(homeTabViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(homeTabViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Network error'));
    });
  });
}
