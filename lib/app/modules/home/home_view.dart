import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_movies/app/modules/home/cubit/movie_data_cubit.dart';
import 'package:trending_movies/app/modules/home/widgets/search_box.dart';
import 'package:trending_movies/widgets/movie_list_widget.dart';

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
                const SearchBox(),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Trending Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
                BlocBuilder<MovieDataCubit, MovieDataState>(
                  builder: (context, state) {
                    if (state is MovieDataLoading) {
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: CircularProgressIndicator(),
                      ));
                    } else if (state is MovieDataSuccess) {
                      return MovieListWidget(state.movieList);
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
}
