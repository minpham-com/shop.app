mixin BaseObjectMixin {
  Map<dynamic, dynamic> toMap() => <String, dynamic>{};

  String getName();
}

abstract class BaseObject with BaseObjectMixin {}
