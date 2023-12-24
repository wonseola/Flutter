class WebtoonEpisodeModel {
  final String id, title, rating, date;

  WebtoonEpisodeModel.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        date = json['date'],
        rating = json['rating'];
}
