import '../../data/models/home_model.dart';

abstract class HomeRepository {
  /// Get home sections data
  Future<HomeModel> getHomeSections();
}
