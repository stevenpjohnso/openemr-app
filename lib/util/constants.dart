import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/themes.dart';

var defaultBackgroundColor = Themes().getBackgroundColor();
var appBarColor = Colors.transparent;
final appBarTitle = TabBar(
    indicator: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(30)),
    labelColor: Colors.black,
    unselectedLabelColor: Colors.black,
    tabs: [
      Tab(
        icon: Image.asset(
          'assets/ph_dna-thin.png',
          fit: BoxFit.fitHeight,
          height: 30,
        ),
      ),
      Tab(
        icon: Image.asset(
          'assets/ph_file-thin.png',
          fit: BoxFit.fitHeight,
          height: 30,
        ),
      ),
    ]);

const appBarElevation = 0.0;

final logo = TextButton(
  onPressed: () {
    Get.toNamed('/home');
  },
  child: Image.asset(
    'assets/logo.png',
    fit: BoxFit.contain,
    height: 100,
    width: 100,
  ),
);

final profile = Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.blueAccent,
        width: 2,
      ),
    ),
    child: TextButton(
      onPressed: () {
        Get.toNamed('/profile');
      },
      child: Image.asset(
        'assets/ph_user-thin.png',
        fit: BoxFit.fitHeight,
        height: 30,
      ),
    ),
  ),
);

var myAppBar = AppBar(
  elevation: 0,
  backgroundColor: appBarColor,
  leading: logo,
  title: appBarTitle,
  centerTitle: true,
  actions: [
    profile,
  ],
);

const backButton = BackButton(color: Colors.black);

var carousel = ListView(
  children: [
    CarouselSlider(
      items: [
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: const LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xB238B9FF), Color(0xFF38B9FF)],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0xE5ECF8FF),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0xE5ECF8FF),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0xE5ECF8FF),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0xE5ECF8FF),
          ),
        ),
      ],
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: false,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    ),
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
    icon: Image.asset(
      'assets/iconamoon_search-thin.png',
      fit: BoxFit.fitHeight,
      height: 35,
    ));
