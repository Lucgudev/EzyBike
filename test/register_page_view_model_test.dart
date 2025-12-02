import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_bike_customer_app/data/models/user_model.dart';
import 'package:sample_bike_customer_app/data/repositories/auth_repository_impl.dart';
import 'package:sample_bike_customer_app/domain/repositories/auth_repository.dart';
import 'package:sample_bike_customer_app/presentation/page/register/register_page_view_model.dart';

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

  group('RegisterPageViewModel', () {
    test('initial state should be null', () {
      final viewModel = container.read(registerPageViewModelProvider);

      expect(viewModel.value, null);
    });

    test('signUp should update state to loading then success with user data', () async {
      final testUser = UserModel(
        id: '123',
        email: 'newuser@example.com',
        name: 'New User',
        phone: null,
        profileImageUrl: null,
        createdAt: DateTime.now(),
      );

      when(() => mockAuthRepository.signUp(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => testUser);

      final viewModel = container.read(registerPageViewModelProvider.notifier);

      final future = viewModel.signUp(
        email: 'newuser@example.com',
        password: 'password123',
      );

      // State should be loading
      expect(container.read(registerPageViewModelProvider).isLoading, true);

      await future;

      // State should contain user data
      final state = container.read(registerPageViewModelProvider);
      expect(state.hasValue, true);
      expect(state.value?.id, '123');
      expect(state.value?.email, 'newuser@example.com');

      verify(() => mockAuthRepository.signUp(
            email: 'newuser@example.com',
            password: 'password123',
          )).called(1);
    });

    test('signUp should update state to error on failure', () async {
      when(() => mockAuthRepository.signUp(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(Exception('Email already exists'));

      final viewModel = container.read(registerPageViewModelProvider.notifier);

      await viewModel.signUp(
        email: 'existing@example.com',
        password: 'password123',
      );

      final state = container.read(registerPageViewModelProvider);
      expect(state.hasError, true);
      expect(state.error.toString(), contains('Email already exists'));
    });
  });

  group('RegisterFormValidation', () {
    test('initial state should be false', () {
      final isValid = container.read(registerFormValidationProvider);
      expect(isValid, false);
    });

    test('validateForm should return true for valid inputs', () {
      final viewModel = container.read(registerFormValidationProvider.notifier);

      viewModel.validateForm(
        email: 'test@example.com',
        password: 'password123',
        confirmPassword: 'password123',
      );

      expect(container.read(registerFormValidationProvider), true);
    });

    test('validateForm should return false for invalid email', () {
      final viewModel = container.read(registerFormValidationProvider.notifier);

      viewModel.validateForm(
        email: 'invalid-email',
        password: 'password123',
        confirmPassword: 'password123',
      );

      expect(container.read(registerFormValidationProvider), false);
    });

    test('validateForm should return false for short password', () {
      final viewModel = container.read(registerFormValidationProvider.notifier);

      viewModel.validateForm(
        email: 'test@example.com',
        password: '12345',
        confirmPassword: '12345',
      );

      expect(container.read(registerFormValidationProvider), false);
    });

    test('validateForm should return false for mismatched passwords', () {
      final viewModel = container.read(registerFormValidationProvider.notifier);

      viewModel.validateForm(
        email: 'test@example.com',
        password: 'password123',
        confirmPassword: 'password456',
      );

      expect(container.read(registerFormValidationProvider), false);
    });

    test('validateEmailField should return null for valid email', () {
      final viewModel = container.read(registerFormValidationProvider.notifier);

      final error = viewModel.validateEmailField('test@example.com');
      expect(error, null);
    });

    test('validateEmailField should return error for empty email', () {
      final viewModel = container.read(registerFormValidationProvider.notifier);

      final error = viewModel.validateEmailField('');
      expect(error, 'Please enter your email');
    });

    test('validateEmailField should return error for invalid email', () {
      final viewModel = container.read(registerFormValidationProvider.notifier);

      final error = viewModel.validateEmailField('invalid-email');
      expect(error, 'Please enter a valid email');
    });

    test('validatePasswordField should return null for valid password', () {
      final viewModel = container.read(registerFormValidationProvider.notifier);

      final error = viewModel.validatePasswordField('password123');
      expect(error, null);
    });

    test('validatePasswordField should return error for empty password', () {
      final viewModel = container.read(registerFormValidationProvider.notifier);

      final error = viewModel.validatePasswordField('');
      expect(error, 'Please enter your password');
    });

    test('validatePasswordField should return error for short password', () {
      final viewModel = container.read(registerFormValidationProvider.notifier);

      final error = viewModel.validatePasswordField('12345');
      expect(error, 'Password must be at least 6 characters');
    });

    test('validateConfirmPasswordField should return null for matching passwords', () {
      final viewModel = container.read(registerFormValidationProvider.notifier);

      final error = viewModel.validateConfirmPasswordField('password123', 'password123');
      expect(error, null);
    });

    test('validateConfirmPasswordField should return error for empty confirm password', () {
      final viewModel = container.read(registerFormValidationProvider.notifier);

      final error = viewModel.validateConfirmPasswordField('', 'password123');
      expect(error, 'Please confirm your password');
    });

    test('validateConfirmPasswordField should return error for mismatched passwords', () {
      final viewModel = container.read(registerFormValidationProvider.notifier);

      final error = viewModel.validateConfirmPasswordField('password456', 'password123');
      expect(error, 'Passwords do not match');
    });
  });
}
