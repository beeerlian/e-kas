// ignore_for_file: prefer_const_constructors

import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/constants/divider.constant.dart';
import 'package:ekas/presentation/component/text/text_widget.dart';
import 'package:ekas/presentation/finance/pages/finance_detail_page.dart';
import 'package:flutter/material.dart';

class FinanceCard extends StatelessWidget {
  FinanceCard({
    Key? key,
    required this.date,
    required this.totalIncome,
    required this.totalOutcome,
  }) : super(key: key);

  String date;
  String totalIncome;
  String totalOutcome;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () =>
              Navigator.pushNamed(context, FinanceDetailPage.ROUTE_NAME),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffE6E6E6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Palette.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: TextWidget(
                    date,
                    color: Colors.white,
                    weight: FontWeight.w700,
                    size: TextWidgetSize.SEMI_MEDIUM,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        'Pemasukan',
                        size: TextWidgetSize.SEMI_MEDIUM,
                        color: Color(0xff929292),
                        weight: FontWeight.w700,
                      ),
                      divide8,
                      TextWidget(
                        'Pengeluaran',
                        size: TextWidgetSize.SEMI_MEDIUM,
                        color: Color(0xff929292),
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      'Rp ${totalIncome}',
                      size: TextWidgetSize.SEMI_MEDIUM,
                      color: Color(0xff4ECB71),
                      weight: FontWeight.w700,
                    ),
                    divide8,
                    TextWidget(
                      'Rp ${totalOutcome}',
                      size: TextWidgetSize.SEMI_MEDIUM,
                      color: Palette.error,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(Icons.chevron_right),
                  ),
                ),
              ],
            ),
          ),
        ),
        divide24,
      ],
    );
  }
}
