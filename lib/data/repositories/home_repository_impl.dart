import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/local/package_cache_datasource.dart';
import '../datasources/remote/supabase_home.dart';
import '../models/home_model.dart';
import '../models/rental_package_model.dart';

part 'home_repository_impl.g.dart';

@riverpod
SupabaseHomeDataSource supabaseHomeDataSource(Ref ref) {
  return SupabaseHomeDataSource();
}

@riverpod
PackageCacheDataSource packageCacheDataSource(Ref ref) {
  return PackageCacheDataSource();
}

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepositoryImpl(
    ref.watch(supabaseHomeDataSourceProvider),
    ref.watch(packageCacheDataSourceProvider),
  );
}

class HomeRepositoryImpl implements HomeRepository {
  final SupabaseHomeDataSource _homeDataSource;
  final PackageCacheDataSource _cacheDataSource;

  HomeRepositoryImpl(this._homeDataSource, this._cacheDataSource);

  @override
  Future<HomeModel> getHomeSections() async {
    return await _homeDataSource.getHomeSections();
  }

  @override
  Future<List<RentalPackageModel>> getPackages() async {
    try {
      // Try to get cached packages first
      final cachedPackages = await _cacheDataSource.getCachedPackages();

      if (cachedPackages != null) {
        // Return cached data if it's still valid
        return cachedPackages;
      }

      // Cache is invalid or doesn't exist, fetch from API
      final packages = await _homeDataSource.getPackages();

      // Cache the new data
      await _cacheDataSource.cachePackages(packages);

      return packages;
    } catch (e) {
      rethrow;
    }
  }
}
