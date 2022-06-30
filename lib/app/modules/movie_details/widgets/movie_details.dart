import 'package:flutter/material.dart';
import 'package:trending_movies/app/data/models/response/movie_response.dart';
import 'package:trending_movies/utils/image/custom_network_image.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Stack(
          children: [
            CustomNetworkImage(
              image: movie.posterPath ?? '',
              height: 350,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const Positioned(
              top: 5,
              left: 5,
              child: BackButton(color: Colors.white70),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  movie.title ?? movie.name!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  movie.overview ?? '',
                  style: const TextStyle(
                      color: Colors.white60, fontSize: 12, letterSpacing: 0.5),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
