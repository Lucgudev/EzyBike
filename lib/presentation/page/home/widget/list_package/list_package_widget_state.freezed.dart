// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_package_widget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ListPackageWidgetState {
  List<RentalPackageModel> get packages => throw _privateConstructorUsedError;

  /// Create a copy of ListPackageWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListPackageWidgetStateCopyWith<ListPackageWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListPackageWidgetStateCopyWith<$Res> {
  factory $ListPackageWidgetStateCopyWith(
    ListPackageWidgetState value,
    $Res Function(ListPackageWidgetState) then,
  ) = _$ListPackageWidgetStateCopyWithImpl<$Res, ListPackageWidgetState>;
  @useResult
  $Res call({List<RentalPackageModel> packages});
}

/// @nodoc
class _$ListPackageWidgetStateCopyWithImpl<
  $Res,
  $Val extends ListPackageWidgetState
>
    implements $ListPackageWidgetStateCopyWith<$Res> {
  _$ListPackageWidgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListPackageWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? packages = null}) {
    return _then(
      _value.copyWith(
            packages: null == packages
                ? _value.packages
                : packages // ignore: cast_nullable_to_non_nullable
                      as List<RentalPackageModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ListPackageWidgetStateImplCopyWith<$Res>
    implements $ListPackageWidgetStateCopyWith<$Res> {
  factory _$$ListPackageWidgetStateImplCopyWith(
    _$ListPackageWidgetStateImpl value,
    $Res Function(_$ListPackageWidgetStateImpl) then,
  ) = __$$ListPackageWidgetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RentalPackageModel> packages});
}

/// @nodoc
class __$$ListPackageWidgetStateImplCopyWithImpl<$Res>
    extends
        _$ListPackageWidgetStateCopyWithImpl<$Res, _$ListPackageWidgetStateImpl>
    implements _$$ListPackageWidgetStateImplCopyWith<$Res> {
  __$$ListPackageWidgetStateImplCopyWithImpl(
    _$ListPackageWidgetStateImpl _value,
    $Res Function(_$ListPackageWidgetStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListPackageWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? packages = null}) {
    return _then(
      _$ListPackageWidgetStateImpl(
        packages: null == packages
            ? _value._packages
            : packages // ignore: cast_nullable_to_non_nullable
                  as List<RentalPackageModel>,
      ),
    );
  }
}

/// @nodoc

class _$ListPackageWidgetStateImpl implements _ListPackageWidgetState {
  const _$ListPackageWidgetStateImpl({
    final List<RentalPackageModel> packages = const [],
  }) : _packages = packages;

  final List<RentalPackageModel> _packages;
  @override
  @JsonKey()
  List<RentalPackageModel> get packages {
    if (_packages is EqualUnmodifiableListView) return _packages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packages);
  }

  @override
  String toString() {
    return 'ListPackageWidgetState(packages: $packages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListPackageWidgetStateImpl &&
            const DeepCollectionEquality().equals(other._packages, _packages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_packages));

  /// Create a copy of ListPackageWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListPackageWidgetStateImplCopyWith<_$ListPackageWidgetStateImpl>
  get copyWith =>
      __$$ListPackageWidgetStateImplCopyWithImpl<_$ListPackageWidgetStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ListPackageWidgetState implements ListPackageWidgetState {
  const factory _ListPackageWidgetState({
    final List<RentalPackageModel> packages,
  }) = _$ListPackageWidgetStateImpl;

  @override
  List<RentalPackageModel> get packages;

  /// Create a copy of ListPackageWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListPackageWidgetStateImplCopyWith<_$ListPackageWidgetStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
