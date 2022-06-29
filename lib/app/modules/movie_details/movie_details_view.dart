import 'package:flutter/material.dart';
import 'package:trending_movies/app/data/models/response/movie_response.dart';
import 'package:trending_movies/utils/image/custom_network_image.dart';

class MovieDetailsView extends StatelessWidget {
  final Movie movie;

  const MovieDetailsView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                CustomNetworkImage(
                  image: movie.posterPath != null ? movie.posterPath! : '',
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
                          color: Colors.white60,
                          fontSize: 12,
                          letterSpacing: 0.5),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Actors',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
