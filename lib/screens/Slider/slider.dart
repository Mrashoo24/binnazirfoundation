import 'package:binnazirfoundation/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import '../../login.dart';

class StartSlider extends StatefulWidget {
  const StartSlider({Key key}) : super(key: key);

  @override
  _StartSliderState createState() => _StartSliderState();
}

class _StartSliderState extends State<StartSlider> {
  final pages = [

    PageViewModel(
      pageColor: const Color(0xFFFFFFFF),
      // iconImageAssetPath: 'assets/air-hostess.png',
      bubble: Image.asset('assets/char_web.webp'),
      body: const Text(
        'We makes it easy to donate to reliable, locally-led disaster relief and recovery efforts around the world',
      ),
      title: const Text(
        'OUR MISSION',
      ),
      titleTextStyle:
      GoogleFonts.berkshireSwash( color: kpurple   ),
      bodyTextStyle: const TextStyle(fontFamily: 'CentraleSansRegular', color: kred),
      mainImage: Image.asset(
        'assets/char_web.webp',
        height: Get.height*0.6,
        width: Get.width*0.9,
        alignment: Alignment.center,
      ),
    ),
    PageViewModel(
      pageColor: const Color(0xFFFFFFFF),
      // iconImageAssetPath: 'assets/air-hostess.png',
      bubble: Image.asset('assets/ZC.webp'),
      body: const Text(
        'Calculate Find and Apply for Zakat \n Simpler Faster Smarter',
      ),
      title: const Text(
        'ZAKAT',
      ),
      titleTextStyle:
       GoogleFonts.berkshireSwash( color: kpurple   ),
      bodyTextStyle: const TextStyle(fontFamily: 'CentraleSansRegular', color: kred),
      mainImage: Image.asset(
        'assets/ZC.webp',
        height: Get.height*0.6,
        width: Get.width*0.9,
        alignment: Alignment.center,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => IntroViewsFlutter(
        pages,
        showNextButton: true,
        showBackButton: true,
        onTapDoneButton: () {
          // Use Navigator.pushReplacement if you want to dispose the latest route
          // so the user will not be able to slide back to the Intro Views.
          Get.to(Login());
        },
        pageButtonTextStyles: const TextStyle(
          color: Colors.blue,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
