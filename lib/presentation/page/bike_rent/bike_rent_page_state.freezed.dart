// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bike_rent_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BikeRentPageState {
  bool get isFormValid => throw _privateConstructorUsedError;

  /// Create a copy of BikeRentPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BikeRentPageStateCopyWith<BikeRentPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BikeRentPageStateCopyWith<$Res> {
  factory $BikeRentPageStateCopyWith(
    BikeRentPageState value,
    $Res Function(BikeRentPageState) then,
  ) = _$BikeRentPageStateCopyWithImpl<$Res, BikeRentPageState>;
  @useResult
  $Res call({bool isFormValid});
}

/// @nodoc
class _$BikeRentPageStateCopyWithImpl<$Res, $Val extends BikeRentPageState>
    implements $BikeRentPageStateCopyWith<$Res> {
  _$BikeRentPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BikeRentPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isFormValid = null}) {
    return _then(
      _value.copyWith(
            isFormValid: null == isFormValid
                ? _value.isFormValid
                : isFormValid // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BikeRentPageStateImplCopyWith<$Res>
    implements $BikeRentPageStateCopyWith<$Res> {
  factory _$$BikeRentPageStateImplCopyWith(
    _$BikeRentPageStateImpl value,
    $Res Function(_$BikeRentPageStateImpl) then,
  ) = __$$BikeRentPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFormValid});
}

/// @nodoc
class __$$BikeRentPageStateImplCopyWithImpl<$Res>
    extends _$BikeRentPageStateCopyWithImpl<$Res, _$BikeRentPageStateImpl>
    implements _$$BikeRentPageStateImplCopyWith<$Res> {
  __$$BikeRentPageStateImplCopyWithImpl(
    _$BikeRentPageStateImpl _value,
    $Res Function(_$BikeRentPageStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BikeRentPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isFormValid = null}) {
    return _then(
      _$BikeRentPageStateImpl(
        isFormValid: null == isFormValid
            ? _value.isFormValid
            : isFormValid // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$BikeRentPageStateImpl implements _BikeRentPageState {
  const _$BikeRentPageStateImpl({this.isFormValid = false});

  @override
  @JsonKey()
  final bool isFormValid;

  @override
  String toString() {
    return 'BikeRentPageState(isFormValid: $isFormValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BikeRentPageStateImpl &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFormValid);

  /// Create a copy of BikeRentPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BikeRentPageStateImplCopyWith<_$BikeRentPageStateImpl> get copyWith =>
      __$$BikeRentPageStateImplCopyWithImpl<_$BikeRentPageStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BikeRentPageState implements BikeRentPageState {
  const factory _BikeRentPageState({final bool isFormValid}) =
      _$BikeRentPageStateImpl;

  @override
  bool get isFormValid;

  /// Create a copy of BikeRentPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BikeRentPageStateImplCopyWith<_$BikeRentPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
