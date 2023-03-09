//import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:store/services/app_service.dart';
import 'package:store/services/http_service.dart';

import '../mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpMock();

  // ignore: unused_local_variable
  late HttpService service;

  setUpAll(() async {
    //await AppService.initialize();
    service = HttpService.getInstance();
  });
  /*
  group('HttpService test method', () {
    test("HttpService test GET", () async {
      final Response response = await service.get('/');
      expect(response.statusCode, 400);
    });

    test("HttpService test GET NOT FOUND URI", () async {
      final Response response = await service.get('/google-not-found-uri');
      expect(response.statusCode, 400);
    });

    test("HttpService test POST", () async {
      final Response response =
          await service.post('/', data: {'example': "Eample"});
      expect(response.statusCode, 400);
    });
  });
  */
}
