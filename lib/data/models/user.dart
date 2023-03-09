import 'package:hive_flutter/hive_flutter.dart';
import 'package:store/data/models/base_model.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends BaseModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? firstName;

  @HiveField(3)
  String? lastName;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] as String,
        email: json["email"] as String,
        firstName: json["firstName"] as String,
        lastName: json["lastName"] as String,
      );

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
      };
}
