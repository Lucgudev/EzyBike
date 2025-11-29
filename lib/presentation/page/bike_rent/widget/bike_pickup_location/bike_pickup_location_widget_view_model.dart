import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_bike_customer_app/data/models/pickup_location_model.dart';
import 'package:sample_bike_customer_app/data/repositories/order_repository_impl.dart';

part 'bike_pickup_location_widget_view_model.g.dart';

@riverpod
class BikePickupLocationWidgetViewModel
    extends _$BikePickupLocationWidgetViewModel {
  @override
  FutureOr<List<PickupLocationModel>> build() async {
    return await _loadPickupLocations();
  }

  Future<List<PickupLocationModel>> _loadPickupLocations() async {
    try {
      final orderRepo = ref.read(orderRepositoryProvider);
      return await orderRepo.getPickupLocations();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await _loadPickupLocations();
    });
  }
}
