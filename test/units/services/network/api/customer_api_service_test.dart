import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store/services/network/api/customer_api_service.dart';

@GenerateMocks([CustomerApiService]) //new
import './customer_api_service_test.mocks.dart';
import '../../../../mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpMock();
  final MockCustomerApiService service = MockCustomerApiService();

  setUpAll(() async {});

  group('MockCustomerApiService test method', () {
    test("MockCustomerApiService test GET", () async {
      final Faker faker = Faker();
      final String email = faker.internet.email();
      final String firstName = faker.person.firstName();
      final String lastName = faker.person.lastName();
      final String password = faker.randomGenerator.string(30);
      final String phone = faker.phoneNumber.us();

      when(service.create(
              email: email,
              password: password,
              firstName: firstName,
              lastName: lastName,
              phone: phone))
          .thenAnswer(
        (_) async => Response<dynamic>(data: [
          {
            'id': 1,
            'email': email,
            'first_name': firstName,
            'last_name': lastName,
            'phone': phone
          }
        ], statusCode: 200, requestOptions: RequestOptions(method: "post")),
      );

      final Response<dynamic> response = await service.create(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          phone: phone);
      expect(response.statusCode, 200);
    });
  });
}
