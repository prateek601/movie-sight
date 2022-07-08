import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const ShimmerContainer({
    Key? key,
    required this.height,
    required this.width,
    this.color = const Color(0xFF212121),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[700]!,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.0),
        child: Container(
          height: height,
          width: width,
          color: color,
        ),
      ),
    );
  }
}
