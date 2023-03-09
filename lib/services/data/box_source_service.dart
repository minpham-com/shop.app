import 'package:store/data/models/base_model.dart';
import 'package:store/services/box_service.dart';
import 'package:store/services/data/base_source_service.dart';
import 'package:store/services/locator_service.dart';

class BoxSourceService<T extends BaseModel> implements BaseSourceService<T> {
  late String __endpoint;
  final BoxService _service = getIt<BoxService>();

  @override
  void setEnpoint(String endpoint) {
    __endpoint = endpoint;
  }

  @override
  Future<void> delete(String key) {
    return Future.delayed(Duration.zero, () {
      _service.getStore<T>(T.toString()).delete(key);
    });
  }

  @override
  Future<void> deleteAll(Iterable<String> keys) {
    return Future.delayed(Duration.zero, () {
      _service.getStore<T>(T.toString()).deleteAll(keys);
    });
  }

  @override
  Future<List<T>?> findBy(String key) {
    return Future.delayed(Duration.zero, () {
      final List<T> list = [];
      final T? obj = _service.getStore<T>(T.toString()).get(key);
      if (obj != null) {
        list.add(obj);
      }
      return list;
    });
  }

  @override
  Future<List<T>?> getItems() {
    return Future.delayed(Duration.zero, () {
      return _service.getStore<T>(T.toString()).values as List<T>;
    });
  }

  @override
  Future<void> updateOrCreate(String? key, T item) {
    return Future.delayed(Duration.zero, () {
      _service.getStore<T>(T.toString()).put(key, item);
    });
  }

  @override
  Future<void> updateOrCreateAll(Map<String, T> list) {
    return Future.delayed(Duration.zero, () {
      list.forEach((key, item) {
        _service.getStore<T>(T.toString()).put(key, item);
      });
    });
  }

  String get endpoint => __endpoint;
}
