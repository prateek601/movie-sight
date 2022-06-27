import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trending_movies/app/data/models/dto/repo_response.dart';
import 'package:trending_movies/app/data/models/response/movie_response.dart';
import 'package:trending_movies/app/data/repository/movie_repository.dart';

part 'movie_data_state.dart';

class MovieDataCubit extends Cubit<MovieDataState> {
  List<Movie> movieList = [];

  MovieDataCubit() : super(MovieDataLoading()) {
    fetchTrendingMovies();
  }

  Future<void> fetchTrendingMovies() async {
    RepoResponse<MovieResponse> res = await MovieRepository.getTrendingMovies();

    if (res.error == null) {
      movieList = res.data!.results!;
      emitMovieDataSuccess(movieList);
    } else {
      emitMovieDataError();
      log('error: ${res.error!.message}');
    }
  }

  void emitMovieDataSuccess(List<Movie> _movieList) =>
      emit(MovieDataSuccess(movieList: _movieList));

  void emitMovieDataError() => emit(MovieDataError());

  void emitMovieDataLoading() => emit(MovieDataLoading());
}
