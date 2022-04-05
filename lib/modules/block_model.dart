import 'package:json_annotation/json_annotation.dart';

part 'block_model.g.dart';

@JsonSerializable()
class Block {
  String? bid;
  int? totalApartment;
  int? vacancy;
  String? name;

  Block(
      {required this.bid,
      required this.name,
      required this.totalApartment,
      required this.vacancy});

  factory Block.fromJson(Map<String, dynamic> json, String bid) =>
      _$BlockFromJson(json, bid);

  Map<String, dynamic> toJson() => _$BlockToJson(this);
}
