import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/configs/iconly_icons.dart';
import 'package:ekas/constants/dimens.constant.dart';
import 'package:ekas/constants/divider.constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final String? label;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final int? maxlines;
  final bool readOnly;
  final bool isNumber;
  final int? limit;
  final TextInputAction? textInputAction;
  final Function()? onTap;
  final Function(String? value)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? inputTextHeight;

  const EditTextField(
      {Key? key,
      required this.controller,
      this.hint,
      this.inputTextHeight = 2,
      this.label,
      this.validator,
      this.textInputAction,
      this.onChanged,
      this.obscureText = false,
      this.maxlines,
      this.readOnly = false,
      this.isNumber = false,
      this.onTap,
      this.limit,
      this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: Dimens.size12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? Text('$label',
                  style: TextStyle(
                    fontSize: Dimens.size12,
                    fontWeight: FontWeight.w600,
                  ))
              : Container(),
          divide2,
          TextFormField(
            onTap: onTap ?? null,
            readOnly: readOnly,
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            maxLines: maxlines ?? 1,
            textInputAction: textInputAction,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              fontSize: Dimens.size16,
              height: inputTextHeight,
              color: Colors.black,
            ),
            decoration: new InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              suffixIcon: suffixIcon != null
                  ? suffixIcon
                  : readOnly
                      ? Icon(Iconly.arrow_rigth)
                      : null,
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: prefixIcon,
                    )
                  : null,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.border, width: 1.0),
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimens.size8))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.border, width: 1.0),
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimens.size8))),
              hintText: hint ?? label,
              // labelText: label,
              // labelStyle: TextStyle(fontSize: Dimens.size12)
            ),
            validator: validator,
            inputFormatters: [
              if (limit != null) LengthLimitingTextInputFormatter(limit),
            ],
          ),
        ],
      ),
    );
  }
}
