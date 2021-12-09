import 'package:ekas/constants/dimens.constant.dart';
import 'package:ekas/utils/colors.config.dart';
import 'package:flutter/material.dart';

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
      centerTitle: true,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      title: const Text("Catatan Keuangan",
          style: TextStyle(
              fontSize: Dimens.size18,
              fontWeight: FontWeight.w600,
              color: Colors.white)),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            width: double.infinity,
            height: 280,
            color: Palette.primary,
            child: Column(
              children: [
                Text(
                  "Rp. 1.000.000",
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
