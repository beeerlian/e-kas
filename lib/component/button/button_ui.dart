import 'package:ekas/component/text/text_widget.dart';
import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/configs/size.config.dart';
import 'package:ekas/constants/dimens.constant.dart';
import 'package:ekas/constants/divider.constant.dart';
import 'package:flutter/material.dart';

enum ButtonUIVariant { OUTLINE, DEFAULT, PLAINTEXT, PRIMARY_OUTLINED }

class ButtonUI extends StatelessWidget {
  const ButtonUI({
    Key? key,
    this.text,
    this.press,
    this.variant,
    this.colorText,
    this.prefix,
    this.disabled,
  }) : super(key: key);

  final String? text;
  final void Function()? press;
  final ButtonUIVariant? variant;
  final Color? colorText;
  final Widget? prefix;
  final bool? disabled;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Color bgColor = Palette.primary;
    BorderSide border = BorderSide.none;
    double height = 56.0;
    Color textColor = colorText ?? Palette.textPrimary;

    switch (variant) {
      case ButtonUIVariant.PRIMARY_OUTLINED:
        bgColor = Colors.transparent;
        border = BorderSide(width: Dimens.size1, color: Palette.primary);
        break;
      case ButtonUIVariant.OUTLINE:
        bgColor = Colors.transparent;
        border = BorderSide(width: Dimens.size1, color: Palette.border);
        break;
      case ButtonUIVariant.PLAINTEXT:
        bgColor = Colors.transparent;
        border = BorderSide.none;
        height = 28.0;
        break;
      default:
    }

    if (disabled == true) {
      bgColor = Palette.disabled;
      textColor = Palette.textSecondary;
    }

    return SizedBox(
      width: double.infinity,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.size144),
            side: border,
          ),
          backgroundColor: bgColor,
        ),
        onPressed: press != null && disabled != true ? press : () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            divideW8,
            prefix ?? Container(),
            Expanded(
              child: Center(
                child: TextWidget(
                  text ?? '',
                  color: textColor,
                  weight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
