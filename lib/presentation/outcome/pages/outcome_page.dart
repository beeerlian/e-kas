import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/presentation/bloc/invoice_bloc.dart';
import 'package:ekas/presentation/component/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OutcomesPage extends StatefulWidget {
  const OutcomesPage({Key? key}) : super(key: key);
  static const String ROUTE_NAME = "/outcome-page";
  @override
  _OutcomesPageState createState() => _OutcomesPageState();
}

class _OutcomesPageState extends State<OutcomesPage> {
  @override
  void initState() {
    context.read<InvoiceBloc>().add(GetOutcomesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InvoiceBloc, InvoiceState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is OutcomeHasData) {
            return ListView.builder(
                itemCount: state.outcomes.length,
                itemBuilder: (context, index) {
                  return TextWidget(state.outcomes[index].nominal,
                      color: Palette.primary);
                });
          } else if (state is OutcomeHasError) {
            return Center(
              child: TextWidget(state.message, color: Palette.primary),
            );
          } else if (state is OutcomeIsEmpty) {
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
