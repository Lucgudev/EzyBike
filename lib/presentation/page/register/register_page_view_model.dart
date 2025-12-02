import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/helper/validation_helper.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/auth_repository_impl.dart';

part 'register_page_view_model.g.dart';

@riverpod
class RegisterPageViewModel extends _$RegisterPageViewModel {
  @override
  FutureOr<UserModel?> build() {
    return null;
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final authRepo = ref.read(authRepositoryProvider);
      return await authRepo.signUp(
        email: email,
        password: password,
      );
    });
  }
}

@riverpod
class RegisterFormValidation extends _$RegisterFormValidation {
  @override
  bool build() {
    return false;
  }

  void validateForm({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    final isEmailValid = ValidationHelper.isValidEmail(email);
    final isPasswordValid = ValidationHelper.isValidPassword(password);
    final isConfirmPasswordValid = _validateConfirmPassword(password, confirmPassword);

    state = isEmailValid && isPasswordValid && isConfirmPasswordValid;
  }

  bool _validateConfirmPassword(String password, String confirmPassword) {
    return confirmPassword.isNotEmpty && password == confirmPassword;
  }

  String? validateEmailField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!ValidationHelper.isValidEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePasswordField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (!ValidationHelper.isValidPassword(value)) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPasswordField(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
