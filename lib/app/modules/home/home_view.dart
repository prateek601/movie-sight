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
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: const Color(0xff2f3648),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'search movies',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Trending Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
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
        padding: const EdgeInsets.only(top: 30),
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
      height: 250,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[900], borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              Env.imageBaseUrl + movieList[index].posterPath!,
              height: 230,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieList[index].title ?? movieList[index].name!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 40,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 22,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${movieList[index].voteAverage!.round()} / 10',
                      style:
                          const TextStyle(color: Colors.yellow, fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(height: 40,),
                Text(
                  movieList[index].releaseDate ??
                      movieList[index].firstAirDate!,
                  style: const TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
