// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as String?,
      productName: json['product_name'] as String?,
      photo: json['photo'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      seller: json['seller'] == null
          ? null
          : Seller.fromJson(json['seller'] as Map<String, dynamic>),
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      qty: json['qty'] as int?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'photo': instance.photo,
      'price': instance.price,
      'description': instance.description,
      'seller': instance.seller,
      'galleries': instance.galleries,
      'qty': instance.qty,
    };
