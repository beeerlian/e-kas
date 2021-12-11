import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/constants/dimens.constant.dart';
import 'package:ekas/presentation/component/button/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TextWidgetSize {
  XTRA_SMALL,
  SMALL,
  SEMI_MEDIUM,
  MEDIUM,
  MEDIUM_TO_SEMI_LARGE,
  SEMI_LARGE,
  LARGE,
  XTRA_LARGE
}
enum TextWidgetVariant { DEFAULT, SECONDARY }

class TextWidget extends StatelessWidget {
  TextWidget(this.text,
      {Key? key,
      this.weight,
      this.align,
      this.color,
      this.maxLength,
      this.maxLines,
      this.size,
      this.moreText,
      this.ellipsed,
      this.variant})
      : super(key: key);

  final String text;
  final String? moreText;
  final FontWeight? weight;
  final TextWidgetSize? size;
  final TextAlign? align;
  final Color? color;
  final int? maxLength, maxLines;
  final bool? ellipsed;
  final TextWidgetVariant? variant;

  @override
  Widget build(BuildContext context) {
    double sizeFont = Dimens.size16;
    Color textColor = color ?? Colors.white;
    TextOverflow overFlowFont =
        ellipsed == true ? TextOverflow.ellipsis : TextOverflow.visible;

    switch (size) {
      case TextWidgetSize.XTRA_SMALL:
        sizeFont = Dimens.size10;
        break;
      case TextWidgetSize.SMALL:
        sizeFont = Dimens.size12;
        break;
      case TextWidgetSize.SEMI_MEDIUM:
        sizeFont = Dimens.size14;
        break;
      case TextWidgetSize.MEDIUM:
        sizeFont = Dimens.size16;
        break;
      case TextWidgetSize.MEDIUM_TO_SEMI_LARGE:
        sizeFont = Dimens.size18;
        break;
      case TextWidgetSize.SEMI_LARGE:
        sizeFont = Dimens.size20;
        break;
      case TextWidgetSize.LARGE:
        sizeFont = Dimens.size24;
        break;
      case TextWidgetSize.XTRA_LARGE:
        sizeFont = Dimens.size32;
        break;
      default:
    }

    switch (variant) {
      case TextWidgetVariant.SECONDARY:
        textColor = Palette.textSecondary;
        break;
      default:
    }

    TextStyle textStyle = TextStyle(
      fontSize: sizeFont,
      fontWeight: weight ?? FontWeight.normal,
      color: textColor,
    );

    if (maxLength != null) {
      return buildTextSpan(textStyle, overFlowFont);
    }

    return buildText(textStyle, overFlowFont);
  }

  Widget buildText(TextStyle textStyle, TextOverflow overFlowFont) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      style: textStyle,
      overflow: overFlowFont,
      maxLines: maxLines ?? maxLines,
    );
  }

  Widget buildTextSpan(TextStyle textStyle, TextOverflow overFlowFont) {
    bool _isHalf = false;

    if (text.length > (maxLength ?? 25)) {
      _isHalf = true;
    }

    return _isHalf
        ? Text.rich(
            TextSpan(
              text: text.substring(0, (maxLength != null ? maxLength : 25)),
              style: textStyle,
              children: [
                WidgetSpan(
                  child: Text(
                    moreText ?? ' ...',
                    style: textStyle,
                    overflow: overFlowFont,
                  ),
                ),
              ],
            ),
          )
        : buildText(textStyle, overFlowFont);
  }
}

extension ExtendedText on TextWidget {
  addMargin({padding}) {
    return Container(
      margin: EdgeInsets.all(padding ?? Dimens.size16),
      child: this,
    );
  }

  addMarginV({vertical}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vertical ?? Dimens.size6),
      child: this,
    );
  }

  addMarginH({horizontal}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal ?? Dimens.size16),
      child: this,
    );
  }
}

extension PaddingRoundedButton on RoundedButton {
  addPadding({padding}) {
    return Container(
      margin: EdgeInsets.all(padding ?? Dimens.size16),
      child: this,
    );
  }
}
