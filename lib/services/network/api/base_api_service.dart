import 'package:store/services/http_service.dart';

abstract class BaseApiService {
  final HttpService _client = HttpService.getInstance();

  HttpService get client => _client;
}
