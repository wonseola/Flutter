class ComingSoonMovie {
  late dynamic adult;
  late String backdropPath;
  late List<int> genreIds;
  late dynamic id;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late String posterPath;
  late String releaseDate;
  late String title;
  late bool video;
  late double voteAverage;
  late int voteCount;

  ComingSoonMovie.fromJson(Map<dynamic, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = List<int>.from(json['genre_ids']);
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
