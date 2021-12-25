import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/constants/divider.constant.dart';
import 'package:ekas/presentation/component/text/text_widget.dart';
import 'package:ekas/presentation/finance/components/finance_detail_card.dart';
import 'package:flutter/material.dart';

class FinanceDetailPage extends StatelessWidget {
  FinanceDetailPage({
    Key? key,
    this.totalIncome = '',
    this.totalOutcome = '',
  }) : super(key: key);

  static const String ROUTE_NAME = '/finance-detail';

  String totalIncome;
  String totalOutcome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.chevron_left),
        ),
        elevation: 0,
        title: TextWidget(
          'Detail Keuangan',
          size: TextWidgetSize.MEDIUM,
          weight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        divide24,
        Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Palette.primary,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 6,
            ),
            child: TextWidget(
              'Bulan - Tahun',
              size: TextWidgetSize.SEMI_MEDIUM,
              weight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        divide24,
        Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Row(
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
                    'Pengeluaran',
                    size: TextWidgetSize.SMALL,
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
                    'Rp 4.200.000',
                    size: TextWidgetSize.SMALL,
                    weight: FontWeight.w700,
                    color: Palette.error,
                  ),
                ],
              ),
            ],
          ),
        ),
        divide8,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Divider(
            color: Colors.black,
            thickness: .7,
          ),
        ),
        divide8,
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 14),
            children: List.generate(
              5,
              (index) => FinanceDetailCard(),
            ),
          ),
        ),
      ],
    );
  }
}
