import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/constants/dimens.constant.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback? press;
  final IconData? iconData;

  CircleButton({Key? key, this.press, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: press,
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
        iconData,
        color: Palette.primary,
      ),
      padding: EdgeInsets.all(Dimens.size8),
      shape: CircleBorder(),
    );
  }
}
