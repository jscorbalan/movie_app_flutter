import 'package:http/http.dart' as http show Client, Response;

import '../utils/constants.dart';

class MovieApiClient {
  final String baseUrl = Constants.kBaseUrl;
  final String apiKey = Constants.kApiKey;
  final http.Client _client;

  MovieApiClient(this._client);

  Future<http.Response> get(
    String endpoint, {
    List<UrlParameter> params = const [],
  }) async {
    String url = '$baseUrl$endpoint?api_key=$apiKey';
    if (params.isNotEmpty) {
      for (UrlParameter param in params) {
        url += param.urlParam;
      }
    }
    return await _client.get(Uri.parse(url));
  }
}

class UrlParameter {
  final String name;
  final String value;

  UrlParameter({
    required this.name,
    required this.value,
  });

  String get urlParam => '&$name=$value';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UrlParameter && other.name == name && other.value == value;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode;
}
