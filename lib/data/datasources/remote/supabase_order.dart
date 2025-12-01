import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/bike_rent_order_model.dart';
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

  Future<List<BikeRentOrderModel>> getOrderHistory() async {
    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final data = await Supabase.instance.client
          .from('bike_rent')
          .select('''
            id,
            created_at,
            start_date,
            total,
            bike:bikes!bike_id(*),
            pickup_area:pickup_area!pickup_area_id(*),
            duration:rent_duration!duration_id(*)
          ''')
          .eq('user_id', user.id)
          .order('created_at', ascending: false);

      final List<BikeRentOrderModel> orders = (data as List)
          .map((jsonItem) {
            final item = jsonItem as Map<String, dynamic>;
            return BikeRentOrderModel.fromJson({
              'id': item['id'],
              'created_at': item['created_at'],
              'start_date': item['start_date'],
              'total': item['total'],
              'bike': item['bike'],
              'pickup_area': item['pickup_area'],
              'duration': item['duration'],
            });
          })
          .toList();

      return orders;
    } catch (e) {
      throw Exception('Failed to get order history: $e');
    }
  }
}
