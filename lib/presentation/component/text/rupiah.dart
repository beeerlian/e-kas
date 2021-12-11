import 'package:ekas/constants/dimens.constant.dart';
import 'package:flutter/material.dart';

class Rupiah extends StatelessWidget {
  final String nominal;
  final double? sizeRp;
  final double? sizeText;

  const Rupiah({Key? key, required this.nominal, this.sizeRp, this.sizeText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Rp.',
          style: TextStyle(fontSize: sizeRp ?? Dimens.size12),
        ),
        Text(
          nominal != '0' ? '$nominal' : '-',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: sizeText ?? Dimens.size12),
        ),
      ],
    );
  }
}
