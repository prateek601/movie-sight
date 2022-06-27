part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Movie> movieList;
  SearchSuccess({required this.movieList});
}
