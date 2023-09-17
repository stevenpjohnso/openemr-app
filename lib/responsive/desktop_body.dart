import 'package:flutter/material.dart';
import 'package:openemr/util/my_box.dart';
import 'package:openemr/util/my_tile.dart';
import '../constants.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: defaultBackgroundColor,
        appBar: myAppBar,
        body: TabBarView(
          children: [
            //p1-c1
            ListView(children: [
              SizedBox(
                  height: height / 6, width: width / 4, child: const MyBox()),
              SizedBox(
                  height: height / 6, width: width / 4, child: const MyTile()),
            ]),
            //p1-c2

            //p2
            Stack(
              children: [
                Image.asset(
                  'assets/human.png',
                  alignment: Alignment.centerLeft,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
