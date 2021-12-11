import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/constants/dimens.constant.dart';
import 'package:ekas/constants/divider.constant.dart';
import 'package:ekas/presentation/component/text/text_widget.dart';
import 'package:flutter/material.dart';

class RoundedText extends StatelessWidget {
  final Color? borderColor;
  final Color? color;
  final Color? textColor;
  final String? text;
  final Icon? child;
  final TextWidgetSize? size;
  final Function()? onTap;

  const RoundedText(
      {Key? key,
      this.borderColor,
      this.color,
      this.text,
      this.size,
      this.child,
      this.onTap,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
          margin: EdgeInsets.only(bottom: Dimens.size16),
          padding: EdgeInsets.symmetric(
              vertical: Dimens.size4, horizontal: Dimens.size8),
          decoration: BoxDecoration(
              color: color ?? Palette.error,
              border: Border.all(color: borderColor ?? Palette.border),
              borderRadius: BorderRadius.all(
                Radius.circular(Dimens.size16),
              )),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                '$text',
                ellipsed: true,
                color: textColor ?? Colors.white,
                size: size ?? TextWidgetSize.MEDIUM,
              ),
              child != null ? divideW4 : Container(width: 0, height: 0),
              child != null ? child! : Container(width: 0, height: 0)
            ],
          )),
    );
  }
}
