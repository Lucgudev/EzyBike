import '../../data/models/bike_rent_request_model.dart';

abstract class OrderRepository {
  Future<void> createBikeRent(BikeRentRequestModel request);
}
