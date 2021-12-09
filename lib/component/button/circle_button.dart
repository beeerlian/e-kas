import 'package:ekas/constants/dimens.constant.dart';
import 'package:ekas/utils/colors.config.dart';
import 'package:ekas/utils/iconly_icons.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final IconData? icon;
  final Function()? onTap;

  const CircleButton(
      {Key? key, this.backgroundColor, this.borderColor, this.icon, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: onTap ?? () {},
      child: Container(
          padding: EdgeInsets.all(Dimens.size8),
          decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              border: Border.all(
                  color: borderColor ?? Palette.dark1, width: Dimens.size1),
              shape: BoxShape.circle),
          child: Icon(icon ?? Iconly.arrow_rigth)),
    );
  }
}
