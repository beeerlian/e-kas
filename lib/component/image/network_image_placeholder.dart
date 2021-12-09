import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekas/constants/dimens.constant.dart';
import 'package:ekas/utils/colors.config.dart';
import 'package:ekas/utils/iconly_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NetworkImagePlaceHolder extends StatelessWidget {
  final String? imageUrl;

  final double? width;

  final double? height;

  final BoxFit? fit;

  final bool? click;

  final BorderRadius? borderRadius;

  final bool isRounded;

  const NetworkImagePlaceHolder(
      {this.imageUrl,
      this.width,
      this.height,
      this.fit,
      this.click = false,
      this.borderRadius,
      this.isRounded = false});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius != null
          ? borderRadius
          : isRounded
              ? BorderRadius.all(Radius.circular(Dimens.size12))
              : BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: '$imageUrl',
        fit: fit ?? BoxFit.cover,
        width: width ?? null,
        height: height ?? null,
        placeholder: (context, url) => SpinKitCircle(
          color: Palette.primary,
          size: 20,
        ),
        errorWidget: (context, url, error) => Icon(
          Iconly.image_bold,
          size: height,
          color: Palette.border,
        ),
      ),
    );
  }
}
