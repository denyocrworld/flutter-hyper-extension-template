// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  dynamic get createdAt => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'voucher_code')
  String? get voucherCode => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  List<Item>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') dynamic createdAt,
      Customer? customer,
      @JsonKey(name: 'voucher_code') String? voucherCode,
      double? discount,
      double? total,
      List<Item>? items});

  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res> implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  final Order _value;
  // ignore: unused_field
  final $Res Function(Order) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? customer = freezed,
    Object? voucherCode = freezed,
    Object? discount = freezed,
    Object? total = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      customer: customer == freezed
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      voucherCode: voucherCode == freezed
          ? _value.voucherCode
          : voucherCode // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ));
  }

  @override
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') dynamic createdAt,
      Customer? customer,
      @JsonKey(name: 'voucher_code') String? voucherCode,
      double? discount,
      double? total,
      List<Item>? items});

  @override
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, (v) => _then(v as _$_Order));

  @override
  _$_Order get _value => super._value as _$_Order;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? customer = freezed,
    Object? voucherCode = freezed,
    Object? discount = freezed,
    Object? total = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_Order(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      customer: customer == freezed
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      voucherCode: voucherCode == freezed
          ? _value.voucherCode
          : voucherCode // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order implements _Order {
  _$_Order(
      {this.id,
      @JsonKey(name: 'created_at') this.createdAt,
      this.customer,
      @JsonKey(name: 'voucher_code') this.voucherCode,
      this.discount,
      this.total,
      final List<Item>? items})
      : _items = items;

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'created_at')
  final dynamic createdAt;
  @override
  final Customer? customer;
  @override
  @JsonKey(name: 'voucher_code')
  final String? voucherCode;
  @override
  final double? discount;
  @override
  final double? total;
  final List<Item>? _items;
  @override
  List<Item>? get items {
    final value = _items;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Order(id: $id, createdAt: $createdAt, customer: $customer, voucherCode: $voucherCode, discount: $discount, total: $total, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.customer, customer) &&
            const DeepCollectionEquality()
                .equals(other.voucherCode, voucherCode) &&
            const DeepCollectionEquality().equals(other.discount, discount) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(customer),
      const DeepCollectionEquality().hash(voucherCode),
      const DeepCollectionEquality().hash(discount),
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  factory _Order(
      {final String? id,
      @JsonKey(name: 'created_at') final dynamic createdAt,
      final Customer? customer,
      @JsonKey(name: 'voucher_code') final String? voucherCode,
      final double? discount,
      final double? total,
      final List<Item>? items}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'created_at')
  dynamic get createdAt;
  @override
  Customer? get customer;
  @override
  @JsonKey(name: 'voucher_code')
  String? get voucherCode;
  @override
  double? get discount;
  @override
  double? get total;
  @override
  List<Item>? get items;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
