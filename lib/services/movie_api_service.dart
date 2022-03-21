import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/models/popular_movie_result.dart';

import '../utils/constants.dart';

class MovieApiService {
  final http.Client _client;

  MovieApiService(this._client);

  getPopularMovies() async {
    final uri = Uri.parse('https://api.themoviedb.org/3/movie/popular?page=1&api_key=$kApiKey');
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      return PopularMovieListResult.fromJson(json.decode(response.body));
    }
  }

  getMovieDetail(int movieId) {}
}
