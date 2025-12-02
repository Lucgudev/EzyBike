import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/helper/validation_helper.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/auth_repository_impl.dart';

part 'login_page_view_model.g.dart';

@riverpod
class LoginPageViewModel extends _$LoginPageViewModel {
  @override
  FutureOr<UserModel?> build() {
    return null;
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final authRepo = ref.read(authRepositoryProvider);
      return await authRepo.signIn(
        email: email,
        password: password,
      );
    });
  }
}

@riverpod
class LoginFormValidation extends _$LoginFormValidation {
  @override
  bool build() {
    return false;
  }

  void validateForm({
    required String email,
    required String password,
  }) {
    final isEmailValid = ValidationHelper.isValidEmail(email);
    final isPasswordValid = ValidationHelper.isValidPassword(password);
    state = isEmailValid && isPasswordValid;
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
}
