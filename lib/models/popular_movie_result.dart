// To parse this JSON data, do
//
//     final popularMovieResult = popularMovieResultFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

class PopularMovieListResult {
  PopularMovieListResult({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<PopularMovieResult> results;
  final int totalPages;
  final int totalResults;

  PopularMovieListResult copyWith({
    required int page,
    required List<PopularMovieResult> results,
    required int totalPages,
    required int totalResults,
  }) =>
      PopularMovieListResult(
        page: page,
        results: results,
        totalPages: totalPages,
        totalResults: totalResults,
      );

  factory PopularMovieListResult.fromRawJson(String str) =>
      PopularMovieListResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PopularMovieListResult.fromJson(Map<String, dynamic> json) => PopularMovieListResult(
        page: json["page"],
        results: List<PopularMovieResult>.from(
            json["results"].map((x) => PopularMovieResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PopularMovieListResult &&
        other.page == page &&
        listEquals(other.results, results) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return page.hashCode ^ results.hashCode ^ totalPages.hashCode ^ totalResults.hashCode;
  }
}

class PopularMovieResult {
  PopularMovieResult({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final OriginalLanguage? originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  PopularMovieResult copyWith({
    required bool adult,
    required String backdropPath,
    required List<int> genreIds,
    required int id,
    required OriginalLanguage? originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required DateTime releaseDate,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) =>
      PopularMovieResult(
        adult: adult,
        backdropPath: backdropPath,
        genreIds: genreIds,
        id: id,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

  factory PopularMovieResult.fromRawJson(String str) =>
      PopularMovieResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PopularMovieResult.fromJson(Map<String, dynamic> json) => PopularMovieResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PopularMovieResult &&
        other.adult == adult &&
        other.backdropPath == backdropPath &&
        listEquals(other.genreIds, genreIds) &&
        other.id == id &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        other.releaseDate == releaseDate &&
        other.title == title &&
        other.video == video &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        backdropPath.hashCode ^
        genreIds.hashCode ^
        id.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        posterPath.hashCode ^
        releaseDate.hashCode ^
        title.hashCode ^
        video.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode;
  }
}

enum OriginalLanguage { en, fr, ja }

final originalLanguageValues =
    EnumValues({"en": OriginalLanguage.en, "fr": OriginalLanguage.fr, "ja": OriginalLanguage.ja});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EnumValues<T> && mapEquals(other.map, map) && other.reverseMap == reverseMap;
  }

  @override
  int get hashCode => map.hashCode ^ reverseMap.hashCode;
}
