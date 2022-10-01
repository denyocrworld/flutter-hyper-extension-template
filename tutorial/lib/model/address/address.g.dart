// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      id: json['id'] as int?,
      addressName: json['address_name'] as String?,
      addressDetail: json['address_detail'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address_name': instance.addressName,
      'address_detail': instance.addressDetail,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
