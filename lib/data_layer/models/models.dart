class Models {
  late int id;
  late String backdropPath;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late String popularity;
  late String posterPath;
  late String releaseDate;
  late String title;
  late String voteAverage;
  late String voteCount;

  Models.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    backdropPath=json['backdrop_path'];
    originalLanguage=json['original_language'];
    originalTitle=json['original_title'];
    overview=json['overview'];
    popularity=json['popularity'].toString();
    posterPath=json['poster_path'];
    releaseDate=json['release_date'];
    title=json['title'];
    voteAverage=json['vote_average'].toString();
    voteCount=json['vote_count'].toString();
  }
}
