import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../data/models/home_model.dart';
import '../../../../../data/repositories/home_repository_impl.dart';

part 'home_tab_view_model.g.dart';

@riverpod
class HomeTabViewModel extends _$HomeTabViewModel {
  @override
  FutureOr<HomeModel?> build() async {
    return await _loadHomeSections();
  }

  Future<HomeModel?> _loadHomeSections() async {
    try {
      final homeRepo = ref.read(homeRepositoryProvider);
      return await homeRepo.getHomeSections();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await _loadHomeSections();
    });
  }
}
