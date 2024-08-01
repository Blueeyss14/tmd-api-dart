import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tmdb_api_test/api/movie_api.dart';
import 'package:tmdb_api_test/home/home.dart';

class Movie {
  String title, poster, overview;

  Movie({
    required this.title,
    required this.poster,
    required this.overview,
  });

  static Future<List<Movie>> movieApi() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?${MovieApi.apiKey}&page=${HomePage.tambah}');

    var responseAPI = await http.get(url);
    var dataMovie = (json.decode(responseAPI.body))["results"] as List;

    return dataMovie
        .map((dataMovie) => Movie(
              title: dataMovie['title'],
              poster: dataMovie['poster_path'],
              overview: dataMovie['overview'],
            ))
        .toList();
  }
}
