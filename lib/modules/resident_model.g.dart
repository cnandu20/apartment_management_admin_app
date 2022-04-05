// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resident _$ResidentFromJson(Map<String, dynamic> json,String id) => Resident(
      aid: id,
      name: json['name'] as String?,
      mobile: json['mobile'] as String?,
      rid: json['rid'] as String?,
      password: json['password'] as String?,
      bid: json['bid'] as String?,
    );

Map<String, dynamic> _$ResidentToJson(Resident instance) => <String, dynamic>{
      'aid': instance.aid,
      'bid': instance.bid,
      'name': instance.name,
      'mobile': instance.mobile,
      'password': instance.password,
      'rid': instance.rid,
    };
