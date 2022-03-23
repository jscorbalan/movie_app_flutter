import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/services/movie_api_client.dart';
import 'package:movie_app_flutter/models/popular_movie_result.dart';
import 'package:movie_app_flutter/services/movie_api_service.dart';

import 'movi_api_service_test.mocks.dart';

String getJsonTest(String name) => File('test/json/$name').readAsStringSync();

@GenerateMocks([http.Client, MovieApiClient])
void main() {
  late MovieApiService movieService;
  late MockMovieApiClient client;

  setUpAll(() {
    client = MockMovieApiClient();
    movieService = MovieApiService(client);
  });

  group('Movie api service', () {
    test('Should parse and return the result data when status code is 200', () async {
      final expectedResult =
          PopularMovieListResult.fromJson(json.decode(getJsonTest('popular_movies.json')));
      // arrange
      when(client.get(any, params: anyNamed('params'))).thenAnswer(
        (_) async => http.Response(
          getJsonTest('popular_movies.json'),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        ),
      );

      // act
      final serviceResult = await movieService.getPopularMovies();
      // assert
      verify(client.get(any, params: anyNamed('params')));
      expect(serviceResult, equals(expectedResult));
    });
  });
}
