// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_tab_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileTabState {
  UserModel? get user => throw _privateConstructorUsedError;

  /// Create a copy of ProfileTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileTabStateCopyWith<ProfileTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileTabStateCopyWith<$Res> {
  factory $ProfileTabStateCopyWith(
    ProfileTabState value,
    $Res Function(ProfileTabState) then,
  ) = _$ProfileTabStateCopyWithImpl<$Res, ProfileTabState>;
  @useResult
  $Res call({UserModel? user});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$ProfileTabStateCopyWithImpl<$Res, $Val extends ProfileTabState>
    implements $ProfileTabStateCopyWith<$Res> {
  _$ProfileTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = freezed}) {
    return _then(
      _value.copyWith(
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileTabState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileTabStateImplCopyWith<$Res>
    implements $ProfileTabStateCopyWith<$Res> {
  factory _$$ProfileTabStateImplCopyWith(
    _$ProfileTabStateImpl value,
    $Res Function(_$ProfileTabStateImpl) then,
  ) = __$$ProfileTabStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ProfileTabStateImplCopyWithImpl<$Res>
    extends _$ProfileTabStateCopyWithImpl<$Res, _$ProfileTabStateImpl>
    implements _$$ProfileTabStateImplCopyWith<$Res> {
  __$$ProfileTabStateImplCopyWithImpl(
    _$ProfileTabStateImpl _value,
    $Res Function(_$ProfileTabStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = freezed}) {
    return _then(
      _$ProfileTabStateImpl(
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserModel?,
      ),
    );
  }
}

/// @nodoc

class _$ProfileTabStateImpl implements _ProfileTabState {
  const _$ProfileTabStateImpl({this.user});

  @override
  final UserModel? user;

  @override
  String toString() {
    return 'ProfileTabState(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileTabStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of ProfileTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileTabStateImplCopyWith<_$ProfileTabStateImpl> get copyWith =>
      __$$ProfileTabStateImplCopyWithImpl<_$ProfileTabStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ProfileTabState implements ProfileTabState {
  const factory _ProfileTabState({final UserModel? user}) =
      _$ProfileTabStateImpl;

  @override
  UserModel? get user;

  /// Create a copy of ProfileTabState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileTabStateImplCopyWith<_$ProfileTabStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
