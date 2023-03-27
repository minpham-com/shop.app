import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_object.dart';

part 'region.g.dart';

@JsonSerializable()
class Region extends BaseObject {
  Region({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  @override
  String getName() {
    return 'regions';
  }

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
