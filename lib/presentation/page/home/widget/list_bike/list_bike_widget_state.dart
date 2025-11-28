import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../data/models/bike_model.dart';

part 'list_bike_widget_state.freezed.dart';

@freezed
class ListBikeWidgetState with _$ListBikeWidgetState {
  const factory ListBikeWidgetState({
    required List<BikeModel> bikes,
  }) = _ListBikeWidgetState;

  factory ListBikeWidgetState.initial() => const ListBikeWidgetState(
        bikes: [],
      );
}
