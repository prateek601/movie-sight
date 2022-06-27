import 'package:flutter/material.dart';
import 'package:trending_movies/app/data/models/response/movie_response.dart';
import 'package:trending_movies/app/data/values/env.dart';

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
    return Container(
      height: 250,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[900], borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                movieList[index].posterPath != null
                    ? Env.imageBaseUrl + movieList[index].posterPath!
                    : '',
                height: 230,
                fit: BoxFit.cover,
                errorBuilder: (context, object, stackTrace) {
                  return Center(
                    child: Container(
                      height: 230,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey[800]!,width: 2)
                      ),
                      child: const Icon(
                        Icons.photo,
                        color: Colors.white,
                        size: 38,
                      ),
                    ),
                  );
                },
              ),
            ),
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
                    fontSize: 18,
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
                const SizedBox(
                  height: 40,
                ),
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
