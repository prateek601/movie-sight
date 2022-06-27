import 'package:trending_movies/app/data/models/dto/repo_response.dart';
import 'package:trending_movies/app/data/models/response/movie_response.dart';
import 'package:trending_movies/app/data/network/network_requester.dart';
import 'package:trending_movies/app/data/values/urls.dart';
import 'package:trending_movies/utils/helper/exception_handler.dart';

class MovieRepository {
  MovieRepository._privateConstructor();

  static Future<RepoResponse<MovieResponse>> getTrendingMovies() async {
    var response =
    await NetworkRequester.authenticated.get(path: URLs.getTrendingMovies);

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: MovieResponse.fromJson(response));
  }

  static Future<RepoResponse<MovieResponse>> searchMovies(Map<String, dynamic> query) async {
    var response =
    await NetworkRequester.authenticated.get(path: URLs.searchMovies,query: query);

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: MovieResponse.fromJson(response));
  }
}