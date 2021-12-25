import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/configs/size.config.dart';
import 'package:ekas/constants/dimens.constant.dart';
import 'package:flutter/material.dart';

class TextFieldUI extends StatelessWidget {
  const TextFieldUI(
      {Key? key,
      this.labelText,
      this.hintText,
      this.controller,
      this.obscureText})
      : super(key: key);

  final String? labelText, hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Palette.border),
        borderRadius: BorderRadius.circular(Dimens.size16),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(Dimens.size12),
      ),
      child: TextField(
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          labelText: labelText ?? '',
          hintText: hintText ?? '',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: InputBorder.none,
        ),
        controller: controller ?? null,
      ),
    );
  }
}
