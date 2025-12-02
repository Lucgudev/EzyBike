import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/helper/supabase_error_handler.dart';
import '../../models/home_model.dart';
import '../../models/rental_package_model.dart';

class SupabaseHomeDataSource {
  SupabaseHomeDataSource();

  Future<HomeModel> getHomeSections() async {
    try {
      final data = await Supabase.instance.client
          .from('home')
          .select('section_id, sort_order, section:section_id (*)')
          .order('sort_order', ascending: true);
      final List<SectionModel> sections = (data as List)
          .map(
            (jsonItem) => SectionModel.fromJson(
              jsonItem['section'] as Map<String, dynamic>,
            ),
          )
          .toList();
      return HomeModel(sections: sections);
    } catch (e) {
      throw SupabaseErrorHandler.toUserFriendlyException(e);
    }
  }

  Future<List<RentalPackageModel>> getPackages() async {
    try {
      final data = await Supabase.instance.client
          .from('packets')
          .select('*')
          .order('created_at', ascending: true);

      return (data as List)
          .map(
            (json) => RentalPackageModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw SupabaseErrorHandler.toUserFriendlyException(e);
    }
  }
}
