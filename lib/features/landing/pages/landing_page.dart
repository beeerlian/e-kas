// ignore_for_file: prefer_const_constructors

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
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xff24C3CD),
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
                    "Solusi Manajemen Keuangan",
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
                  child: SizedBox(
                    width: 174,
                    height: 56,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xff007E9C),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, HomePage.ROUTE_NAME);
                      },
                      child: animate
                          ? const Text(
                              "Mulai",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Colors.white),
                            )
                          : Container(),
                    ),
                  ),
                  duration: const Duration(milliseconds: 500)),
            ],
          ),
        ),
      ),
    );
  }
}
