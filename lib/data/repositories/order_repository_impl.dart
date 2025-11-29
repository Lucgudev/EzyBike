import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/remote/supabase_order.dart';
import '../models/bike_rent_request_model.dart';
import '../models/pickup_location_model.dart';
import '../models/rent_duration_model.dart';

part 'order_repository_impl.g.dart';

@riverpod
OrderRepository orderRepository(OrderRepositoryRef ref) {
  return OrderRepositoryImpl();
}

class OrderRepositoryImpl implements OrderRepository {
  final SupabaseOrderDataSource _dataSource = SupabaseOrderDataSource();

  @override
  Future<void> createBikeRent(BikeRentRequestModel request) async {
    try {
      await _dataSource.createBikeRent(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PickupLocationModel>> getPickupLocations() async {
    try {
      return await _dataSource.getPickupLocations();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RentDurationModel>> getRentDurations() async {
    try {
      return await _dataSource.getRentDurations();
    } catch (e) {
      rethrow;
    }
  }
}
