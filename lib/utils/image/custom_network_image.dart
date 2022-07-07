import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trending_movies/app/data/values/env.dart';

class CustomNetworkImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CustomNetworkImage({Key? key,
    required this.image,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: Env.imageBaseUrl + image,
      height: height,
      width: width,
      fit: fit,
      errorWidget: (context, object, stackTrace) {
        return Center(
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[800]!, width: 2)
            ),
            child: const Icon(
              Icons.photo,
              color: Colors.white,
              size: 38,
            ),
          ),
        );
      },
    );
  }
}
