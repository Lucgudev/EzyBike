import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/helper/supabase_error_handler.dart';
import '../../models/banner_model.dart';

class SupabasePromoDataSource {
  SupabasePromoDataSource();

  Future<List<BannerModel>> getPromos() async {
    try {
      final data = await Supabase.instance.client.from('promos').select();

      final List<BannerModel> promos = (data as List)
          .map(
            (jsonItem) =>
                BannerModel.fromJson(jsonItem as Map<String, dynamic>),
          )
          .toList();

      return promos;
    } catch (e) {
      throw SupabaseErrorHandler.toUserFriendlyException(e);
    }
  }
}
