import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '294aec7d779f82727d2040647ff1ad38';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-Es';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    if (kDebugMode) {
      print('MoviesProvider inicializado');
    }
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final playingResponse = NowPlayingResponse.fromJson(response.body);

    // final Map<String, dynamic> decodeData = json.decode(response.body);

    if (kDebugMode) {
      // print(playingResponse.results[0].title);
      onDisplayMovies = playingResponse.results;
      notifyListeners();
    }
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    // final Map<String, dynamic> decodeData = json.decode(response.body);

    if (kDebugMode) {
      popularMovies = [...popularMovies, ...popularResponse.results];
      print(popularMovies[0]);
      notifyListeners();
    }
  }
}
