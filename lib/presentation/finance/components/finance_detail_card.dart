import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/constants/divider.constant.dart';
import 'package:ekas/presentation/component/text/text_widget.dart';
import 'package:flutter/material.dart';

class FinanceDetailCard extends StatelessWidget {
  const FinanceDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffECECEC),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 20,
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
                        'Pemasukan',
                        size: TextWidgetSize.SMALL,
                        weight: FontWeight.w700,
                        color: Color(0xff929292),
                      ),
                      divide8,
                      TextWidget(
                        'Freelancer',
                        size: TextWidgetSize.XTRA_SMALL,
                        weight: FontWeight.w700,
                        color: Color(0xff929292),
                      ),
                    ],
                  ),
                  divideW24,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextWidget(
                        'Rp 5.200.000',
                        size: TextWidgetSize.SMALL,
                        weight: FontWeight.w700,
                        color: Color(0xff4ECB71),
                      ),
                      divide8,
                      TextWidget(
                        '01 Nov 2021',
                        size: TextWidgetSize.SMALL,
                        weight: FontWeight.w700,
                        color: Color(0xff929292),
                      ),
                    ],
                  ),
                ],
              ),
              divide16,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.edit,
                      color: Color(0xff699BF7),
                      size: 20,
                    ),
                  ),
                  divideW8,
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.delete,
                      color: Palette.error,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        divide16,
      ],
    );
  }
}
