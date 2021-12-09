import 'package:ekas/component/image/network_image_rounded.dart';
import 'package:ekas/constants/dimens.constant.dart';
import 'package:ekas/constants/divider.constant.dart';
import 'package:ekas/features/home/components/messages_in_chip.dart';
import 'package:ekas/utils/colors.config.dart';
import 'package:flutter/material.dart';

class RoomChatCard extends StatefulWidget {
  const RoomChatCard({Key? key}) : super(key: key);

  @override
  _RoomChatCardState createState() => _RoomChatCardState();
}

class _RoomChatCardState extends State<RoomChatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedImageNetwork(
            path: "https://picsum.photos/id/237/200/300",
            height: 60,
            width: 60,
            radius: 50,
          ),
          divideW12,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Friends name",
                    style: TextStyle(
                        fontSize: Dimens.size20,
                        fontWeight: FontWeight.w600,
                        color: Palette.dark1)),
                divide6,
                const Text(
                    "In case you missed it, here’s the board here’s the board",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: Dimens.size14,
                        fontWeight: FontWeight.w400,
                        color: Palette.secondary)),
              ],
            ),
          ),
          Column(
            children: [
              const Text("7:17 pm",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: Dimens.size1,
                      fontWeight: FontWeight.w500,
                      color: Palette.secondary)),
              divide12,
              Row(
                children: [
                  const Icon(
                    Icons.no_accounts,
                    size: 20,
                    color: Palette.secondary,
                  ),
                  divideW4,
                  MessagesInChip(messagesCount: 3)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
