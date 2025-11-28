import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/bike_model.dart';

class SupabaseBikeDataSource {
  SupabaseBikeDataSource();

  Future<List<BikeModel>> getBikes() async {
    try {
      final data = await Supabase.instance.client
          .from('bikes')
          .select()
          .order('model', ascending: true);

      final List<BikeModel> bikes = (data as List)
          .map((jsonItem) => BikeModel.fromJson(jsonItem as Map<String, dynamic>))
          .toList();

      return bikes;
    } catch (e) {
      throw Exception('Failed to get bikes: $e');
    }
  }
}
