import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store/services/http_service.dart';

import '../mock.dart';

class MockHttpService extends Mock implements HttpService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpMock();
  final MockHttpService service = MockHttpService();

  setUpAll(() async {});

  group('HttpService test method', () {
    test("HttpService test GET", () async {
      when(service.get<dynamic>("/posts")).thenAnswer((_) async =>
          Future.delayed(
            Duration.zero,
            () => Response<dynamic>(data: [
              {"id": 1}
            ], statusCode: 200, requestOptions: RequestOptions(path: "/posts")),
          ));
      final Response response = await service.get<dynamic>('/posts');
      expect(response.statusCode, 200);
    });
    /*
    test("HttpService test GET NOT FOUND URI", () async {
      final Response response = await service.get('/author');
      expect(response.statusCode, 404);
    });

    test("HttpService test POST", () async {
      final Response response =
          await service.post('/posts', data: {'title': "Eample"});
      expect(response.statusCode, 200);
    });

    test("HttpService test PUT", () async {
      final Response response =
          await service.put('/posts/1', data: {'title': "Eample"});
      expect(response.statusCode, 200);
    });

    test("HttpService test PATCH", () async {
      final Response response =
          await service.patch('/posts/1', data: {'title': "Eample"});
      expect(response.statusCode, 200);
    });

    test("HttpService test DELETE", () async {
      final Response response = await service.delete('/posts/1');
      expect(response.statusCode, 200);
    });
    */
  });
}
