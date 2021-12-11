import 'package:ekas/configs/colors.config.dart';
import 'package:flutter/material.dart';

class IconUi extends StatelessWidget {
  final Function()? press;
  final IconData iconData;
  final Color? iconColor;

  const IconUi(
      {Key? key, required this.press, required this.iconData, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: press,
        icon: Icon(
          iconData,
          color: iconColor ?? Palette.primary,
        ));
  }
}
