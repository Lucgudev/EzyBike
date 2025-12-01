import '../../data/models/home_model.dart';
import '../../data/models/rental_package_model.dart';

abstract class HomeRepository {
  /// Get home sections data
  Future<HomeModel> getHomeSections();

  /// Get rental packages
  Future<List<RentalPackageModel>> getPackages();
}
