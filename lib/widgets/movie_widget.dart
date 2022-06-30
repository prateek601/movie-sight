import 'package:flutter/material.dart';
import 'package:trending_movies/app/data/models/response/movie_response.dart';
import 'package:trending_movies/app/modules/movie_details/movie_details_view.dart';
import 'package:trending_movies/utils/image/custom_network_image.dart';

class MovieWidget extends StatelessWidget {
  final List<Movie> movieList;
  final int index;

  const MovieWidget({
    Key? key,
    required this.movieList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailsView(movie: movieList[index]),
          ),
        );
      },
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CustomNetworkImage(
                    image: movieList[index].posterPath != null
                        ? movieList[index].posterPath!
                        : '',
                    height: 200,
                    width: double.infinity,
                  )),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieList[index].title ?? movieList[index].name!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${movieList[index].voteAverage!.round()} / 10',
                        style:
                            const TextStyle(color: Colors.yellow, fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    movieList[index].releaseDate ??
                        movieList[index].firstAirDate!,
                    style: const TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
