import 'package:flutter/material.dart';
import '../constants.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        floatingActionButton: actionbutton);
  }
}
