import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../data/models/bike_rent_order_model.dart';

part 'order_tab_state.freezed.dart';

@freezed
class OrderTabState with _$OrderTabState {
  const factory OrderTabState({
    required List<BikeRentOrderModel> orders,
  }) = _OrderTabState;

  factory OrderTabState.initial() => const OrderTabState(
        orders: [],
      );
}
