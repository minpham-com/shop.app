Map<String, dynamic> removeNullsFromMap(Map<String, dynamic> json) => json
  ..removeWhere((String key, dynamic value) => value == null)
  ..map<String, dynamic>((String key, dynamic value) =>
      MapEntry<String, dynamic>(key, removeNulls(value)));

List<dynamic> removeNullsFromList(List<dynamic> list) => list
  ..removeWhere((dynamic value) => value == null)
  ..map<dynamic>((dynamic e) => removeNulls(e)).toList();

dynamic removeNulls(dynamic e) => (e is List)
    ? removeNullsFromList(e)
    : (e is Map<String, dynamic> ? removeNullsFromMap(e) : e);

extension ListExtension on List<dynamic> {
  List<dynamic> removeNulls() => removeNullsFromList(this);
}

extension MapExtension on Map<String, dynamic> {
  Map<String, dynamic> removeNulls() => removeNullsFromMap(this);
}
