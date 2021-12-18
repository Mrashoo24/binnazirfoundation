import 'dart:ui';

import 'package:auto_animated/auto_animated.dart';
import 'package:binnazirfoundation/components/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common.dart';

const kred = Color(0xffFF0002);
const kpurple = Color(0xFF823E79);
const kscafpadding = 16.0;
const kgreen = Color(0xFF013307);
const klightgreen = Color(0xFF00920E);
const kblue = Colors.blue;
const kwhite = Colors.white;
const kbnbcolor = Color(0xFF212121);
const kblackcolor = Color(0xFF212121);
const kgreybg= Color(0xFF4B484B);
const kredcolor = Colors.red;
var kyellow = Colors.yellow.shade800;
var scafKey = GlobalKey<ScaffoldState>();
const URL = "https://nazircare.com/mrzulf/api/";
const imageURL = "https://nazircare.com/causes/";
var allapi = AllApi();

var preloader =Container(
height: Get.height,
width: Get.width,
child: Padding(
padding: const EdgeInsets.all(100),
child: Image.asset("assets/preloader.png",width: 100,height: 100,),
)
);



final options = LiveOptions(
  // Start animation after (default zero)
  delay: Duration(milliseconds: 100),

  // Show each item through (default 250)
  showItemInterval: Duration(milliseconds: 100),

  // Animation duration (default 250)
  showItemDuration: Duration(milliseconds: 250),

  // Animations starts at 0.05 visible
  // item fraction in sight (default 0.025)
  visibleFraction: 0.05,

  // Repeat the animation of the appearance
  // when scrolling in the opposite direction (default false)
  // To get the effect as in a showcase for ListView, set true
  reAnimateOnVisibility: false,
);


// Build animated item (helper for all examples)
Widget animatedWidget(animation,widget){
return FadeTransition(
  opacity: Tween<double>(
    begin: 0,
    end: 1,
  ).animate(animation),
  // And slide transition
  child: SlideTransition(
    position: Tween<Offset>(
      begin: Offset(-0.1, 0),
      end: Offset.zero,
    ).animate(animation),
    // Paste you Widget
    child: widget,
  ),
);
}
