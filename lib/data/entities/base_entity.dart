import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_object.dart';

mixin BaseEntityMixin {
  static Map<String, DateTime> fromJson(Map<dynamic, dynamic> json) =>
      <String, DateTime>{
        "createdAt": json["created_at"] as DateTime,
        "updatedAt": json["updated_at"] as DateTime,
        "deletedAt": json["deleted_at"] as DateTime,
      };
}

abstract class BaseEntity extends BaseObject with BaseEntityMixin {
  BaseEntity(
      {required this.createdAt, required this.updatedAt, this.deletedAt});

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  @JsonKey(name: 'deleted_at')
  DateTime? deletedAt;
}
