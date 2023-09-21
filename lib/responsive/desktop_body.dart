import 'package:flutter/material.dart';
import 'package:openemr/util/my_box.dart';
import '../util/constants.dart';

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
        appBar: AppBar(
          leading: logo,
          title: appBarTitle,
          centerTitle: true,
          backgroundColor: appBarColor,
          elevation: appBarElevation,
          actions: [
            profile,
          ],
        ),
        body: TabBarView(
          children: [
            //p1-c1
            ListView(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                      height: height / 6,
                      width: width / 5,
                      child: const MyBox()),
                ),
              ),
            ]),
            //p1-c2
            // SizedBox(
            //     height: height / 6, width: width / 5, child: const MyTile()),
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
