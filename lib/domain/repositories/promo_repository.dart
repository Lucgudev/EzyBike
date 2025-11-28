import '../../data/models/banner_model.dart';

abstract class PromoRepository {
  /// Get list of promos
  Future<List<BannerModel>> getPromos();
}
