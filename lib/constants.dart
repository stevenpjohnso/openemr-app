import 'package:flutter/material.dart';

var defaultBackgroundColor = Color(0xFFE0E9EF);
var appBarColor = Color(0xFFE0E9EF);
var myAppBar = AppBar(
  elevation: 0,
  backgroundColor: appBarColor,
  leading: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image.asset(
      'assets/logo.png',
      fit: BoxFit.fitHeight,
      height: 50,
    ),
  ),
  title: TabBar(
      indicator: BoxDecoration(
          color: Colors.blue[300], borderRadius: BorderRadius.circular(30)),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      tabs: [
        Tab(icon: Icon(Icons.home_rounded)),
        Tab(icon: Icon(Icons.newspaper_rounded)),
      ]),
  centerTitle: true,
  actions: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Icon(
          Icons.person,
          size: 30,
        ),
      ),
    )
  ],
);
var actionbutton = FloatingActionButton.extended(
  onPressed: () {},
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  elevation: 0,
  hoverElevation: 0,
  highlightElevation: 0,
  label: const Text('Search'),
  icon: const Icon(Icons.search),
);
