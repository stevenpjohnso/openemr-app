import 'package:flutter/material.dart';
import '../util/constants.dart';
import '../util/my_box.dart';
import '../util/my_tile.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: defaultBackgroundColor,
        appBar: AppBar(
          title: appBarTitle,
          backgroundColor: appBarColor,
          elevation: appBarElevation,
        ),
        body: TabBarView(
          children: <Widget>[
            //p1
            ListView(children: [
              SizedBox(height: 200, child: carousel),
              SizedBox(
                  height: height / 2,
                  child: const Divider(
                    color: Colors.black,
                    thickness: 3,
                  ))
            ]),
            //p2
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                      height: height / 4, width: width, child: const MyBox()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GridView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: MyTile(),
                    ),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFFB6C1C7)),
                      height: height / 4,
                      width: width,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'F I L E   C H A N G E S',
                        ),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
