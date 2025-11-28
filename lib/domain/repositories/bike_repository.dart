import '../../data/models/bike_model.dart';

abstract class BikeRepository {
  Future<List<BikeModel>> getBikes();

  Future<BikeModel> getBikeById(String id);

  Future<List<BikeModel>> filterBikes({
    bool? isAvailable,
    int? minRange,
    String? searchQuery,
  });
}
