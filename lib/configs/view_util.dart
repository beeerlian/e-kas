import 'package:ekas/configs/colors.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loading({color}) {
  return SpinKitThreeBounce(
    color: color ?? Palette.primary,
    size: 20,
  );
}
