// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'dart:ui';

import 'package:ekas/common/invoice_report.dart';
import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/constants/dimens.constant.dart';
import 'package:ekas/constants/divider.constant.dart';
import 'package:ekas/presentation/bloc/invoice_bloc.dart';
import 'package:ekas/presentation/component/svg/svg_ui.dart';
import 'package:ekas/presentation/component/text/text_widget.dart';
import 'package:ekas/presentation/incomes/pages/incomes_page.dart';
import 'package:ekas/presentation/input_ivoice/pages/input_invoice.dart';
import 'package:ekas/presentation/outcome/pages/outcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String ROUTE_NAME = "/home-page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int kasUtama = 0;
  @override
  void initState() {
    context.read<InvoiceBloc>().add(GetYearlyIncomesEvent(2021));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Palette.primary,
        body: RefreshIndicator(onRefresh: refresh, child: _buildBody()),
      ),
    );
  }

  Future<void> refresh() async {
    context.read<InvoiceBloc>().add(GetYearlyIncomesEvent(2021));
    return Future.delayed(Duration(seconds: 2));
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Palette.primary,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      title: const Text(
        "Menu Utama",
        style: TextStyle(
          fontSize: Dimens.size18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Kas Bulan Ini',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Rp. $kasUtama',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      width: 112,
                      height: 36,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Inputinvoice.ROUTE_NAME);
                        },
                        child: Text(
                          'Tambah',
                        ),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(
                            Palette.primary,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xffE6E6E6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 295,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: BlocConsumer<InvoiceBloc, InvoiceState>(
                          listener: (context, state) {
                            if (state is YearlyIncomesHasData) {
                              setState(() {
                                kasUtama = state
                                        .incomes.invoicesMonthly[11].nominal -
                                    state.outcomes.invoicesMonthly[11].nominal;
                                // kasUtama = calculateKasUtama(
                                //     state.incomes, state.outcomes);
                              });
                            }
                          },
                          builder: (context, state) {
                            if (state is YearlyIncomesHasData) {
                              return monthReport(
                                "December",
                                "${state.incomes.year}",
                                state.incomes.invoicesMonthly[11].nominal,
                                state.outcomes.invoicesMonthly[11].nominal,
                              );
                            } else {
                              return TextWidget(state.toString());
                            }
                          },
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgUI('assets/svgs/emojione_money-bag.svg'),
                              Text(
                                'Catatan Keuangan',
                                style: TextStyle(
                                  color: Palette.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, IncomesPage.ROUTE_NAME);
                          },
                          child: Container(
                            width: 140,
                            height: 85,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgUI('assets/svgs/penghasilan.svg'),
                                Text(
                                  'Penghasilan',
                                  style: TextStyle(
                                    color: Palette.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, OutcomesPage.ROUTE_NAME);
                          },
                          child: Container(
                            width: 140,
                            height: 85,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgUI(
                                    'assets/svgs/emojione-v1_money-with-wings.svg'),
                                Text(
                                  'Pengeluaran',
                                  style: TextStyle(
                                    color: Palette.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 140,
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgUI(
                                  'assets/svgs/noto-v1_exclamation-question-mark.svg'),
                              Text(
                                'Segera Datang',
                                style: TextStyle(
                                  color: Palette.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        ListView()
      ],
    );
  }

  Widget monthReport(String month, String year, int income, int outcome) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '$month $year',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Palette.primary,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SvgUI(
                      'assets/svgs/pemasukan.svg',
                      width: 20,
                      height: 20,
                    ),
                    divideW6,
                    Text(
                      'Pemasukan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff929292),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Rp. $income',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4ECB71),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    SvgUI(
                      'assets/svgs/pengeluaran.svg',
                      width: 20,
                      height: 20,
                    ),
                    divideW6,
                    Text(
                      'Pengeluaran',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff929292),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Rp. $outcome',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF24E1E),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  int calculateKasUtama(InvoiceReport incomes, InvoiceReport outcomes) {
    int totalIncomes = 0;
    int totalOutcomes = 0;
    for (var i = 0; i < 12; i++) {
      totalIncomes += incomes.invoicesMonthly[i].nominal;
      totalOutcomes += outcomes.invoicesMonthly[i].nominal;
    }
    return totalIncomes - totalOutcomes;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
