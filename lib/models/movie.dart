class Movie {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String mediaType;
  String releaseDate;
  double voteAverage;

  //named constructor
  // we need to find a way where we can pass each of the json keys so each of the json values into these various fields that we have created
  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJason(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      backDropPath: json["backdrop_path"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      mediaType: json["media_type"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"],
    );
  }
}
// posting to json
  //  Map<String, dynamic> toJson() => {
  //   "title": title,};


