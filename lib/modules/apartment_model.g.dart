// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Apartment _$ApartmentFromJson(Map<String, dynamic> json,String id) => Apartment(
      aid: id,
      name: json['name'] as String?,
      isvaccant: json['isvaccant'] as bool?,
      rid: json['rid'] as String?,
      bid: json['bid'] as String?,
    );

Map<String, dynamic> _$ApartmentToJson(Apartment instance) => <String, dynamic>{
      'aid': instance.aid,
      'bid': instance.bid,
      'name': instance.name,
      'rid': instance.rid,
      'isvaccant': instance.isvaccant,
    };
