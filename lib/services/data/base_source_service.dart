abstract class BaseSourceService<T> {
  Future<List<T>?> getItems();

  Future<List<T>?> findBy(String key);

  Future<void> updateOrCreate(String? key, T item);

  Future<void> updateOrCreateAll(Map<String, T> list);

  Future<void> delete(String key);

  Future<void> deleteAll(Iterable<String> keys);

  void setEnpoint(String endpoint);
}
