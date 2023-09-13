import 'package:carousel_slider/carousel_slider.dart';
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
      ]),
  centerTitle: true,
  actions: [
    Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: Image.asset(
            'assets/ph_user-thin.png',
            fit: BoxFit.fitHeight,
            height: 30,
          ),
        ))
  ],
);
var carousel = ListView(
  children: [
    CarouselSlider(
      items: [
        //1st Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage('assets/0.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //2nd Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage('assets/0.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //3rd Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage('assets/0.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //4th Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage('assets/0.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //5th Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage('assets/0.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],

      //Slider Container properties
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
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
      height: 30,
    ));
