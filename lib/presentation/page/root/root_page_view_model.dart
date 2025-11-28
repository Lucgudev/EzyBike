import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/auth_repository_impl.dart';

part 'root_page_view_model.g.dart';

@riverpod
class RootPageViewModel extends _$RootPageViewModel {
  @override
  FutureOr<UserModel?> build() async {
    return await _checkSession();
  }

  Future<UserModel?> _checkSession() async {
    try {
      final authRepo = ref.read(authRepositoryProvider);
      final user = await authRepo.getCurrentUser();
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<void> refreshSession() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await _checkSession();
    });
  }
}
