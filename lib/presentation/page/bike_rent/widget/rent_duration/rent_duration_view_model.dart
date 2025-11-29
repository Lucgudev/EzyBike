import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_bike_customer_app/data/models/rent_duration_model.dart';
import 'package:sample_bike_customer_app/data/repositories/order_repository_impl.dart';

part 'rent_duration_view_model.g.dart';

@riverpod
class RentDurationViewModel extends _$RentDurationViewModel {
  @override
  FutureOr<List<RentDurationModel>> build() async {
    return await _loadRentDurations();
  }

  Future<List<RentDurationModel>> _loadRentDurations() async {
    try {
      final orderRepo = ref.read(orderRepositoryProvider);
      return await orderRepo.getRentDurations();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await _loadRentDurations();
    });
  }
}
