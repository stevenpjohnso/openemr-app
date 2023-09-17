import 'package:flutter/material.dart';
import '../constants.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: defaultBackgroundColor,
        appBar: myAppBar,
        body: TabBarView(
          children: [
            //p1
            carousel,
            //p2
            Container()
          ],
        ),
      ),
    );
  }
}
