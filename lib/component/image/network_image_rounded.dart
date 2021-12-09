import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekas/utils/colors.config.dart';
import 'package:flutter/material.dart';

class RoundedImageNetwork extends StatelessWidget {
  RoundedImageNetwork(
      {Key? key, required this.path, this.height, this.width, this.radius = 15})
      : super(key: key);
  String path;
  double? height;
  double? width;
  double radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: path,
        height: height ?? 0,
        width: width ?? 0,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
            child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: Palette.primary))),
        errorWidget: (context, url, error) => Icon(
          Icons.image,
          size: height,
          color: Palette.secondary,
        ),
      ),
    );
  }
}
