import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_bike_customer_app/data/models/bike_model.dart';
import '../../../../../data/repositories/bike_repository_impl.dart';
import 'list_bike_widget_state.dart';

part 'list_bike_widget_viewmodel.g.dart';

@riverpod
class ListBikeWidgetViewModel extends _$ListBikeWidgetViewModel {
  @override
  FutureOr<ListBikeWidgetState> build() async {
    final bikes = await _loadBikes();
    final availableColors = _getUniqueColors(bikes);
    return ListBikeWidgetState(
      bikes: bikes,
      filteredBikes: bikes,
      availableColors: availableColors,
    );
  }

  Future<List<BikeModel>> _loadBikes() async {
    try {
      final bikeRepo = ref.read(bikeRepositoryProvider);
      return await bikeRepo.getBikes();
    } catch (e) {
      rethrow;
    }
  }

  List<String> _getUniqueColors(List<BikeModel> bikes) {
    return bikes
        .where((bike) => bike.color != null)
        .map((bike) => bike.color!)
        .toSet()
        .toList();
  }

  void filterByColor(String? color) {
    state.whenData((currentState) {
      if (color == null) {
        // Clear filter - show all bikes
        state = AsyncValue.data(
          currentState.copyWith(
            filteredBikes: currentState.bikes,
            selectedColor: null,
          ),
        );
      } else {
        // Filter bikes by color
        final filtered = currentState.bikes
            .where((bike) => bike.color == color)
            .toList();
        state = AsyncValue.data(
          currentState.copyWith(
            filteredBikes: filtered,
            selectedColor: color,
          ),
        );
      }
    });
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final bikes = await _loadBikes();
      final availableColors = _getUniqueColors(bikes);
      return ListBikeWidgetState(
        bikes: bikes,
        filteredBikes: bikes,
        availableColors: availableColors,
      );
    });
  }
}
