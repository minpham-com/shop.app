import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';
import 'package:store/data/entities/location.dart';

part 'channel.g.dart';

@JsonSerializable()
class Channel extends BaseEntity {
  Channel(
      {required this.id,
      required this.name,
      required this.isDisabled,
      required this.locations,
      required super.createdAt,
      required super.updatedAt,
      super.deletedAt,
      this.description});

  String id;
  String name;

  String? description;

  @JsonKey(name: 'is_disabled')
  bool isDisabled;

  List<Location> locations;

  @override
  String getName() {
    return 'channels';
  }

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}
