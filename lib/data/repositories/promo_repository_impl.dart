import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/promo_repository.dart';
import '../datasources/remote/supabase_promo.dart';
import '../models/banner_model.dart';

part 'promo_repository_impl.g.dart';

@riverpod
SupabasePromoDataSource supabasePromoDataSource(Ref ref) {
  return SupabasePromoDataSource();
}

@riverpod
PromoRepository promoRepository(Ref ref) {
  return PromoRepositoryImpl(ref.watch(supabasePromoDataSourceProvider));
}

class PromoRepositoryImpl implements PromoRepository {
  final SupabasePromoDataSource _promoDataSource;

  PromoRepositoryImpl(this._promoDataSource);

  @override
  Future<List<BannerModel>> getPromos() async {
    return await _promoDataSource.getPromos();
  }
}
