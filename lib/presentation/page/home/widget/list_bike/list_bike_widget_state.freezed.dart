// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_bike_widget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ListBikeWidgetState {
  List<BikeModel> get bikes => throw _privateConstructorUsedError;

  /// Create a copy of ListBikeWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListBikeWidgetStateCopyWith<ListBikeWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListBikeWidgetStateCopyWith<$Res> {
  factory $ListBikeWidgetStateCopyWith(
    ListBikeWidgetState value,
    $Res Function(ListBikeWidgetState) then,
  ) = _$ListBikeWidgetStateCopyWithImpl<$Res, ListBikeWidgetState>;
  @useResult
  $Res call({List<BikeModel> bikes});
}

/// @nodoc
class _$ListBikeWidgetStateCopyWithImpl<$Res, $Val extends ListBikeWidgetState>
    implements $ListBikeWidgetStateCopyWith<$Res> {
  _$ListBikeWidgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListBikeWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? bikes = null}) {
    return _then(
      _value.copyWith(
            bikes: null == bikes
                ? _value.bikes
                : bikes // ignore: cast_nullable_to_non_nullable
                      as List<BikeModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ListBikeWidgetStateImplCopyWith<$Res>
    implements $ListBikeWidgetStateCopyWith<$Res> {
  factory _$$ListBikeWidgetStateImplCopyWith(
    _$ListBikeWidgetStateImpl value,
    $Res Function(_$ListBikeWidgetStateImpl) then,
  ) = __$$ListBikeWidgetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BikeModel> bikes});
}

/// @nodoc
class __$$ListBikeWidgetStateImplCopyWithImpl<$Res>
    extends _$ListBikeWidgetStateCopyWithImpl<$Res, _$ListBikeWidgetStateImpl>
    implements _$$ListBikeWidgetStateImplCopyWith<$Res> {
  __$$ListBikeWidgetStateImplCopyWithImpl(
    _$ListBikeWidgetStateImpl _value,
    $Res Function(_$ListBikeWidgetStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListBikeWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? bikes = null}) {
    return _then(
      _$ListBikeWidgetStateImpl(
        bikes: null == bikes
            ? _value._bikes
            : bikes // ignore: cast_nullable_to_non_nullable
                  as List<BikeModel>,
      ),
    );
  }
}

/// @nodoc

class _$ListBikeWidgetStateImpl implements _ListBikeWidgetState {
  const _$ListBikeWidgetStateImpl({required final List<BikeModel> bikes})
    : _bikes = bikes;

  final List<BikeModel> _bikes;
  @override
  List<BikeModel> get bikes {
    if (_bikes is EqualUnmodifiableListView) return _bikes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bikes);
  }

  @override
  String toString() {
    return 'ListBikeWidgetState(bikes: $bikes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListBikeWidgetStateImpl &&
            const DeepCollectionEquality().equals(other._bikes, _bikes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_bikes));

  /// Create a copy of ListBikeWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListBikeWidgetStateImplCopyWith<_$ListBikeWidgetStateImpl> get copyWith =>
      __$$ListBikeWidgetStateImplCopyWithImpl<_$ListBikeWidgetStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ListBikeWidgetState implements ListBikeWidgetState {
  const factory _ListBikeWidgetState({required final List<BikeModel> bikes}) =
      _$ListBikeWidgetStateImpl;

  @override
  List<BikeModel> get bikes;

  /// Create a copy of ListBikeWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListBikeWidgetStateImplCopyWith<_$ListBikeWidgetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
