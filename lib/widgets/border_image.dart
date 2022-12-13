import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BorderImage extends StatelessWidget {
  const BorderImage({
    Key? key,
    required this.url,
    required this.border,
    this.fit,
    this.width,
  }) : super(key: key);
  final String url;
  final double border;
  final BoxFit? fit;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(border),
      child: url.startsWith("http")
          ? CachedNetworkImage(
              imageUrl: url,
              fit: fit,
              width: width,
            )
          : Image.asset(
              url,
              fit: fit,
              width: width,
            ),
    );
  }
}
