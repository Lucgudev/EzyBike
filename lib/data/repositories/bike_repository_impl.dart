import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/bike_repository.dart';
import '../datasources/remote/supabase_bike.dart';
import '../models/bike_model.dart';

part 'bike_repository_impl.g.dart';

@riverpod
SupabaseBikeDataSource supabaseBikeDataSource(Ref ref) {
  return SupabaseBikeDataSource();
}

@riverpod
BikeRepository bikeRepository(Ref ref) {
  return BikeRepositoryImpl(ref.watch(supabaseBikeDataSourceProvider));
}

class BikeRepositoryImpl implements BikeRepository {
  final SupabaseBikeDataSource _bikeDataSource;

  BikeRepositoryImpl(this._bikeDataSource);

  @override
  Future<List<BikeModel>> getBikes() async {
    return await _bikeDataSource.getBikes();
  }

  @override
  Future<List<BikeModel>> filterBikes({
    bool? isAvailable,
    int? minRange,
    String? searchQuery,
  }) {
    // TODO: implement filterBikes
    throw UnimplementedError();
  }

  @override
  Future<BikeModel> getBikeById(String id) {
    // TODO: implement getBikeById
    throw UnimplementedError();
  }
}
