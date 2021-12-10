// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:ekas/constants/dimens.constant.dart';
import 'package:ekas/utils/colors.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String ROUTE_NAME = "/home-page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
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
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            width: double.infinity,
            height: 280,
            color: Palette.primary,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Kas Utama',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Rp. 1.000.000",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 112,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Tambah'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Palette.primary,
                      ),
                      elevation: MaterialStateProperty.all(0),
                      side: MaterialStateProperty.all(
                        BorderSide(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
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
            decoration: BoxDecoration(
              // color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
