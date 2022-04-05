// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Block _$BlockFromJson(Map<String, dynamic> json, String bid) => Block(
      bid: bid,
      name: json['name'] as String?,
      totalApartment: json['totalApartment'] as int?,
      vacancy: json['vacancy'] as int?,
    );

Map<String, dynamic> _$BlockToJson(Block instance) => <String, dynamic>{
      'bid': instance.bid,
      'totalApartment': instance.totalApartment,
      'vacancy': instance.vacancy,
      'name': instance.name,
    };
