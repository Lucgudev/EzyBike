import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../data/models/user_model.dart';

part 'profile_tab_state.freezed.dart';

@freezed
class ProfileTabState with _$ProfileTabState {
  const factory ProfileTabState({
    UserModel? user,
  }) = _ProfileTabState;

  factory ProfileTabState.initial() => const ProfileTabState();
}
