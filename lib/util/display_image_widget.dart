import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const DisplayImage({
    Key? key,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color.fromRGBO(0, 0, 0, 1);

    return Center(
        child: Stack(children: [
      buildImage(color),
      Positioned(
        right: 4,
        top: 10,
        child: buildEditIcon(color),
      )
    ]));
  }

  Widget buildImage(Color color) {
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return CircleAvatar(
      radius: 75,
      backgroundColor: Colors.transparent,
      child: CircleAvatar(
        backgroundImage: image as ImageProvider,
        radius: 70,
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
      all: 8,
      child: Icon(
        Icons.edit,
        color: color,
        size: 20,
      ));

  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: Colors.white,
        child: child,
      ));
}
