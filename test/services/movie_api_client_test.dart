import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:movie_app_flutter/services/movie_api_client.dart';
import 'package:movie_app_flutter/utils/constants.dart';

import 'movi_api_service_test.mocks.dart';

void main() {
  late MovieApiClient client;
  late MockClient httpClient;

  setUp(() {
    httpClient = MockClient();
    client = MovieApiClient(httpClient);
  });

  group('Movie api client', () {
    test('should call the http client get method with the given endpoint', () async {
      final param = UrlParameter(name: 'name', value: 'value');
      when(httpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
          '',
          200,
        ),
      );

      await client.get(Constants.kPopularEndPoint, params: [param]);

      verify(httpClient.get(
          Uri.parse(
            '${Constants.kBaseUrl}${Constants.kPopularEndPoint}?api_key=${Constants.kApiKey}${param.urlParam}',
          ),
          headers: anyNamed('headers')));
    });
  });
}
