import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/bike_rent_request_model.dart';

class SupabaseOrderDataSource {
  SupabaseOrderDataSource();

  Future<void> createBikeRent(BikeRentRequestModel request) async {
    try {
      await Supabase.instance.client
          .from('bike_rent')
          .insert(request.toJson());
    } catch (e) {
      throw Exception('Failed to create bike rent: $e');
    }
  }
}
