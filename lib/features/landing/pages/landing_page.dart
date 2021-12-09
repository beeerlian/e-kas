import 'dart:async';

import 'package:ekas/constants/divider.constant.dart';
import 'package:ekas/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  static const String ROUTE_NAME = "/landing-page";
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    animatingText();
    //displayLandingPage();
  }

  animatingText() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, () {
      setState(() {
        animate = true;
      });
    });
  }

  displayLandingPage() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.pushReplacementNamed(context, HomePage.ROUTE_NAME);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text(
                  "E-KAS",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                divide12,
                const Text(
                  "Solusi Masalah Keuangan",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Image.asset(
              "assets/images/splash.png",
              width: MediaQuery.of(context).size.width / 1.3,
              fit: BoxFit.fitWidth,
            ),
            AnimatedContainer(
                width: animate ? 174 : 0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, HomePage.ROUTE_NAME);
                  },
                  child: animate
                      ? const Text(
                          "Mulai",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        )
                      : Container(),
                ),
                duration: const Duration(milliseconds: 500)),
          ],
        ),
      ),
    );
  }
}
