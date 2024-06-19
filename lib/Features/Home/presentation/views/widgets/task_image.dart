import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TaskImage extends StatelessWidget {
  const TaskImage(
      {super.key, required this.imageUrl, this.aspectRatio, this.fit});

  final String imageUrl;
  final double? aspectRatio;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio ?? 1,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: buildShimmerPlaceholder(),
          );
        },
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget buildShimmerPlaceholder() {
    return AspectRatio(
      aspectRatio: aspectRatio ?? 1,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
