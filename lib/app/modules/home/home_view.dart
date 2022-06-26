import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_movies/app/data/models/response/movie_response.dart';
import 'package:trending_movies/app/data/values/env.dart';
import 'package:trending_movies/app/modules/home/cubit/movie_data_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  color: const Color(0xff2f3648),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Trending movies',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ),
                BlocBuilder<MovieDataCubit, MovieDataState>(
                  builder: (context, state) {
                    if (state is MovieDataLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is MovieDataSuccess) {
                      return movieListWidget(state.movieList);
                    } else {
                      return const Padding(
                        padding: EdgeInsets.only(top: 200),
                        child: Text(
                          'Error in loading data!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget movieListWidget(List<Movie> movieList) {
    if (movieList.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 200),
        child: Text(
          'No trending movie found!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      );
    } else {
      return ListView.separated(
        padding: EdgeInsets.only(top: 30),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return movieWidget(movieList: movieList, index: index);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
      );
    }
  }

  Widget movieWidget({required List<Movie> movieList, required int index}) {
    return Container(
      height: 200,
      decoration: BoxDecoration(color: Colors.grey[900]),
      child: Column(
        children: [
          Image.network(
            Env.imageBaseUrl + movieList[index].posterPath!,
            height: 160,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movieList[index].title ?? movieList[index].name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
