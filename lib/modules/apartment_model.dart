import 'package:json_annotation/json_annotation.dart';

part 'apartment_model.g.dart';

@JsonSerializable()
class Apartment {
  String? aid;
  String? bid;
  String? name;
  String? rid;
  bool? isvaccant;

  Apartment({
    required this.aid,
    required this.name,
    required this.isvaccant,
    required this.rid,
    required this.bid,
  });

  factory Apartment.fromJson(Map<String, dynamic> json, String id) =>
      _$ApartmentFromJson(json, id);

  Map<String, dynamic> toJson() => _$ApartmentToJson(this);
}
