import 'package:flutter_dotenv/flutter_dotenv.dart';

const baseURLMockApi = 'https://68a4fd732a3deed2960c26bc.mockapi.io/';

var urlMovieApi= 'https://api.themoviedb.org/3/movie/popular?api_key=${dotenv.env['MOVIE_API_KEY']}&language=pt-BR&page=1';