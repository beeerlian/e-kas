import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/constants/divider.constant.dart';
import 'package:ekas/presentation/bloc/invoice_bloc.dart';
import 'package:ekas/presentation/component/text/text_widget.dart';
import 'package:ekas/presentation/incomes/components/income_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomesPage extends StatefulWidget {
  const IncomesPage({Key? key}) : super(key: key);
  static const String ROUTE_NAME = "/income-page";
  @override
  _IncomesPageState createState() => _IncomesPageState();
}

class _IncomesPageState extends State<IncomesPage> {
  @override
  void initState() {
    context.read<InvoiceBloc>().add(GetIncomesEvent());
    super.initState();
  }

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
          'Daftar Penghasilan',
          size: TextWidgetSize.MEDIUM,
          weight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<InvoiceBloc, InvoiceState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is IncomeHasData) {
            return Column(
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
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    itemCount: state.incomes.length,
                    itemBuilder: (context, index) {
                      return IncomeCard(
                        incomeFrom: state.incomes[index].desc,
                        totalIncome: state.incomes[index].nominal,
                        date: state.incomes[index].date,
                      );
                      // return Column(
                      //   children: [
                      //     TextWidget(
                      //       state.incomes[index].nominal,
                      //       color: Palette.primary,
                      //     ),
                      //     TextWidget(
                      //       state.incomes[index].date,
                      //       color: Palette.primary,
                      //     ),
                      //   ],
                      // );
                    },
                  ),
                ),
              ],
            );
          } else if (state is IncomeHasError) {
            return Center(
              child: TextWidget(
                state.message,
                color: Palette.primary,
              ),
            );
          } else if (state is IncomeIsEmpty) {
            return Center(
              child: TextWidget(
                'Data Kosong',
                color: Palette.primary,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
