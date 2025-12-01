import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_bike_customer_app/data/models/rental_package_model.dart';

part 'list_package_widget_state.freezed.dart';

@freezed
class ListPackageWidgetState with _$ListPackageWidgetState {
  const factory ListPackageWidgetState({
    @Default([]) List<RentalPackageModel> packages,
  }) = _ListPackageWidgetState;
}
