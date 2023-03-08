import 'package:firebase_database/firebase_database.dart';
import 'package:store/data/models/base_model.dart';
import 'package:store/data/repository/repository.dart';
import 'package:store/services/firebase_service.dart';
import 'package:store/services/locator_service.dart';

class AppRepository<T extends BaseModel> extends Repository {
  final FirebaseService _service = getIt<FirebaseService>();
  AppRepository(super._endpoint);

  Future<DatabaseReference> _getRef() async {
    return _service.getRef();
  }

  Future<List<T>> getItems() async {
    final DatabaseReference ref = await _getRef();
    final DataSnapshot snapshot = await ref.child(endpoint).get();
    final List<T> list = _convertToList(snapshot);
    return list;
  }

  Future<List<T>?> findBy(String key) async {
    final DatabaseReference ref = await _getRef();
    final DataSnapshot snapshot = await ref.child("$endpoint/$key").get();
    final List<T> list = _convertToList(snapshot);
    return list;
  }

  Future<void> updateOrCreate(String? key, T item) async {
    final DatabaseReference ref = await _getRef();
    final String? keyItem = key ?? ref.child(endpoint).push().key;
    final Map<String, Map> updates = {};
    updates['/$endpoint/$keyItem'] = item.toMap() as Map<String, dynamic>;
    ref.update(updates);
  }

  Future<void> updateOrCreateAll(Map<String, T> list) async {
    final DatabaseReference ref = await _getRef();
    ref.update(list);
  }

  Future<void> delete(String key) async {
    final DatabaseReference ref = await _getRef();
    ref.child('/$endpoint/$key').remove();
  }

  Future<void> deleteAll(Iterable<String> keys) async {
    final DatabaseReference ref = await _getRef();
    for (final String key in keys) {
      ref.child('/$endpoint/$key').remove();
    }
  }

  List<T> _convertToList(DataSnapshot snap) {
    final List<T> list = [];
    for (final DataSnapshot child in snap.children) {
      final dynamic val = child.value;
      if (val != null) {
        list.add(val as T);
      }
    }
    return list;
  }
}
