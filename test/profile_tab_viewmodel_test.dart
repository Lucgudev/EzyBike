import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_bike_customer_app/data/models/user_model.dart';
import 'package:sample_bike_customer_app/data/repositories/auth_repository_impl.dart';
import 'package:sample_bike_customer_app/domain/repositories/auth_repository.dart';
import 'package:sample_bike_customer_app/presentation/page/home/tab_page/profile_tab/profile_tab_viewmodel.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late ProviderContainer container;

  final testUser = UserModel(
    id: '123',
    email: 'test@example.com',
    name: 'Test User',
    phone: '+1234567890',
    profileImageUrl: 'https://example.com/avatar.jpg',
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

  group('ProfileTabViewModel', () {
    test('build should load user successfully', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => testUser);

      final viewModel = container.read(profileTabViewModelProvider.future);

      final state = await viewModel;
      expect(state.user, isNotNull);
      expect(state.user?.id, '123');
      expect(state.user?.email, 'test@example.com');
      expect(state.user?.name, 'Test User');

      verify(() => mockAuthRepository.getCurrentUser()).called(1);
    });

    test('build should handle null user', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => null);

      final viewModel = container.read(profileTabViewModelProvider.future);

      final state = await viewModel;
      expect(state.user, isNull);
    });

    test('build should handle errors', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenThrow(Exception('Failed to load user'));

      expect(
        () => container.read(profileTabViewModelProvider.future),
        throwsA(isA<Exception>()),
      );
    });

    test('logout should call signOut on repository', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => testUser);
      when(() => mockAuthRepository.signOut()).thenAnswer((_) async {});

      // Initial load
      await container.read(profileTabViewModelProvider.future);

      final viewModel = container.read(profileTabViewModelProvider.notifier);
      await viewModel.logout();

      verify(() => mockAuthRepository.signOut()).called(1);
    });

    test('logout should throw error on failure', () async {
      when(() => mockAuthRepository.getCurrentUser())
          .thenAnswer((_) async => testUser);
      when(() => mockAuthRepository.signOut())
          .thenThrow(Exception('Logout failed'));

      // Initial load
      await container.read(profileTabViewModelProvider.future);

      final viewModel = container.read(profileTabViewModelProvider.notifier);

      expect(
        () => viewModel.logout(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
