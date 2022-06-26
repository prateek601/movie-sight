part of 'movie_data_cubit.dart';

@immutable
abstract class MovieDataState {}

class MovieDataLoading extends MovieDataState {}

class MovieDataError extends MovieDataState {}

class MovieDataSuccess extends MovieDataState {
  final List<Movie> movieList;

  MovieDataSuccess({required this.movieList});
}
