import 'package:flutter/material.dart';
import 'package:trending_movies/app/data/models/response/movie_response.dart';
import 'package:trending_movies/widgets/cards/trending_card.dart';

class MovieListWidget extends StatelessWidget {
  final List<Movie> movieList;
  const MovieListWidget(this.movieList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      return GridView.builder(
        padding: const EdgeInsets.only(top: 30,bottom: 30),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: movieList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          mainAxisExtent: 250,
        ),
        itemBuilder: (context, index) {
          return TrendingCard(
            movieList: movieList,
            index: index,
          );
        },
      );
    }
  }
}
