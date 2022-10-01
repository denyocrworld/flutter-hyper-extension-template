import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller.freezed.dart';
part 'seller.g.dart';

@freezed
class Seller with _$Seller {
  factory Seller({
    String? uid,
    @JsonKey(name: 'seller_name') String? sellerName,
  }) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
}
