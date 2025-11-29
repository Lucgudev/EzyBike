import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/bike_rent_request_model.dart';
import '../../models/pickup_location_model.dart';
import '../../models/rent_duration_model.dart';

class SupabaseOrderDataSource {
  SupabaseOrderDataSource();

  Future<void> createBikeRent(BikeRentRequestModel request) async {
    try {
      await Supabase.instance.client.from('bike_rent').insert(request.toJson());
    } catch (e) {
      throw Exception('Failed to create bike rent: $e');
    }
  }

  Future<List<PickupLocationModel>> getPickupLocations() async {
    try {
      final data = await Supabase.instance.client.from('pickup_area').select();

      final List<PickupLocationModel> locations = (data as List)
          .map(
            (jsonItem) =>
                PickupLocationModel.fromJson(jsonItem as Map<String, dynamic>),
          )
          .toList();

      return locations;
    } catch (e) {
      throw Exception('Failed to get pickup locations: $e');
    }
  }

  Future<List<RentDurationModel>> getRentDurations() async {
    try {
      final data = await Supabase.instance.client
          .from('rent_duration')
          .select()
          .order('sort_order', ascending: true);

      final List<RentDurationModel> durations = (data as List)
          .map(
            (jsonItem) =>
                RentDurationModel.fromJson(jsonItem as Map<String, dynamic>),
          )
          .toList();

      return durations;
    } catch (e) {
      throw Exception('Failed to get rent durations: $e');
    }
  }
}
