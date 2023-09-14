import 'package:flutter/material.dart';
import 'package:openemr/util/my_box.dart';
import 'package:openemr/util/my_tile.dart';
import '../constants.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: defaultBackgroundColor,
        appBar: myAppBar,
        body: TabBarView(
          children: <Widget>[
            //p1
            ListView(children: [
              Container(height: 200, child: carousel),
              Container(
                  height: height / 2,
                  child: Divider(
                    color: Colors.black,
                    thickness: 3,
                  ))
            ]),
            //p2
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      height: height / 4, width: width, child: MyBox()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GridView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyTile(),
                    ),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      height: height / 4, width: width, child: MyTile()),
                )
              ],
            ),
          ],
        ),
        floatingActionButton: actionbutton);
  }
}
