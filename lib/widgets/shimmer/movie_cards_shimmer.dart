import 'package:flutter/material.dart';
import 'package:trending_movies/widgets/shimmer/shimmer_container.dart';

class MovieCardsShimmer extends StatelessWidget {
  const MovieCardsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 30),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return const MovieCardShimmerWidget();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
    );
  }
}

class MovieCardShimmerWidget extends StatelessWidget {
  const MovieCardShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const ShimmerContainer(
                  height: 200,
                  width: 200,
                )),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShimmerContainer(
                  height: 20,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 40,
                ),
                ShimmerContainer(
                  height: 20,
                  width: 70,
                ),
                SizedBox(
                  height: 40,
                ),
                ShimmerContainer(
                  height: 20,
                  width: 100,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
