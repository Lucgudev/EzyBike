import '../../data/models/rental_package_model.dart';
import '../../data/models/rental_request_model.dart';

abstract class RentalRepository {
  Future<List<RentalPackageModel>> getRentalPackages();

  Future<RentalRequestModel> createRentalRequest({
    required String userId,
    required String bikeId,
    required DateTime startDate,
    required String pickupLocation,
    required String phoneContact,
  });

  Future<List<RentalRequestModel>> getUserRentalRequests(String userId);

  Future<RentalRequestModel> getRentalRequestById(String id);
}
