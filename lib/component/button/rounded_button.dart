import 'package:ekas/constants/dimens.constant.dart';
import 'package:ekas/utils/colors.config.dart';
import 'package:ekas/utils/view_util.dart';
import 'package:flutter/material.dart';

enum RoundedButtonVariant { DEFAULT, OUTLINED }

class RoundedButton extends StatelessWidget {
  final String text;

  final Function()? press;

  final Color? color;

  final RoundedButtonVariant? variant;

  final Color? textColor;

  final double? width;

  final double? heigth;

  final double? borderRadius;

  final bool isLoading;
  final EdgeInsetsGeometry? padding;

  RoundedButton(
      {Key? key,
      required this.text,
      required this.press,
      this.color,
      this.padding,
      this.textColor,
      this.width,
      this.heigth,
      this.variant = RoundedButtonVariant.DEFAULT,
      this.isLoading = false,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigth,
      width: width,
      child: ElevatedButton(
          onPressed: !isLoading ? press ?? null : null,
          child: isLoading
              ? loading(color: Palette.dark1)
              : Text(
                  text,
                  style: TextStyle(
                      color: textColor ?? Palette.dark1,
                      fontWeight: FontWeight.w600),
                ),
          style: (variant == RoundedButtonVariant.DEFAULT)
              ? ButtonStyle(
                  padding: MaterialStateProperty.all(
                      padding ?? EdgeInsets.all(Dimens.size16)),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Palette.dark1;
                      else if (states.contains(MaterialState.disabled))
                        return Palette.secondary;
                      else if (states.contains(MaterialState.focused))
                        return Palette.primary;
                      return color ??
                          Palette.primary; // Use the component's default.
                    },
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(color: textColor ?? Palette.dark1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              borderRadius ?? Dimens.size8))))
              : ButtonStyle(
                  padding: MaterialStateProperty.all(
                      padding ?? EdgeInsets.all(Dimens.size16)),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (state) => Colors.white,
                  ),
                  side: MaterialStateProperty.resolveWith<BorderSide>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return BorderSide(color: Palette.dark1);
                      else if (states.contains(MaterialState.disabled))
                        return BorderSide(color: Palette.secondary);
                      else if (states.contains(MaterialState.focused))
                        return BorderSide(color: Palette.primary);
                      return BorderSide(
                          color: color ??
                              Palette.primary); // Use the component's default.
                    },
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(color: textColor ?? Palette.dark1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              borderRadius ?? Dimens.size8))))),
    );
  }
}
