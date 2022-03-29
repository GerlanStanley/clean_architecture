import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clean_architecture/domain/usecases/usecases.dart';

import 'package:clean_architecture/data/usecases/usecases.dart';
import 'package:clean_architecture/data/http/http.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClientSpy httpClient;
  String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpsUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });

  test('Deve chamar HttpClient com os valores corretos', () async {
    AuthenticationParams params = AuthenticationParams(
      email: faker.internet.email(),
      password: faker.internet.password()
    );

    await sut.auth(params);

    verify(httpClient.request(
      url: url,
      method: 'post',
      body: {'email': params.email, 'password': params.password}
    ));
  });
}