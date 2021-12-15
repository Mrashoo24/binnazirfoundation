import 'package:binnazirfoundation/screens/Slider/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/constants.dart';
import 'components/splashscreenMY.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kred,
        scaffoldBackgroundColor:Colors.white,

        textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: "CentraleSansRegular"
          ),
          headline2: TextStyle(
              color: Colors.black,
              fontFamily: "CentraleSansRegular"
          ),
          headline3: TextStyle(
              color: Colors.black,
              fontFamily: "CentraleSansRegular"
          ),
          headline4: TextStyle(
              color: Colors.black,
              fontFamily: "CentraleSansRegular"
          ),
          headline5: TextStyle(
              color: Colors.black,
              fontFamily: "CentraleSansRegular"
          ),
          headline6:TextStyle(
              color: Colors.black,
              fontFamily: "CentraleSansRegular"
          ),
          subtitle1: TextStyle(
              color: Colors.black,
              fontFamily: "CentraleSansRegular"
          ),
          subtitle2: TextStyle(
              color: Colors.black,
              fontFamily: "CentraleSansRegular"
          ),
          bodyText1: TextStyle(
              color: Colors.black,
              fontFamily: "CentraleSansRegular"
          ),
          bodyText2: TextStyle(
              color: Colors.black,
              fontFamily: "CentraleSansRegular"
          ),
          caption: TextStyle(
              color: Colors.black,
              fontFamily: "CentraleSansRegular"
          ),
          overline: TextStyle(
              color: Colors.black,
              fontFamily: "CentraleSansRegular"
          ),
        ),


      ),
      home:SplashScreenMy(
        duration: 20000,

        imageSrc: "assets/logov.gif",
        text: "NAZIR FOUNDATION",
        colors: [Colors.white],
        textType: TextType1.ScaleAnimatedText,
        textStyle: GoogleFonts.cabin(
            fontSize: 30, color: kgreybg, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        navigateRoute: StartSlider(),
      ),
    );
  }
}
