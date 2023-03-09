import 'package:hive_flutter/hive_flutter.dart';
import 'package:store/data/models/base_model.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product extends BaseModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  int? userId;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? body;

  Product({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"] as String,
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
