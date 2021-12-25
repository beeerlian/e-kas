import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/presentation/component/text/text_widget.dart';
import 'package:ekas/presentation/finance/components/finance_card.dart';
import 'package:flutter/material.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({Key? key}) : super(key: key);

  static const String ROUTE_NAME = '/finance';

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
          'Catatan Keuangan',
          size: TextWidgetSize.MEDIUM,
          weight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 24,
      ),
      children: List.generate(
        20,
        (index) => FinanceCard(
          date: 'Nov 2021',
          totalIncome: '5400000',
          totalOutcome: '54000',
        ),
      ),
    );
  }
}
