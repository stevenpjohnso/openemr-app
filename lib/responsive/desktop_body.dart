import 'package:flutter/material.dart';
import '../constants.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      body: TabBarView(
        children: [
          //p1-c1
          carousel,
          //p1-c2

          //p2
          Container(
            child: Center(child: Text('reports')),
          )
        ],
      ),
    );
  }
}
