import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/constants/divider.constant.dart';
import 'package:ekas/presentation/component/text/text_widget.dart';
import 'package:flutter/material.dart';

class OutcomeCard extends StatelessWidget {
  OutcomeCard({
    Key? key,
    required this.outcomeFor,
    required this.totalOutcome,
    required this.date,
  }) : super(key: key);

  String outcomeFor;
  String totalOutcome;
  String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    'Pengeluaran',
                    size: TextWidgetSize.SEMI_MEDIUM,
                    weight: FontWeight.w700,
                    color: Color(0xff929292),
                  ),
                  divide4,
                  TextWidget(
                    outcomeFor,
                    size: TextWidgetSize.XTRA_SMALL,
                    weight: FontWeight.w700,
                    color: Color(0xff929292),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextWidget(
                    'Rp ${totalOutcome}',
                    size: TextWidgetSize.SEMI_MEDIUM,
                    weight: FontWeight.w700,
                    color: Palette.error,
                  ),
                  divide4,
                  TextWidget(
                    date,
                    size: TextWidgetSize.XTRA_SMALL,
                    weight: FontWeight.w700,
                    color: Color(0xff929292),
                  ),
                ],
              ),
            ],
          ),
          divide4,
          Divider(),
        ],
      ),
    );
  }
}
