import 'package:flutter/material.dart';
import 'package:trending_movies/app/data/models/response/movie_response.dart';
import 'package:trending_movies/app/modules/movie_details/movie_details_view.dart';
import 'package:trending_movies/utils/image/custom_network_image.dart';

class TrendingCard extends StatelessWidget {
  final List<Movie> movieList;
  final int index;

  const TrendingCard({Key? key, required this.movieList, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailsView(movie: movieList[index]),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CustomNetworkImage(
          image: movieList[index].posterPath != null
              ? movieList[index].posterPath!
              : '',
        ),
      ),
    );
  }
}
