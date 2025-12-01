// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_package_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RentalPackageModel _$RentalPackageModelFromJson(Map<String, dynamic> json) {
  return _RentalPackageModel.fromJson(json);
}

/// @nodoc
mixin _$RentalPackageModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  String get terms => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this RentalPackageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RentalPackageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentalPackageModelCopyWith<RentalPackageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalPackageModelCopyWith<$Res> {
  factory $RentalPackageModelCopyWith(
    RentalPackageModel value,
    $Res Function(RentalPackageModel) then,
  ) = _$RentalPackageModelCopyWithImpl<$Res, RentalPackageModel>;
  @useResult
  $Res call({
    int id,
    String title,
    num price,
    String terms,
    String? description,
  });
}

/// @nodoc
class _$RentalPackageModelCopyWithImpl<$Res, $Val extends RentalPackageModel>
    implements $RentalPackageModelCopyWith<$Res> {
  _$RentalPackageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentalPackageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? terms = null,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as num,
            terms: null == terms
                ? _value.terms
                : terms // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RentalPackageModelImplCopyWith<$Res>
    implements $RentalPackageModelCopyWith<$Res> {
  factory _$$RentalPackageModelImplCopyWith(
    _$RentalPackageModelImpl value,
    $Res Function(_$RentalPackageModelImpl) then,
  ) = __$$RentalPackageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    num price,
    String terms,
    String? description,
  });
}

/// @nodoc
class __$$RentalPackageModelImplCopyWithImpl<$Res>
    extends _$RentalPackageModelCopyWithImpl<$Res, _$RentalPackageModelImpl>
    implements _$$RentalPackageModelImplCopyWith<$Res> {
  __$$RentalPackageModelImplCopyWithImpl(
    _$RentalPackageModelImpl _value,
    $Res Function(_$RentalPackageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RentalPackageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? terms = null,
    Object? description = freezed,
  }) {
    return _then(
      _$RentalPackageModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as num,
        terms: null == terms
            ? _value.terms
            : terms // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RentalPackageModelImpl implements _RentalPackageModel {
  const _$RentalPackageModelImpl({
    required this.id,
    required this.title,
    required this.price,
    required this.terms,
    this.description,
  });

  factory _$RentalPackageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentalPackageModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final num price;
  @override
  final String terms;
  @override
  final String? description;

  @override
  String toString() {
    return 'RentalPackageModel(id: $id, title: $title, price: $price, terms: $terms, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentalPackageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.terms, terms) || other.terms == terms) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, price, terms, description);

  /// Create a copy of RentalPackageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentalPackageModelImplCopyWith<_$RentalPackageModelImpl> get copyWith =>
      __$$RentalPackageModelImplCopyWithImpl<_$RentalPackageModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RentalPackageModelImplToJson(this);
  }
}

abstract class _RentalPackageModel implements RentalPackageModel {
  const factory _RentalPackageModel({
    required final int id,
    required final String title,
    required final num price,
    required final String terms,
    final String? description,
  }) = _$RentalPackageModelImpl;

  factory _RentalPackageModel.fromJson(Map<String, dynamic> json) =
      _$RentalPackageModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  num get price;
  @override
  String get terms;
  @override
  String? get description;

  /// Create a copy of RentalPackageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentalPackageModelImplCopyWith<_$RentalPackageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
