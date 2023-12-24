import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/models/movie_detail.dart';
import 'package:movie/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final dynamic id;

  const DetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<GetDetailModel> movie;
  static const imageurl = 'https://image.tmdb.org/t/p/w500';
  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieById(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Expanded(
          child: FutureBuilder(
            future: movie,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Hero(
                  tag: snapshot.data!.id,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            '$imageurl${snapshot.data!.posterPath}',
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(1), BlendMode.dstATop)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 300,
                          ),
                          Flexible(
                            child: Text(
                              snapshot.data!.title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(color: Colors.black, blurRadius: 6)
                                  ]
                                  // backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RatingBar.builder(
                            initialRating: snapshot.data!.voteAverage / 2,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 30.0,
                            unratedColor: const Color.fromARGB(124, 0, 0, 0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Text(
                            'StoryLine',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 5),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Text(
                              snapshot.data!.overview,
                              style: const TextStyle(
                                // backgroundColor: Color.fromARGB(77, 0, 0, 0),
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                shadows: [
                                  Shadow(color: Colors.black, blurRadius: 8),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.yellow),
                                        width: 250,
                                        height: 50,
                                        // color: Colors.amber,
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Buy ticket',
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return const Text('...');
            },
          ),
        ),
      ),
    );
  }
}

PreferredSize customAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
