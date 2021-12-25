import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/presentation/bloc/invoice_bloc.dart';
import 'package:ekas/presentation/component/text/text_widget.dart';
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
      body: BlocConsumer<InvoiceBloc, InvoiceState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is IncomeHasData) {
            return ListView.builder(
                itemCount: state.incomes.length,
                itemBuilder: (context, index) {
                  return TextWidget(state.incomes[index].nominal,
                      color: Palette.primary);
                });
          } else if (state is IncomeHasError) {
            return Center(
              child: TextWidget(state.message, color: Palette.primary),
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
