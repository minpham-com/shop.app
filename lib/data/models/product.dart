import 'package:store/data/models/base_model.dart';

class Product extends BaseModel {
  int? id;

  int? userId;

  String? title;

  String? body;

  Product({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"] as int,
        userId: json["userId"] as int,
        title: json["title"] as String,
        body: json["body"] as String,
      );

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "userId": userId,
        "title": title,
        "body": body,
      };
}
