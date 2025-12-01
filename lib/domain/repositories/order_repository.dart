import '../../data/models/bike_rent_order_model.dart';
import '../../data/models/bike_rent_request_model.dart';
import '../../data/models/pickup_location_model.dart';
import '../../data/models/rent_duration_model.dart';

abstract class OrderRepository {
  Future<void> createBikeRent(BikeRentRequestModel request);
  Future<List<PickupLocationModel>> getPickupLocations();
  Future<List<RentDurationModel>> getRentDurations();
  Future<List<BikeRentOrderModel>> getOrderHistory();
}
