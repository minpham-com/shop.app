import 'package:store/data/models/base_model.dart';

class User extends BaseModel {
  int? id;

  String? email;

  String? firstName;

  String? lastName;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] as int,
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
