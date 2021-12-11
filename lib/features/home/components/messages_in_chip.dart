import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/constants/dimens.constant.dart';
import 'package:flutter/material.dart';

class MessagesInChip extends StatelessWidget {
  MessagesInChip({Key? key, required this.messagesCount}) : super(key: key);

  int messagesCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          color: Palette.primary, borderRadius: BorderRadius.circular(60)),
      child: Text(
        "$messagesCount",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: Dimens.size14),
      ),
    );
  }
}
