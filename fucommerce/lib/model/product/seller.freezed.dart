// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'seller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Seller _$SellerFromJson(Map<String, dynamic> json) {
  return _Seller.fromJson(json);
}

/// @nodoc
mixin _$Seller {
  String? get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'seller_name')
  String? get sellerName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellerCopyWith<Seller> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerCopyWith<$Res> {
  factory $SellerCopyWith(Seller value, $Res Function(Seller) then) =
      _$SellerCopyWithImpl<$Res>;
  $Res call({String? uid, @JsonKey(name: 'seller_name') String? sellerName});
}

/// @nodoc
class _$SellerCopyWithImpl<$Res> implements $SellerCopyWith<$Res> {
  _$SellerCopyWithImpl(this._value, this._then);

  final Seller _value;
  // ignore: unused_field
  final $Res Function(Seller) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? sellerName = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerName: sellerName == freezed
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SellerCopyWith<$Res> implements $SellerCopyWith<$Res> {
  factory _$$_SellerCopyWith(_$_Seller value, $Res Function(_$_Seller) then) =
      __$$_SellerCopyWithImpl<$Res>;
  @override
  $Res call({String? uid, @JsonKey(name: 'seller_name') String? sellerName});
}

/// @nodoc
class __$$_SellerCopyWithImpl<$Res> extends _$SellerCopyWithImpl<$Res>
    implements _$$_SellerCopyWith<$Res> {
  __$$_SellerCopyWithImpl(_$_Seller _value, $Res Function(_$_Seller) _then)
      : super(_value, (v) => _then(v as _$_Seller));

  @override
  _$_Seller get _value => super._value as _$_Seller;

  @override
  $Res call({
    Object? uid = freezed,
    Object? sellerName = freezed,
  }) {
    return _then(_$_Seller(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerName: sellerName == freezed
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Seller implements _Seller {
  _$_Seller({this.uid, @JsonKey(name: 'seller_name') this.sellerName});

  factory _$_Seller.fromJson(Map<String, dynamic> json) =>
      _$$_SellerFromJson(json);

  @override
  final String? uid;
  @override
  @JsonKey(name: 'seller_name')
  final String? sellerName;

  @override
  String toString() {
    return 'Seller(uid: $uid, sellerName: $sellerName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Seller &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.sellerName, sellerName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(sellerName));

  @JsonKey(ignore: true)
  @override
  _$$_SellerCopyWith<_$_Seller> get copyWith =>
      __$$_SellerCopyWithImpl<_$_Seller>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SellerToJson(
      this,
    );
  }
}

abstract class _Seller implements Seller {
  factory _Seller(
      {final String? uid,
      @JsonKey(name: 'seller_name') final String? sellerName}) = _$_Seller;

  factory _Seller.fromJson(Map<String, dynamic> json) = _$_Seller.fromJson;

  @override
  String? get uid;
  @override
  @JsonKey(name: 'seller_name')
  String? get sellerName;
  @override
  @JsonKey(ignore: true)
  _$$_SellerCopyWith<_$_Seller> get copyWith =>
      throw _privateConstructorUsedError;
}
