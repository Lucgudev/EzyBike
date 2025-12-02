import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_bike_customer_app/data/models/user_model.dart';
import 'package:sample_bike_customer_app/data/repositories/auth_repository_impl.dart';
import 'package:sample_bike_customer_app/domain/repositories/auth_repository.dart';
import 'package:sample_bike_customer_app/presentation/page/login/login_page_view_model.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late ProviderContainer container;

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

  group('LoginPageViewModel', () {
    test('initial state should be null', () {
      final viewModel = container.read(loginPageViewModelProvider);

      expect(viewModel.value, null);
    });

    test('signIn should update state to loading then success with user data', () async {
      final testUser = UserModel(
        id: '123',
        email: 'test@example.com',
        name: 'Test User',
        phone: null,
        profileImageUrl: null,
        createdAt: DateTime.now(),
      );

      when(() => mockAuthRepository.signIn(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => testUser);

      final viewModel = container.read(loginPageViewModelProvider.notifier);

      final future = viewModel.signIn(
        email: 'test@example.com',
        password: 'password123',
      );

      // State should be loading
      expect(container.read(loginPageViewModelProvider).isLoading, true);

      await future;

      // State should contain user data
      final state = container.read(loginPageViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value?.id, '123');
      expect(state.value?.email, 'test@example.com');

      verify(() => mockAuthRepository.signIn(
            email: 'test@example.com',
            password: 'password123',
          )).called(1);
    });

    test('signIn should update state to error on failure', () async {
      when(() => mockAuthRepository.signIn(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(Exception('Invalid credentials'));

      final viewModel = container.read(loginPageViewModelProvider.notifier);

      await viewModel.signIn(
        email: 'test@example.com',
        password: 'wrongpassword',
      );

      final state = container.read(loginPageViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Invalid credentials'));
    });
  });

  group('LoginFormValidation', () {
    test('initial state should be false', () {
      final isValid = container.read(loginFormValidationProvider);
      expect(isValid, false);
    });

    test('validateForm should return true for valid email and password', () {
      final viewModel = container.read(loginFormValidationProvider.notifier);

      viewModel.validateForm(
        email: 'test@example.com',
        password: 'password123',
      );

      expect(container.read(loginFormValidationProvider), true);
    });

    test('validateForm should return false for invalid email', () {
      final viewModel = container.read(loginFormValidationProvider.notifier);

      viewModel.validateForm(
        email: 'invalid-email',
        password: 'password123',
      );

      expect(container.read(loginFormValidationProvider), false);
    });

    test('validateForm should return false for empty email', () {
      final viewModel = container.read(loginFormValidationProvider.notifier);

      viewModel.validateForm(
        email: '',
        password: 'password123',
      );

      expect(container.read(loginFormValidationProvider), false);
    });

    test('validateForm should return false for short password', () {
      final viewModel = container.read(loginFormValidationProvider.notifier);

      viewModel.validateForm(
        email: 'test@example.com',
        password: '12345',
      );

      expect(container.read(loginFormValidationProvider), false);
    });

    test('validateForm should return false for empty password', () {
      final viewModel = container.read(loginFormValidationProvider.notifier);

      viewModel.validateForm(
        email: 'test@example.com',
        password: '',
      );

      expect(container.read(loginFormValidationProvider), false);
    });

    test('validateEmailField should return null for valid email', () {
      final viewModel = container.read(loginFormValidationProvider.notifier);

      final error = viewModel.validateEmailField('test@example.com');
      expect(error, null);
    });

    test('validateEmailField should return error for empty email', () {
      final viewModel = container.read(loginFormValidationProvider.notifier);

      final error = viewModel.validateEmailField('');
      expect(error, 'Please enter your email');
    });

    test('validateEmailField should return error for invalid email', () {
      final viewModel = container.read(loginFormValidationProvider.notifier);

      final error = viewModel.validateEmailField('invalid-email');
      expect(error, 'Please enter a valid email');
    });

    test('validatePasswordField should return null for valid password', () {
      final viewModel = container.read(loginFormValidationProvider.notifier);

      final error = viewModel.validatePasswordField('password123');
      expect(error, null);
    });

    test('validatePasswordField should return error for empty password', () {
      final viewModel = container.read(loginFormValidationProvider.notifier);

      final error = viewModel.validatePasswordField('');
      expect(error, 'Please enter your password');
    });

    test('validatePasswordField should return error for short password', () {
      final viewModel = container.read(loginFormValidationProvider.notifier);

      final error = viewModel.validatePasswordField('12345');
      expect(error, 'Password must be at least 6 characters');
    });
  });
}
