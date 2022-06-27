class MovieResponse {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  MovieResponse({this.page, this.results, this.totalPages, this.totalResults});

  MovieResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Movie>[];
      json['results'].forEach((v) {
        results!.add(new Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class Movie {
  bool? adult;
  String? backdropPath;
  List<dynamic>? genreIds;
  int? id;
  String? mediaType;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  bool? video;
  num? voteAverage;
  int? voteCount;
  String? name;
  List<dynamic>? originCountry;
  String? originalName;
  String? firstAirDate;

  Movie(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.mediaType,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.name,
      this.originCountry,
      this.originalName,
      this.firstAirDate});

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'];
    id = json['id'];
    mediaType = json['media_type'];
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    name = json['name'];
    originCountry = json['origin_country'];
    originalName = json['original_name'];
    firstAirDate = json['first_air_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['media_type'] = this.mediaType;
    data['title'] = this.title;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    data['original_name'] = this.originalName;
    data['first_air_date'] = this.firstAirDate;
    return data;
  }
}
