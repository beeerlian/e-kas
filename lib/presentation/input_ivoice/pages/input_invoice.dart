import 'package:ekas/configs/colors.config.dart';
import 'package:ekas/constants/divider.constant.dart';
import 'package:ekas/domain/models/finance.dart';
import 'package:ekas/presentation/bloc/invoice_bloc.dart';
import 'package:ekas/presentation/component/button/rounded_button.dart';
import 'package:ekas/presentation/component/text/text_widget.dart';
import 'package:ekas/presentation/component/text_field/text_field.dart';
import 'package:ekas/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:jiffy/jiffy.dart';

enum TypeInvoice { pemasukan, pengeluaran }

class Inputinvoice extends StatefulWidget {
  const Inputinvoice({Key? key}) : super(key: key);
  static const String ROUTE_NAME = "/input-invoice";
  @override
  _InputinvoiceState createState() => _InputinvoiceState();
}

class _InputinvoiceState extends State<Inputinvoice> {
  TextEditingController tipe = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController jumlah = TextEditingController();
  TextEditingController keterangan = TextEditingController();
  TypeInvoice _selectedTypeInvoice = TypeInvoice.pemasukan;
  late String dateInvoice;
  late Widget countryDropDown;

  final List<TypeInvoice> tipeData = [
    TypeInvoice.pemasukan,
    TypeInvoice.pengeluaran
  ];
  @override
  void initState() {
    Jiffy jiffy = Jiffy(DateTime.now(), "dd-MM-yyyy");
    dateInvoice = jiffy.format("dd-MM-yyyy");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    countryDropDown = Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      height: 44,
      //width: 300.0,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<TypeInvoice>(
            value: _selectedTypeInvoice,
            items: tipeData.map((TypeInvoice value) {
              return DropdownMenuItem<TypeInvoice>(
                  value: value,
                  child: TextWidget(
                    value == TypeInvoice.pemasukan
                        ? "Pemasukan"
                        : "Pengeluaran",
                    size: TextWidgetSize.MEDIUM,
                    color: Palette.primary,
                  ));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedTypeInvoice = value as TypeInvoice;
              });
            },
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
    return BlocConsumer<InvoiceBloc, InvoiceState>(
      listener: (context, state) {
        if (state is SaveIncomeHasError) {
          showAboutDialog(
            children: [
              TextWidget(
                "Error",
                color: Colors.black,
              ),
              TextWidget(
                state.message,
                color: Colors.black,
              ),
            ],
            context: context,
          );
        } else if (state is SaveIncomeSuccess || state is SaveOutcomeSuccess) {
          Navigator.pushReplacementNamed(context, HomePage.ROUTE_NAME);
        } else if (state is SaveOutcomeHasError) {
          showAboutDialog(
            children: [
              TextWidget(
                "Error",
                color: Colors.black,
              ),
              TextWidget(
                state.message,
                color: Colors.black,
              ),
            ],
            context: context,
          );
        }
      },
      builder: (context, state) {
        if (state is Inputinvoice) {
          isLoading = true;
        } else {
          isLoading = false;
        }
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: ListView(
                children: [
                  TextWidget(
                    "Tambah Data Keuangan",
                    color: Palette.primary,
                    align: TextAlign.center,
                  ),
                  divide32,
                  TextWidget(
                    "Tipe Pemasukan",
                    color: Palette.primary,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Palette.border)),
                    child: countryDropDown,
                  ),
                  TextWidget(
                    "Tanggal",
                    color: Palette.primary,
                  ),
                  InkWell(
                    onTap: pickDate,
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.only(left: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Palette.border)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextWidget(
                          dateInvoice,
                          color: Palette.primary,
                        ),
                      ),
                    ),
                  ),
                  TextWidget(
                    "Jumlah",
                    color: Palette.primary,
                  ),
                  EditTextField(
                      prefixIcon: Container(
                        width: 50,
                        padding: EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        child: TextWidget(
                          "Rp. ",
                          color: Palette.primary,
                        ),
                      ),
                      inputTextHeight: 1.5,
                      controller: jumlah),
                  TextWidget(
                    "Keterangan",
                    color: Palette.primary,
                  ),
                  EditTextField(inputTextHeight: 1.5, controller: keterangan),
                  divide12,
                  Row(
                    children: [
                      Expanded(
                          child: RoundedButton(
                        press: () {},
                        text: "Batal",
                      )),
                      divideW12,
                      Expanded(
                          child: RoundedButton(
                        isLoading: isLoading,
                        text: "Simpan",
                        press: () {
                          if (_selectedTypeInvoice == TypeInvoice.pemasukan) {
                            inputIncome();
                          } else if (_selectedTypeInvoice ==
                              TypeInvoice.pengeluaran) {
                            inputOutcome();
                          }
                        },
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void inputIncome() {
    context.read<InvoiceBloc>().add(SaveIncomeEvent(Finance(
        desc: keterangan.text, date: dateInvoice, nominal: jumlah.text)));
  }

  void inputOutcome() {
    context.read<InvoiceBloc>().add(SaveOutcomeEvent(Finance(
        desc: keterangan.text, date: dateInvoice, nominal: jumlah.text)));
  }

  void pickDate() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2016, 1, 1),
        maxTime: DateTime(2022, 12, 30), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      Jiffy jiffy = Jiffy(date, "dd-MM-yyyy");
      dateInvoice = jiffy.format("dd-MM-yyyy");
      //dateInvoice = DateTime.parse("yyyy-MM-dd").toString();
      setState(() {});
    }, currentTime: DateTime.now(), locale: LocaleType.id);
  }
}
