import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_bike_customer_app/data/models/user_model.dart';
import 'package:sample_bike_customer_app/data/repositories/auth_repository_impl.dart';
import 'package:sample_bike_customer_app/domain/repositories/auth_repository.dart';
import 'package:sample_bike_customer_app/presentation/page/root/root_page_view_model.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late ProviderContainer container;

  final testUser = UserModel(
    id: '123',
    email: 'test@example.com',
    name: 'Test User',
    phone: null,
    profileImageUrl: null,
    createdAt: DateTime(2024, 1, 1),
  );

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(mockAuthRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('RootPageViewModel', () {
    test('build should return user when session is valid', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => testUser);

      final viewModel = container.read(rootPageViewModelProvider.future);

      final user = await viewModel;
      expect(user, isNotNull);
      expect(user?.id, '123');
      expect(user?.email, 'test@example.com');

      verify(() => mockAuthRepository.getCurrentUser()).called(1);
    });

    test('build should return null when no session exists', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => null);

      final viewModel = container.read(rootPageViewModelProvider.future);

      final user = await viewModel;
      expect(user, isNull);
    });

    test('build should return null when session check fails', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenThrow(Exception('Session check failed'));

      final viewModel = container.read(rootPageViewModelProvider.future);

      final user = await viewModel;
      expect(user, isNull);
    });

    test('refreshSession should reload user session', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => testUser);

      // Initial load
      await container.read(rootPageViewModelProvider.future);

      // Simulate user updating their profile
      final updatedUser = UserModel(
        id: '123',
        email: 'test@example.com',
        name: 'Updated User',
        phone: '+1234567890',
        profileImageUrl: 'https://example.com/new-avatar.jpg',
        createdAt: DateTime(2024, 1, 1),
      );

      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => updatedUser);

      final viewModel = container.read(rootPageViewModelProvider.notifier);
      await viewModel.refreshSession();

      final state = container.read(rootPageViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value?.name, 'Updated User');
      expect(state.value?.phone, '+1234567890');

      // Should be called twice: once on build, once on refresh
      verify(() => mockAuthRepository.getCurrentUser()).called(2);
    });

    test('refreshSession should update state to loading then success', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => testUser);

      // Initial load
      await container.read(rootPageViewModelProvider.future);

      final viewModel = container.read(rootPageViewModelProvider.notifier);
      final future = viewModel.refreshSession();

      // Should be loading
      expect(container.read(rootPageViewModelProvider).isLoading, true);

      await future;

      // Should have data
      final state = container.read(rootPageViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value, isNotNull);
    });

    test('refreshSession should handle errors gracefully by returning null', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => testUser);

      // Initial load
      await container.read(rootPageViewModelProvider.future);

      // Simulate error on refresh
      when(() => mockAuthRepository.getCurrentUser())
          .thenThrow(Exception('Network error'));

      final viewModel = container.read(rootPageViewModelProvider.notifier);
      await viewModel.refreshSession();

      final state = container.read(rootPageViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value, isNull);
    });
  });
}
