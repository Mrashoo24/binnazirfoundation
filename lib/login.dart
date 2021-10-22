import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'components/constants.dart';
import 'homePage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/kid_bg.png"),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter)),
            ),
            RotatedBox(

              quarterTurns: 90,
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/bg.jpg"),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topCenter,

                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.3 ,
                      child: Image.asset("assets/logo.webp"),
                    ),
                    Text("NAZIR FOUNDATION",style: TextStyle(color: kgreybg,fontSize: 22,fontWeight: FontWeight.w700),)
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                child: Form(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: Get.width*0.1),
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.5,
                      ),
                      // Align(
                      //   alignment: Alignment.topCenter,
                      //   child: Container(
                      //     height: Get.height * 0.1,
                      //     child: Image.asset("assets/logo.webp"),
                      //   ),
                      // ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color: kred, fontWeight: FontWeight.w700,
                              fontSize: 30,letterSpacing: 3

                            ),
                          )),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "CentraleSansRegular"),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(.4),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: kred, width: 3)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: kred, width: 3)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: kred, width: 3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: kred, width: 3)),
                            labelText: "Registered Number",
                            labelStyle: TextStyle(
                                color: Colors.black.withOpacity(.4),
                                fontSize: 17,
                                fontFamily: "CentraleSansRegular")),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "CentraleSansRegular"),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(.4),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: kred, width: 3)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: kred, width: 3)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: kred, width: 3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: kred, width: 3)),
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color: Colors.black.withOpacity(.4),
                                fontSize: 17,
                                fontFamily: "CentraleSansRegular")),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 330,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: kgreybg,width: 1),
                          gradient: LinearGradient(
                            stops: [0.1, 0.5],
                            colors: [
                              Color(0xffffffff).withOpacity(0.8),
                              kred,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "CentraleSansRegular",
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: kblackcolor.withOpacity(0.4),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                                fontFamily: 'CentraleSansRegular',
                                fontSize: 17,
                                color: kwhite,
                                fontWeight: FontWeight.w600),
                      ),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Container(

                          decoration:BoxDecoration(
                            color: kwhite.withOpacity(0.7),
                           border: Border.all(
                           color: Color(0xff501396), width: 3
                           ),
                              borderRadius: BorderRadius.circular(10),

    ),
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
      "Continue as Guest",
      style: TextStyle(
      color: Color(0xff501396),
      fontFamily: "CentraleSansRegular",
      fontSize: 18,
      fontWeight: FontWeight.bold),
      ),
    ),
    ],
    ),
    ),


                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
