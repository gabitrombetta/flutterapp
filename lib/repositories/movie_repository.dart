import 'dart:convert';

import 'package:flutterapp/core/constants.dart';
import 'package:flutterapp/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  final urlApi = urlMovieApi;

  Future<List<MovieModel>> getMovies() async {
    List<MovieModel> moviesList = [];

    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> moviesJson = jsonData['results'];

      for (var movie in moviesJson) {
        moviesList.add(MovieModel.fromJson(movie));
      }
    }
    return moviesList;
  } 
}