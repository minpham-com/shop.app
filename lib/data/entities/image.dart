import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';

part 'image.g.dart';

@JsonSerializable()
class Image extends BaseEntity {
  Image(
      {required this.url,
      required this.id,
      required super.createdAt,
      required super.updatedAt,
      this.metaData,
      super.deletedAt});

  String url;

  String id;

  @JsonKey(name: 'metadata')
  Object? metaData;

  @override
  String getName() {
    return 'images';
  }

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
