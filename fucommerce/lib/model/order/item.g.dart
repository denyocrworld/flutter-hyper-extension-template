// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      productName: json['product_name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      photo: json['photo'] as String?,
      description: json['description'] as String?,
      seller: json['seller'] == null
          ? null
          : Seller.fromJson(json['seller'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'product_name': instance.productName,
      'price': instance.price,
      'photo': instance.photo,
      'description': instance.description,
      'seller': instance.seller,
    };
