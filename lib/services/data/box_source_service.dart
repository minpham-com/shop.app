import 'package:store/data/entities/base_object.dart';
import 'package:store/services/box_service.dart';
import 'package:store/services/data/base_source_service.dart';

class BoxSourceService<T extends BaseObject> implements BaseSourceService<T> {
  late String __endpoint;
  final BoxService _service = BoxService.getInstance();

  @override
  void setEnpoint(String endpoint) {
    __endpoint = endpoint;
  }

  @override
  Future<void> delete(String key) async {
    (await _service.getStore<T>(__endpoint)).delete(key);
  }

  @override
  Future<void> deleteAll(Iterable<String> keys) async {
    (await _service.getStore<T>(__endpoint)).deleteAll(keys);
  }

  @override
  Future<List<T>?> findBy(String key) async {
    final List<T> list = [];
    final T? obj = (await _service.getStore<T>(__endpoint)).get(key);
    if (obj != null) {
      list.add(obj);
    }
    return list;
  }

  @override
  Future<List<T>?> getItems() async {
    return (await _service.getStore<T>(__endpoint)).values as List<T>;
  }

  @override
  Future<void> updateOrCreate(String? key, T item) async {
    (await _service.getStore<T>(__endpoint)).put(key, item);
  }

  @override
  Future<void> updateOrCreateAll(Map<String, T> list) async {
    final box = await _service.getStore<T>(__endpoint);
    list.forEach((key, item) {
      box.put(key, item);
    });
  }

  String get endpoint => __endpoint;
}
