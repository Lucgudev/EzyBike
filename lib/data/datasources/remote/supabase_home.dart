import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/home_model.dart';

class SupabaseHomeDataSource {
  SupabaseHomeDataSource();

  Future<HomeModel> getHomeSections() async {
    try {
      final data = await Supabase.instance.client
          .from('home')
          .select('section_id, sort_order, section:section_id (*)')
          .order('sort_order');
      final List<SectionModel> sections = data
          .map((jsonItem) => SectionModel.fromJson(jsonItem))
          .toList();
      return HomeModel(sections: sections);
    } catch (e) {
      throw Exception('Failed to get home sections: $e');
    }
  }
}
