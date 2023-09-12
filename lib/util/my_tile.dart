import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Color(0xE5ECF8FF)),
      ),
    );
  }
}
