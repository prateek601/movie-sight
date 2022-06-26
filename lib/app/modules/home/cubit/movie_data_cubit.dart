import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trending_movies/app/data/models/response/movie_response.dart';

part 'movie_data_state.dart';

class MovieDataCubit extends Cubit<MovieDataState> {
  MovieDataCubit() : super(MovieDataLoading()) {
   fetchTrendingMovies();
  }

  void fetchTrendingMovies() {
    
  }
}
