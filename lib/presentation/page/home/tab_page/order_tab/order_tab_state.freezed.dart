// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_tab_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OrderTabState {
  List<BikeRentOrderModel> get orders => throw _privateConstructorUsedError;

  /// Create a copy of OrderTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderTabStateCopyWith<OrderTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTabStateCopyWith<$Res> {
  factory $OrderTabStateCopyWith(
    OrderTabState value,
    $Res Function(OrderTabState) then,
  ) = _$OrderTabStateCopyWithImpl<$Res, OrderTabState>;
  @useResult
  $Res call({List<BikeRentOrderModel> orders});
}

/// @nodoc
class _$OrderTabStateCopyWithImpl<$Res, $Val extends OrderTabState>
    implements $OrderTabStateCopyWith<$Res> {
  _$OrderTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orders = null}) {
    return _then(
      _value.copyWith(
            orders: null == orders
                ? _value.orders
                : orders // ignore: cast_nullable_to_non_nullable
                      as List<BikeRentOrderModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderTabStateImplCopyWith<$Res>
    implements $OrderTabStateCopyWith<$Res> {
  factory _$$OrderTabStateImplCopyWith(
    _$OrderTabStateImpl value,
    $Res Function(_$OrderTabStateImpl) then,
  ) = __$$OrderTabStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BikeRentOrderModel> orders});
}

/// @nodoc
class __$$OrderTabStateImplCopyWithImpl<$Res>
    extends _$OrderTabStateCopyWithImpl<$Res, _$OrderTabStateImpl>
    implements _$$OrderTabStateImplCopyWith<$Res> {
  __$$OrderTabStateImplCopyWithImpl(
    _$OrderTabStateImpl _value,
    $Res Function(_$OrderTabStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orders = null}) {
    return _then(
      _$OrderTabStateImpl(
        orders: null == orders
            ? _value._orders
            : orders // ignore: cast_nullable_to_non_nullable
                  as List<BikeRentOrderModel>,
      ),
    );
  }
}

/// @nodoc

class _$OrderTabStateImpl implements _OrderTabState {
  const _$OrderTabStateImpl({required final List<BikeRentOrderModel> orders})
    : _orders = orders;

  final List<BikeRentOrderModel> _orders;
  @override
  List<BikeRentOrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'OrderTabState(orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTabStateImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orders));

  /// Create a copy of OrderTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTabStateImplCopyWith<_$OrderTabStateImpl> get copyWith =>
      __$$OrderTabStateImplCopyWithImpl<_$OrderTabStateImpl>(this, _$identity);
}

abstract class _OrderTabState implements OrderTabState {
  const factory _OrderTabState({
    required final List<BikeRentOrderModel> orders,
  }) = _$OrderTabStateImpl;

  @override
  List<BikeRentOrderModel> get orders;

  /// Create a copy of OrderTabState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderTabStateImplCopyWith<_$OrderTabStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
