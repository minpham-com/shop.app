import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag extends BaseEntity {
  Tag(
      {required this.id,
      required this.value,
      required super.createdAt,
      required super.updatedAt,
      super.deletedAt,
      this.metaData});

  String id;
  String value;

  @JsonKey(name: 'metadata')
  Object? metaData;

  @override
  String getName() {
    return 'tags';
  }

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}
