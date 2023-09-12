import 'package:flutter/material.dart';
import '../constants.dart';
import '../util/my_box.dart';
import '../util/my_tile.dart';

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
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      AspectRatio(aspectRatio: 2, child: MyBox()),
                      AspectRatio(
                        aspectRatio: 1,
                        child: GridView.count(
                          crossAxisCount: 2,
                          children: [
                            MyTile(),
                            MyTile(),
                            MyTile(),
                            MyTile(),
                          ],
                        ),
                      ),
                      AspectRatio(aspectRatio: 2, child: MyTile()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/human.png',
              fit: BoxFit.fitHeight,
              height: 50,
            ),
          ),
        ],
      ),
      floatingActionButton: actionbutton,
    );
  }
}
