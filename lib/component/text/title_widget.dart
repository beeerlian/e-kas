import 'package:ekas/component/text/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
    this.text, {
    Key? key,
    this.size,
    this.color,
    this.weight,
    this.align,
  }) : super(key: key);

  final String text;
  final TextWidgetSize? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text,
      size: size ?? TextWidgetSize.LARGE,
      color: color ?? Colors.white,
      weight: weight ?? FontWeight.w700,
      align: align ?? TextAlign.start,
    );
  }
}
