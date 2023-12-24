import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/models/movie_comingsoon.dart';
import 'package:movie/models/movie_detail.dart';
import 'package:movie/models/movie_nowplaying.dart';
import 'package:movie/models/movie_popular.dart';

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  static const String popular = 'popular';
  static const String nowplaying = 'now-playing';
  static const String comingsoon = 'coming-soon';
  static const String detail =
      'https://movies-api.nomadcoders.workers.dev/movie?id=';

  Future<List<GetDetailModel>> getDetail(id) async {
    List<GetDetailModel> popularInstances = [];
    final url = Uri.parse('$detail/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> detailpage = jsonDecode(response.body)['results'];
      for (var movies in detailpage) {
        popularInstances.add(GetDetailModel.fromJson(movies));
      }
      // print(popularInstances);

      return popularInstances;
    }
    throw Error();
  }

  Future<List<PopularMovieModel>> getPopularMovie() async {
    List<PopularMovieModel> popularInstances = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> popularMovies = jsonDecode(response.body)['results'];
      for (var movies in popularMovies) {
        popularInstances.add(PopularMovieModel.fromJson(movies));
      }
      // print(popularInstances);

      return popularInstances;
    }
    throw Error();
  }

  Future<List<NowPlayinMovie>> getNowPlaying() async {
    List<NowPlayinMovie> nowPlayingInstances = [];
    final url = Uri.parse('$baseUrl/$nowplaying');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> playingMovie = jsonDecode(response.body)['results'];
      for (var movies in playingMovie) {
        nowPlayingInstances.add(NowPlayinMovie.fromJson(movies));
      }

      return nowPlayingInstances;
    }
    throw Error();
  }

  Future<List<ComingSoonMovie>> comingSoon() async {
    List<ComingSoonMovie> comingSoonInstances = [];
    final url = Uri.parse('$baseUrl/$comingsoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> comingsoon = jsonDecode(response.body)['results'];
      for (var movies in comingsoon) {
        comingSoonInstances.add(ComingSoonMovie.fromJson(movies));
      }

      return comingSoonInstances;
    }
    throw Error();
  }

  static Future<GetDetailModel> getMovieById(String id) async {
    final url = Uri.parse("$detail$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return GetDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
