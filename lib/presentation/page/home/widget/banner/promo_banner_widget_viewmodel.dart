import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../data/models/banner_model.dart';
import '../../../../../data/repositories/promo_repository_impl.dart';

part 'promo_banner_widget_viewmodel.g.dart';

@riverpod
class PromoBannerWidgetViewModel extends _$PromoBannerWidgetViewModel {
  @override
  FutureOr<List<BannerModel>> build() async {
    return await _loadPromos();
  }

  Future<List<BannerModel>> _loadPromos() async {
    try {
      final promoRepo = ref.read(promoRepositoryProvider);
      return await promoRepo.getPromos();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await _loadPromos();
    });
  }
}
