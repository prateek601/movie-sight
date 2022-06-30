import 'package:flutter/material.dart';
import 'package:trending_movies/app/data/models/response/movie_response.dart';
import 'package:trending_movies/app/modules/movie_details/widgets/movie_details.dart';

class MovieDetailsView extends StatelessWidget {
  final Movie movie;

  const MovieDetailsView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [MovieDetails(movie: movie)],
        ),
      ),
    );
  }
}
