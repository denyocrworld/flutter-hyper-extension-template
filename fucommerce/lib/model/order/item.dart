import 'package:freezed_annotation/freezed_annotation.dart';

import 'seller.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  factory Item({
    @JsonKey(name: 'product_name') String? productName,
    double? price,
    String? photo,
    String? description,
    Seller? seller,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
