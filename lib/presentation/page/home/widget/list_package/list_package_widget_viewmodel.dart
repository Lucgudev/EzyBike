import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_bike_customer_app/data/repositories/home_repository_impl.dart';
import 'list_package_widget_state.dart';

part 'list_package_widget_viewmodel.g.dart';

@riverpod
class ListPackageWidgetViewModel extends _$ListPackageWidgetViewModel {
  @override
  Future<ListPackageWidgetState> build() async {
    return await _loadPackages();
  }

  Future<ListPackageWidgetState> _loadPackages() async {
    try {
      final homeRepo = ref.read(homeRepositoryProvider);
      final packages = await homeRepo.getPackages();
      return ListPackageWidgetState(packages: packages);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await _loadPackages();
    });
  }
}
