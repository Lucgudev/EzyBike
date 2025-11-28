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
    return ListBikeWidgetState(bikes: bikes);
  }

  Future<List<BikeModel>> _loadBikes() async {
    try {
      final bikeRepo = ref.read(bikeRepositoryProvider);
      return await bikeRepo.getBikes();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final bikes = await _loadBikes();
      return ListBikeWidgetState(bikes: bikes);
    });
  }
}
