import 'package:ekas/constants/divider.constant.dart';
import 'package:ekas/presentation/component/text/text_widget.dart';
import 'package:flutter/material.dart';

class IncomeCard extends StatelessWidget {
  IncomeCard({
    Key? key,
    required this.incomeFrom,
    required this.totalIncome,
    required this.date,
  }) : super(key: key);

  String incomeFrom;
  String totalIncome;
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
                    'Penghasilan',
                    size: TextWidgetSize.SEMI_MEDIUM,
                    weight: FontWeight.w700,
                    color: Color(0xff929292),
                  ),
                  divide4,
                  TextWidget(
                    incomeFrom,
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
                    'Rp ${totalIncome}',
                    size: TextWidgetSize.SEMI_MEDIUM,
                    weight: FontWeight.w700,
                    color: Color(0xff4ECB71),
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
