import 'package:json_annotation/json_annotation.dart';

part 'resident_model.g.dart';

@JsonSerializable()
class Resident {
  String? aid;
  String? bid;
  String? name;
  String? mobile;
  String? password;
  String? rid;

  Resident({
    required this.aid,
    required this.name,
    required this.mobile,
    required this.rid,
    required this.password,
    required this.bid,
  });

  factory Resident.fromJson(Map<String, dynamic> json, String id) =>
      _$ResidentFromJson(json, id);

  Map<String, dynamic> toJson() => _$ResidentToJson(this);
}
