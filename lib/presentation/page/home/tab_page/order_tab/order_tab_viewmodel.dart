import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_bike_customer_app/data/models/bike_rent_order_model.dart';
import '../../../../../data/repositories/order_repository_impl.dart';
import 'order_tab_state.dart';

part 'order_tab_viewmodel.g.dart';

@riverpod
class OrderTabViewModel extends _$OrderTabViewModel {
  @override
  Future<OrderTabState> build() async {
    final orders = await _loadOrders();
    return OrderTabState(orders: orders);
  }

  Future<List<BikeRentOrderModel>> _loadOrders() async {
    try {
      final orderRepo = ref.read(orderRepositoryProvider);
      return await orderRepo.getOrderHistory();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final orders = await _loadOrders();
      return OrderTabState(orders: orders);
    });
  }
}
