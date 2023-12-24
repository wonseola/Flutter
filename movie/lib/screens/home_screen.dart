import 'package:flutter/material.dart';
import 'package:movie/models/movie_comingsoon.dart';
import 'package:movie/models/movie_nowplaying.dart';
import 'package:movie/models/movie_popular.dart';
import 'package:movie/services/api_service.dart';
import 'package:movie/widgets/movie_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<PopularMovieModel>> popularMovie =
      ApiService().getPopularMovie();
  final Future<List<NowPlayinMovie>> nowPlayingMovie =
      ApiService().getNowPlaying();
  final Future<List<ComingSoonMovie>> comingSoonMovie =
      ApiService().comingSoon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 252, 252),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              PopularMovie(popularMovie: popularMovie),
              NowInCinema(nowPlayingMovie: nowPlayingMovie),
              ComingSoon(comingSoonMovie: comingSoonMovie),
            ],
          ),
        ),
      ),
    );
  }
}
