import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';

part 'location.g.dart';

@JsonSerializable()
class Location extends BaseEntity {
  Location(
      {required this.id,
      required this.locationId,
      required this.salesChannelId,
      required super.createdAt,
      required super.updatedAt,
      super.deletedAt,
      this.salesChannel});

  String id;

  @JsonKey(name: 'location_id')
  String locationId;

  @JsonKey(name: 'sales_channel_id')
  String salesChannelId;

  @JsonKey(name: 'sales_channel')
  Object? salesChannel;

  @override
  String getName() {
    return 'locations';
  }

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
