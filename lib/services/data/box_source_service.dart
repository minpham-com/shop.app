import 'package:store/data/models/base_model.dart';
import 'package:store/services/data/base_source_service.dart';
import 'package:store/services/locator_service.dart';
import 'package:store/services/object_box_service.dart';

class BoxSourceService<T extends BaseModel> implements BaseSourceService<T> {
  late String __endpoint;
  final ObjectBoxService _service = getIt<ObjectBoxService>();

  @override
  void setEnpoint(String endpoint) {
    __endpoint = endpoint;
  }

  @override
  Future<void> delete(String key) {
    return Future.delayed(const Duration(seconds: 1), () {
      _service.store.box<T>().remove(key as int);
    });
  }

  @override
  Future<void> deleteAll(Iterable<String> keys) {
    return Future.delayed(const Duration(seconds: 1), () {
      for (final String key in keys) {
        _service.store.box<T>().remove(key as int);
      }
    });
  }

  @override
  Future<List<T>?> findBy(String key) {
    return Future.delayed(const Duration(seconds: 1), () {
      final List<T> list = [];
      final T? obj = _service.store.box<T>().get(key as int);
      if (obj != null) {
        list.add(obj);
      }
      return list;
    });
  }

  @override
  Future<List<T>?> getItems() {
    return Future.delayed(const Duration(seconds: 1), () {
      return _service.store.box<T>().getAll();
    });
  }

  @override
  Future<void> updateOrCreate(String? key, T item) {
    return Future.delayed(const Duration(seconds: 1), () {
      _service.store.box<T>().put(item);
    });
  }

  @override
  Future<void> updateOrCreateAll(Map<String, T> list) {
    return Future.delayed(const Duration(seconds: 1), () {
      list.forEach((key, item) {
        _service.store.box<T>().put(item);
      });
    });
  }

  String get endpoint => __endpoint;
}
