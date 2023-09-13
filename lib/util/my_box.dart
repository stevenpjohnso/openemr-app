import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  const MyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xB238B9FF), Color(0xFF38B9FF)],
        ),
      ),
    );
  }
}
