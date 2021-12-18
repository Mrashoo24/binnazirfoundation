import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/constants.dart';
import 'homePage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String name;
  String phone;
  String password;
  bool loading = false;

  //token
  String token = '';
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  void getToken(String uid) async {
    token = (await firebaseMessaging.getToken());
      await allapi.updateToken(uid, token);
  }
//token

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
                      child: FadeInImage(placeholder: AssetImage("assets/logo.webp"), image: AssetImage("assets/logo.webp"))
                    ),
                    Text("NAZIR CARE FOUNDATION",style: TextStyle(color: kgreybg,fontSize: 22,fontWeight: FontWeight.w700),)
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
                        onChanged: (value){
                          setState(() {
                            phone = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (value){
                          setState(() {
                            password = value;
                          });
                        },
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
                      InkWell(

                        onTap: (){
                            if(phone == null || password == null){
                              Get.snackbar("No User Found", "",snackPosition: SnackPosition.BOTTOM,backgroundColor: kred.withOpacity(0.4));
                            }else{
                              allapi.getVolunteer(phone).then((value) async {

                                print(value.length);

                                if(value.length == 0){


                                  Get.snackbar("No User Found", "",snackPosition: SnackPosition.BOTTOM,backgroundColor: kred.withOpacity(0.4));

                                }else{

                                  var userPassword = value[0].password;

                                  if(userPassword == password){
                                    SharedPreferences pref = await SharedPreferences.getInstance();
                                    await getToken(phone);
                                    pref.setString("userid", phone);
                                        Get.offAll(HomePage(userId:phone));



                                  }else{

                                    Get.snackbar("Error", "Password Incorrect",snackPosition: SnackPosition.BOTTOM,backgroundColor: kred.withOpacity(0.4));

                                  }


                                }



                              });
                            }


                        },
                        child: Container(
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
                        onTap: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          //Return bool
                          prefs.setBool('loggedin',true);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(userId : "Guest"))
                          );
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
