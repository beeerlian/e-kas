import 'package:flutter/material.dart';

class RoundedImageAsset extends StatelessWidget {
  RoundedImageAsset(
      {Key? key,
      required this.path,
      this.height = 40,
      this.width = 40,
      this.radius = 15})
      : super(key: key);
  String path;
  double height;
  double width;
  double radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        path,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
