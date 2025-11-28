import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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
  static final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  bool build() {
    return false;
  }

  void validateForm({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    final isEmailValid = _validateEmail(email);
    final isPasswordValid = _validatePassword(password);
    final isConfirmPasswordValid = _validateConfirmPassword(password, confirmPassword);

    state = isEmailValid && isPasswordValid && isConfirmPasswordValid;
  }

  bool _validateEmail(String email) {
    final trimmedEmail = email.trim();
    return trimmedEmail.isNotEmpty && _emailRegex.hasMatch(trimmedEmail);
  }

  bool _validatePassword(String password) {
    return password.isNotEmpty && password.length >= 6;
  }

  bool _validateConfirmPassword(String password, String confirmPassword) {
    return confirmPassword.isNotEmpty && password == confirmPassword;
  }

  String? validateEmailField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!_emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePasswordField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
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
