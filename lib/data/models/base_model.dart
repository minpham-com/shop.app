abstract class BaseModel {
  BaseModel();
  // ignore: avoid_unused_constructor_parameters
  factory BaseModel.fromMap(Map<dynamic, dynamic> json) {
    // TODO: implement BaseModel.fromMap
    throw UnimplementedError();
  }

  // ignore: avoid_unused_constructor_parameters
  factory BaseModel.fromJson(Map<dynamic, dynamic> json) {
    // TODO: implement BaseModel.fromMap
    throw UnimplementedError();
  }

  Map<dynamic, dynamic> toMap();
}
