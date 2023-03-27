import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store/services/http_service.dart';

import '../mock.dart';

//class MockHttpService extends Mock implements HttpService {}

@GenerateMocks([HttpService]) //new
import 'http_service_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpMock();
  final MockHttpService service = MockHttpService();

  setUpAll(() async {});

  group('HttpService test method', () {
    test("HttpService test GET", () async {
      when(service.get<dynamic>("/posts")).thenAnswer(
        (_) async => Response<dynamic>(data: [
          {"id": 1, "title": "Title", "description": "Description"}
        ], statusCode: 200, requestOptions: RequestOptions(path: "/posts")),
      );
      final Response response = await service.get<dynamic>('/posts');
      expect(response.statusCode, 200);
    });

    test("HttpService test GET NOT FOUND URI", () async {
      when(service.get<dynamic>("/authors")).thenAnswer(
        (_) async => Response<dynamic>(data: [
          {"id": 1, "title": "Title", "description": "Description"}
        ], statusCode: 404, requestOptions: RequestOptions(path: "/authors")),
      );
      final Response response = await service.get<dynamic>('/authors');
      expect(response.statusCode, 404);
    });

    test("HttpService test POST", () async {
      when(service.post<dynamic>("/posts", data: {'title': "Example"}))
          .thenAnswer(
        (_) async => Response<dynamic>(data: [
          {"id": 1, "title": "Example", "description": "Example"}
        ], statusCode: 200, requestOptions: RequestOptions(path: "/posts")),
      );
      final Response response =
          await service.post<dynamic>('/posts', data: {'title': "Example"});
      expect(response.statusCode, 200);
    });

    test("HttpService test PUT", () async {
      when(service.put<dynamic>("/posts/1", data: {'title': "Example"}))
          .thenAnswer(
        (_) async => Response<dynamic>(data: [
          {"id": 1, "title": "Example", "description": "Example"}
        ], statusCode: 200, requestOptions: RequestOptions(path: "/posts")),
      );
      final Response response =
          await service.put<dynamic>('/posts/1', data: {'title': "Example"});
      expect(response.statusCode, 200);
    });

    test("HttpService test PATCH", () async {
      when(service.patch<dynamic>("/posts/1", data: {'title': "Example"}))
          .thenAnswer(
        (_) async => Response<dynamic>(data: [
          {"id": 1, "title": "Example", "description": "Example"}
        ], statusCode: 200, requestOptions: RequestOptions(path: "/posts")),
      );
      final Response response =
          await service.patch<dynamic>('/posts/1', data: {'title': "Example"});
      expect(response.statusCode, 200);
    });

    test("HttpService test DELETE", () async {
      when(service.delete<dynamic>("/posts/1")).thenAnswer(
        (_) async => Response<dynamic>(data: [
          {"id": 1, "title": "Example", "description": "Example"}
        ], statusCode: 200, requestOptions: RequestOptions(path: "/posts")),
      );
      final Response response = await service.delete<dynamic>('/posts/1');
      expect(response.statusCode, 200);
    });
  });
}
