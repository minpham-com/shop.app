import 'package:store/data/entities/base_object.dart';
import 'package:store/data/repository/repository.dart';
import 'package:store/services/data/base_source_service.dart';
import 'package:store/services/data/box_source_service.dart';

class AppRepository<T extends BaseObject> extends Repository {
  final BaseSourceService<T> _service = BoxSourceService<T>();
  AppRepository(String endpoint) : super(endpoint) {
    _service.setEnpoint(endpoint);
  }

  Future<List<T>?> getItems() async {
    return _service.getItems();
  }

  Future<List<T>?> findBy(String key) async {
    return _service.findBy(key);
  }

  Future<void> updateOrCreate(String? key, T item) async {
    return _service.updateOrCreate(key, item);
  }

  Future<void> updateOrCreateAll(Map<String, T> list) async {
    return _service.updateOrCreateAll(list);
  }

  Future<void> delete(String key) async {
    return _service.delete(key);
  }

  Future<void> deleteAll(Iterable<String> keys) async {
    return _service.deleteAll(keys);
  }

  BaseSourceService<T> get service => _service;
}
