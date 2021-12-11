import 'package:ekas/component/image/network_image_placeholder.dart';
import 'package:ekas/component/svg/svg_ui.dart';
import 'package:ekas/component/text/text_widget.dart';
import 'package:ekas/configs/iconly_icons.dart';
import 'package:ekas/constants/dimens.constant.dart';
import 'package:ekas/constants/divider.constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuIcon extends StatelessWidget {
  final String? imageAsset;
  final String? imageUrl;
  final String title;
  final IconData? iconData;
  final bool isNetworkImage;
  final bool isSvg;
  final bool isIcon;
  Function()? onTap;
  Widget? imageWidget;

  MenuIcon({
    Key? key,
    this.imageAsset,
    this.imageUrl,
    this.onTap,
    required this.title,
    this.isNetworkImage = true,
    this.isSvg = true,
    this.isIcon = false,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isNetworkImage) {
      if (isSvg) {
        imageWidget = SvgPicture.network(imageUrl!);
      } else {
        imageWidget = NetworkImagePlaceHolder(
          imageUrl: imageUrl,
        );
      }
    } else {
      if (isSvg) {
        imageWidget = SvgUI(imageAsset!);
      } else if (isIcon) {
        imageWidget = Icon(
          iconData,
          size: Dimens.size40,
        );
      } else {
        imageWidget = Image.asset(imageAsset!);
      }
    }

    return InkWell(
      customBorder: CircleBorder(),
      onTap: onTap ?? () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Dimens.size56,
            width: Dimens.size56,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
              Radius.circular(Dimens.size16),
            )),
            child: imageWidget ?? Icon(Iconly.image_bold),
          ),
          divide4,
          TextWidget(
            '$title',
            size: TextWidgetSize.SMALL,
          )
        ],
      ),
    );
  }
}
