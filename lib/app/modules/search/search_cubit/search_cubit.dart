import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:trending_movies/app/data/models/dto/repo_response.dart';
import 'package:trending_movies/app/data/models/response/movie_response.dart';
import 'package:trending_movies/app/data/repository/movie_repository.dart';
import 'package:trending_movies/utils/debounce/debounce.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  List<Movie> movieList = [];
  late TextEditingController searchController;
  final debounce = Debounce(delay: const Duration(milliseconds: 500));

  SearchCubit() : super(SearchInitial()) {
    searchController = TextEditingController();
  }

  Future<void> fetchSearchData({required String searchQuery}) async {
    Map<String, dynamic> query = {};
    query['query'] = searchQuery;
    emitSearchLoading();
    RepoResponse<MovieResponse> res = await MovieRepository.searchMovies(query);

    if (res.error == null) {
      movieList = res.data!.results!;
      emitSearchSuccess(movieList);
    } else {
      emitSearchError();
      log('error: ${res.error!.message}');
    }
  }

  void emitSearchSuccess(List<Movie> _movieList) =>
      emit(SearchSuccess(movieList: _movieList));

  void emitSearchError() => emit(SearchError());

  void emitSearchLoading() => emit(SearchLoading());

  @override
  Future<void> close() {
    searchController.dispose();
    debounce.cancel();
    return super.close();
  }
}
