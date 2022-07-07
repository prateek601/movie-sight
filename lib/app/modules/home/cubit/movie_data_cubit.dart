import 'dart:developer';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:trending_movies/app/data/models/dto/repo_response.dart';
import 'package:trending_movies/app/data/models/response/movie_response.dart';
import 'package:trending_movies/app/data/repository/movie_repository.dart';

part 'movie_data_state.dart';

class MovieDataCubit extends HydratedCubit<MovieDataState> {
  MovieDataCubit() : super(MovieDataLoading()) {
    fetchTrendingMovies();
  }

  Future<void> fetchTrendingMovies() async {
    RepoResponse<MovieResponse> res = await MovieRepository.getTrendingMovies();

    if (res.error == null) {
      emitMovieDataSuccess(res.data!);
    } else {
      log('error: ${res.error!.message}');
    }
  }

  void emitMovieDataSuccess(MovieResponse _movieResponse) =>
      emit(MovieDataSuccess(movieResponse: _movieResponse));

  void emitMovieDataError() => emit(MovieDataError());

  void emitMovieDataLoading() => emit(MovieDataLoading());

  @override
  MovieDataState? fromJson(Map<String, dynamic> json) {
    return MovieDataSuccess(movieResponse: MovieResponse.fromJson(json));
  }

  @override
  Map<String, dynamic>? toJson(MovieDataState state) {
    if (state is MovieDataSuccess) {
      return state.movieResponse.toJson();
    } else {
      return null;
    }
  }
}
