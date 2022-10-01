// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) {
  return _ProductCategory.fromJson(json);
}

/// @nodoc
mixin _$ProductCategory {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_category_name')
  String? get productCategoryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCategoryCopyWith<ProductCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoryCopyWith<$Res> {
  factory $ProductCategoryCopyWith(
          ProductCategory value, $Res Function(ProductCategory) then) =
      _$ProductCategoryCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'product_category_name') String? productCategoryName});
}

/// @nodoc
class _$ProductCategoryCopyWithImpl<$Res>
    implements $ProductCategoryCopyWith<$Res> {
  _$ProductCategoryCopyWithImpl(this._value, this._then);

  final ProductCategory _value;
  // ignore: unused_field
  final $Res Function(ProductCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? productCategoryName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productCategoryName: productCategoryName == freezed
          ? _value.productCategoryName
          : productCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductCategoryCopyWith<$Res>
    implements $ProductCategoryCopyWith<$Res> {
  factory _$$_ProductCategoryCopyWith(
          _$_ProductCategory value, $Res Function(_$_ProductCategory) then) =
      __$$_ProductCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'product_category_name') String? productCategoryName});
}

/// @nodoc
class __$$_ProductCategoryCopyWithImpl<$Res>
    extends _$ProductCategoryCopyWithImpl<$Res>
    implements _$$_ProductCategoryCopyWith<$Res> {
  __$$_ProductCategoryCopyWithImpl(
      _$_ProductCategory _value, $Res Function(_$_ProductCategory) _then)
      : super(_value, (v) => _then(v as _$_ProductCategory));

  @override
  _$_ProductCategory get _value => super._value as _$_ProductCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? productCategoryName = freezed,
  }) {
    return _then(_$_ProductCategory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productCategoryName: productCategoryName == freezed
          ? _value.productCategoryName
          : productCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductCategory implements _ProductCategory {
  _$_ProductCategory(
      {this.id,
      @JsonKey(name: 'product_category_name') this.productCategoryName});

  factory _$_ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$$_ProductCategoryFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'product_category_name')
  final String? productCategoryName;

  @override
  String toString() {
    return 'ProductCategory(id: $id, productCategoryName: $productCategoryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductCategory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.productCategoryName, productCategoryName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(productCategoryName));

  @JsonKey(ignore: true)
  @override
  _$$_ProductCategoryCopyWith<_$_ProductCategory> get copyWith =>
      __$$_ProductCategoryCopyWithImpl<_$_ProductCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductCategoryToJson(
      this,
    );
  }
}

abstract class _ProductCategory implements ProductCategory {
  factory _ProductCategory(
      {final int? id,
      @JsonKey(name: 'product_category_name')
          final String? productCategoryName}) = _$_ProductCategory;

  factory _ProductCategory.fromJson(Map<String, dynamic> json) =
      _$_ProductCategory.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'product_category_name')
  String? get productCategoryName;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCategoryCopyWith<_$_ProductCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
