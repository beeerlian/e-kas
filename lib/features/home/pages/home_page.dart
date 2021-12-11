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
        backgroundColor: Palette.primary,
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

//   Widget _buildBody() {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//           width: double.infinity,
//           // height: 280,
//           child: Column(
//             // ignore: prefer_const_literals_to_create_immutables
//             children: [
//               Text(
//                 'Kas Utama',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               SizedBox(
//                 height: 4,
//               ),
//               Text(
//                 "Rp. 1.000.000",
//                 style: TextStyle(
//                   fontSize: 36,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               SizedBox(
//                 width: 112,
//                 height: 36,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Tambah'),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       Palette.primary,
//                     ),
//                     elevation: MaterialStateProperty.all(0),
//                     side: MaterialStateProperty.all(
//                       BorderSide(
//                         width: 2,
//                         color: Colors.white,
//                       ),
//                     ),
//                     shape: MaterialStateProperty.all(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
}

Widget _buildBody() {
  return Center(
    child: Column(
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
                  'Kas Utama',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Rp. 1.000.000',
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
                    onPressed: () {},
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
                ),
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
                    ),
                  ],
                ),
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
