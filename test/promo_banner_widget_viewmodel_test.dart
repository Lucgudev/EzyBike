import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_bike_customer_app/data/models/banner_model.dart';
import 'package:sample_bike_customer_app/data/repositories/promo_repository_impl.dart';
import 'package:sample_bike_customer_app/domain/repositories/promo_repository.dart';
import 'package:sample_bike_customer_app/presentation/page/home/widget/banner/promo_banner_widget_viewmodel.dart';

class MockPromoRepository extends Mock implements PromoRepository {}

void main() {
  late MockPromoRepository mockPromoRepository;
  late ProviderContainer container;

  final testBanners = [
    const BannerModel(
      id: 1,
      photoUrl: 'https://example.com/banner1.jpg',
      title: 'Summer Sale',
      description: 'Get 20% off on all bikes',
      actionUrl: 'https://example.com/sale',
    ),
    const BannerModel(
      id: 2,
      photoUrl: 'https://example.com/banner2.jpg',
      title: 'New Arrivals',
      description: 'Check out our latest bikes',
    ),
  ];

  setUp(() {
    mockPromoRepository = MockPromoRepository();
    container = ProviderContainer(
      overrides: [
        promoRepositoryProvider.overrideWithValue(mockPromoRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('PromoBannerWidgetViewModel', () {
    test('build should load banners successfully', () async {
      when(() => mockPromoRepository.getPromos())
          .thenAnswer((_) async => testBanners);

      final viewModel = container.read(promoBannerWidgetViewModelProvider.future);

      final banners = await viewModel;
      expect(banners.length, 2);
      expect(banners[0].title, 'Summer Sale');
      expect(banners[1].title, 'New Arrivals');

      verify(() => mockPromoRepository.getPromos()).called(1);
    });

    test('build should handle empty banner list', () async {
      when(() => mockPromoRepository.getPromos())
          .thenAnswer((_) async => []);

      final viewModel = container.read(promoBannerWidgetViewModelProvider.future);

      final banners = await viewModel;
      expect(banners, isEmpty);
    });

    test('build should handle errors', () async {
      when(() => mockPromoRepository.getPromos())
          .thenThrow(Exception('Failed to load banners'));

      expect(
        () => container.read(promoBannerWidgetViewModelProvider.future),
        throwsA(isA<Exception>()),
      );
    });

    test('refresh should reload banners', () async {
      when(() => mockPromoRepository.getPromos())
          .thenAnswer((_) async => testBanners);

      // Initial load
      await container.read(promoBannerWidgetViewModelProvider.future);

      final newBanners = [
        const BannerModel(
          id: 3,
          photoUrl: 'https://example.com/banner3.jpg',
          title: 'Flash Sale',
        ),
      ];

      when(() => mockPromoRepository.getPromos())
          .thenAnswer((_) async => newBanners);

      final viewModel = container.read(promoBannerWidgetViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(promoBannerWidgetViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value?.length, 1);
      expect(state.value?[0].title, 'Flash Sale');

      verify(() => mockPromoRepository.getPromos()).called(2);
    });

    test('refresh should update state to loading then success', () async {
      when(() => mockPromoRepository.getPromos())
          .thenAnswer((_) async => testBanners);

      // Initial load
      await container.read(promoBannerWidgetViewModelProvider.future);

      final viewModel = container.read(promoBannerWidgetViewModelProvider.notifier);
      final future = viewModel.refresh();

      // Should be loading
      expect(container.read(promoBannerWidgetViewModelProvider).isLoading, true);

      await future;

      // Should have data
      final state = container.read(promoBannerWidgetViewModelProvider);
      expect(state.hasValue, true);
    });

    test('refresh should handle errors gracefully', () async {
      when(() => mockPromoRepository.getPromos())
          .thenAnswer((_) async => testBanners);

      // Initial load
      await container.read(promoBannerWidgetViewModelProvider.future);

      when(() => mockPromoRepository.getPromos())
          .thenThrow(Exception('Network error'));

      final viewModel = container.read(promoBannerWidgetViewModelProvider.notifier);
      await viewModel.refresh();

      final state = container.read(promoBannerWidgetViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Network error'));
    });
  });
}
