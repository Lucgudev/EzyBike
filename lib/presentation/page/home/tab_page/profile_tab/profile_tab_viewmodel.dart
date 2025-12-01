import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../data/repositories/auth_repository_impl.dart';
import 'profile_tab_state.dart';

part 'profile_tab_viewmodel.g.dart';

@riverpod
class ProfileTabViewModel extends _$ProfileTabViewModel {
  @override
  Future<ProfileTabState> build() async {
    final user = await _loadUser();
    return ProfileTabState(user: user);
  }

  Future<dynamic> _loadUser() async {
    try {
      final authRepo = ref.read(authRepositoryProvider);
      return await authRepo.getCurrentUser();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final authRepo = ref.read(authRepositoryProvider);
      await authRepo.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
