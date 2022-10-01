import 'package:freezed_annotation/freezed_annotation.dart';

import 'customer.dart';
import 'item.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  factory Order({
    String? id,
    @JsonKey(name: 'created_at') dynamic createdAt,
    Customer? customer,
    @JsonKey(name: 'voucher_code') String? voucherCode,
    double? discount,
    double? total,
    List<Item>? items,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
