import 'package:json_annotation/json_annotation.dart';
import 'package:store/data/entities/base_entity.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseEntity {
  String? id;

  String? email;

  @JsonKey(name: 'first_name')
  String? firstName;

  @JsonKey(name: 'last_name')
  String? lastName;

  User({required super.createdAt, required super.updatedAt});

  @override
  String getName() {
    return 'users';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
