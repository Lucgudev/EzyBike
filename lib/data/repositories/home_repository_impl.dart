import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/remote/supabase_home.dart';
import '../models/home_model.dart';

part 'home_repository_impl.g.dart';

@riverpod
SupabaseHomeDataSource supabaseHomeDataSource(Ref ref) {
  return SupabaseHomeDataSource();
}

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepositoryImpl(ref.watch(supabaseHomeDataSourceProvider));
}

class HomeRepositoryImpl implements HomeRepository {
  final SupabaseHomeDataSource _homeDataSource;

  HomeRepositoryImpl(this._homeDataSource);

  @override
  Future<HomeModel> getHomeSections() async {
    return await _homeDataSource.getHomeSections();
  }
}
