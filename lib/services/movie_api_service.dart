import 'dart:convert';

import 'package:movie_app_flutter/models/popular_movie_result.dart';

import 'movie_api_client.dart';
import '../utils/constants.dart';

class MovieApiService {
  final MovieApiClient _client;

  MovieApiService(this._client);

  Future getPopularMovies() async {
    final response = await _client.get(
      Constants.kPopularEndPoint,
      params: [
        UrlParameter(name: 'page', value: '1'),
      ],
    );
    
    if (response.statusCode == 200) {
      return PopularMovieListResult.fromJson(
        json.decode(response.body),
      );
    }
  }

  Future getMovieDetail(int movieId) async {}
}


