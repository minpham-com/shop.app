import 'package:firebase_database/firebase_database.dart';
import 'package:store/data/models/base_model.dart';
import 'package:store/services/data/base_source_service.dart';
import 'package:store/services/firebase_service.dart';
import 'package:store/services/locator_service.dart';

class FirebaseSourceService<T extends BaseModel>
    implements BaseSourceService<T> {
  final FirebaseService _service = getIt<FirebaseService>();
  late String __endpoint;

  Future<DatabaseReference> _getRef() async {
    return _service.getRef();
  }

  @override
  void setEnpoint(String endpoint) {
    __endpoint = endpoint;
  }

  @override
  Future<List<T>?> getItems() async {
    final DatabaseReference ref = await _getRef();
    final DataSnapshot snapshot = await ref.child(__endpoint).get();
    final List<T> list = _convertToList(snapshot);
    return list;
  }

  @override
  Future<List<T>?> findBy(String key) async {
    final DatabaseReference ref = await _getRef();
    final DataSnapshot snapshot = await ref.child("$__endpoint/$key").get();
    final List<T> list = _convertToList(snapshot);
    return list;
  }

  @override
  Future<void> updateOrCreate(String? key, T item) async {
    final DatabaseReference ref = await _getRef();
    final String? keyItem = key ?? ref.child(__endpoint).push().key;
    final Map<String, Map> updates = {};
    updates['/$__endpoint/$keyItem'] = item.toMap() as Map<String, dynamic>;
    ref.update(updates);
  }

  @override
  Future<void> updateOrCreateAll(Map<String, T> list) async {
    final DatabaseReference ref = await _getRef();
    ref.update(list);
  }

  @override
  Future<void> delete(String key) async {
    final DatabaseReference ref = await _getRef();
    ref.child('/$__endpoint/$key').remove();
  }

  @override
  Future<void> deleteAll(Iterable<String> keys) async {
    final DatabaseReference ref = await _getRef();
    for (final String key in keys) {
      ref.child('/$__endpoint/$key').remove();
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
