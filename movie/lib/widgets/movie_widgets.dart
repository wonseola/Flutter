import 'package:flutter/material.dart';
import 'package:movie/models/movie_comingsoon.dart';
import 'package:movie/models/movie_nowplaying.dart';
import 'package:movie/models/movie_popular.dart';
import 'package:movie/screens/detail_screen.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({
    super.key,
    required this.comingSoonMovie,
  });

  final Future<List<ComingSoonMovie>> comingSoonMovie;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: comingSoonMovie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'COMING SOON',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 350,
                child: (AsyncSnapshot<List<ComingSoonMovie>> snapshot) {
                  const String imgUrl = "https://image.tmdb.org/t/p/w500/";

                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var nowmovie = snapshot.data![index];
                      // return Text(nowmovie.title);

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                id: nowmovie.id,
                              ),
                              fullscreenDialog: true,
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 5,
                                    offset: Offset(6, 0),
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                              width: 200,
                              child: Image.network(
                                '$imgUrl/${nowmovie.posterPath}',
                                height: 200,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                nowmovie.originalTitle,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 40,
                    ),
                  );
                }(snapshot),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class NowInCinema extends StatelessWidget {
  const NowInCinema({
    super.key,
    required this.nowPlayingMovie,
  });

  final Future<List<NowPlayinMovie>> nowPlayingMovie;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: nowPlayingMovie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'NOW IN CINEMA',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: (AsyncSnapshot<List<NowPlayinMovie>> snapshot) {
                  const String imgUrl = "https://image.tmdb.org/t/p/w500/";

                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var nowmovie = snapshot.data![index];
                      // return Text(nowmovie.title);

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                id: nowmovie.id,
                              ),
                              fullscreenDialog: true,
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 5,
                                    offset: Offset(6, 0),
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                              width: 200,
                              child: Image.network(
                                '$imgUrl/${nowmovie.posterPath}',
                                height: 200,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                nowmovie.originalTitle,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 40,
                    ),
                  );
                }(snapshot),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class PopularMovie extends StatelessWidget {
  const PopularMovie({
    super.key,
    required this.popularMovie,
  });

  final Future<List<PopularMovieModel>> popularMovie;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: popularMovie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'POPULAR MOVIES',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 220,
                child: (AsyncSnapshot<List<PopularMovieModel>> snapshot) {
                  const String imgUrl = "https://image.tmdb.org/t/p/w500/";

                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var movie = snapshot.data![index];
                      // return Text(movie.title);

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                id: movie.id,
                              ),
                              fullscreenDialog: true,
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Hero(
                              tag: movie.id,
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 5,
                                      offset: Offset(6, 0),
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                                width: 300,
                                child: Image.network(
                                  '$imgUrl/${movie.backdropPath}',
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 40,
                    ),
                  );
                }(snapshot),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
