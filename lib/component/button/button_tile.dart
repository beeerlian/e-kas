import 'package:ekas/component/text/text_widget.dart';
import 'package:ekas/configs/iconly_icons.dart';
import 'package:ekas/constants/dimens.constant.dart';
import 'package:flutter/material.dart';

import 'icon_ui.dart';

class ButtonTile extends StatelessWidget {
  final String title;
  final Function()? press;
  final bool showIcon;

  const ButtonTile(
      {Key? key,
      required this.title,
      required this.press,
      this.showIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.size20),
      ),
      elevation: 2.0,
      child: ListTile(
        title: TextWidget(title),
        trailing: showIcon == true
            ? IconUi(
                press: null,
                iconData: Iconly.arrow_rigth,
              )
            : null,
        onTap: press,
      ),
    );
  }
}
