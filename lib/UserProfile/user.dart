import 'dart:convert';

import 'package:binnazirfoundation/UserProfile/registeration.dart';
import 'package:binnazirfoundation/components/api.dart';
import 'package:binnazirfoundation/components/constants.dart';
import 'package:binnazirfoundation/components/model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../homePage.dart';
import '../login.dart';

class UserProfile extends StatefulWidget {
  final String userid,code,uid;
  const UserProfile({Key key, this.userid, this.code, this.uid}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool showPassword = false;
  Map<String,dynamic> paymentIntentData ;
  TextEditingController emailController;

  TextEditingController passwordController;

  TextEditingController nameController;
  TextEditingController phoneController;
  TextEditingController countryController;

  String email;

  String password;

  String name;
  String phone;
  String country;

  //token
  String token = '';

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;



  void getToken(String uid) async {
    token = (await firebaseMessaging.getToken());
    await allapi.updateToken(uid, token);
  }







@override
  void initState() {

  Stripe.publishableKey = "pk_live_51K9pBSSInPgXpYUdR7ZOlKhn8JpEQiGLWxkywTFPQ6clBXy2Zj68FygbV9VT3mJW1LntSFCBKRrmJIGUuRwwjTw700zMb986RC";


  super.initState();

  }


  @override
  Widget build(BuildContext context) {
    print("use ${widget.userid}");
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kscafpadding),
          child: Center(
              child: widget.userid == "Guest"
                  ? buildLoginForm()
                  : FutureBuilder(
                    future: allapi.getVolunteer(widget.userid),
                    builder: (context, snapshot) {
                      if(!snapshot.hasData){

                        return preloader;

                      }

                      if(snapshot.hasError){

                        Fluttertoast.showToast(msg: "Something Went Wrong ");

                      }


                      return buildRegisterColumn(context,snapshot.requireData);
                    }
                  )

              // buildRegisterColumn(context),
              ),
        ),
      ),
    );
  }


  Widget buildLoginForm() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "LOGIN",
                style: TextStyle(
                    color: kred,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    letterSpacing: 3),
              )),
          Divider(
            height: 4,
            thickness: 2,
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            style: TextStyle(
                color: Colors.black, fontFamily: "CentraleSansRegular"),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(.4),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kred, width: 3)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kred, width: 3)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kred, width: 3)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kred, width: 3)),
                labelText: "Registered Number",
                labelStyle: TextStyle(
                    color: Colors.black.withOpacity(.4),
                    fontSize: 17,
                    fontFamily: "CentraleSansRegular")),
            onChanged: (value) {
              setState(() {
                phone = value;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            obscureText: true,
            style: TextStyle(
                color: Colors.black, fontFamily: "CentraleSansRegular"),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(.4),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kred, width: 3)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kred, width: 3)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kred, width: 3)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kred, width: 3)),
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
              if (phone == null || password == null) {
                Get.snackbar("No User Found", "",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: kred.withOpacity(0.4));
              } else {

                  allapi.getVolunteer(phone).then((value) async {
                    print(value.length);

                    if (value.length == 0) {
                      Get.snackbar("No User Found", "",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: kred.withOpacity(0.4));
                    } else {
                      var userPassword = value[0].password;

                      if (userPassword == password) {
                        SharedPreferences pref =
                        await SharedPreferences.getInstance();

                        await getToken(value[0].id);

                        pref.setString("userid", phone);
                        pref.setString("uid", value[0].id);
                        Get.offAll(HomePage(
                            userId: phone,uid:value[0].id));
                      } else {
                        Get.snackbar("Error", "Password Incorrect",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: kred.withOpacity(0.4));
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
                border: Border.all(color: kgreybg, width: 1),
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
          SizedBox(height: 30,),
          Row(
            children: [
              Text("Not A Member Yet ?"),
              SizedBox(width: 10,),
              ElevatedButton(
                onPressed: () {

                  Get.to(Registeration());

                },
                child: Text(

                  "BECOME A VOLUNTEER",
                  style: TextStyle(fontSize: 10),

                ),

                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(kred.withOpacity(0.6)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column buildRegisterColumn(BuildContext context,List<VolunteerModel> vol) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          "User",
          style: TextStyle(
              color: kred, fontSize: 35, fontFamily: 'CentraleSansRegular'),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Profile",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 32,
                  fontFamily: 'CentraleSansRegular',
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        Divider(
          height: 4,
          thickness: 2,
        ),
        SizedBox(height: 10,),
        vol[0].pay == "1"? SizedBox() : Row(

          children: [

            Image.asset("assets/wrong.gif", height: 50, width: 50 ),

            Text("This Month Payment is Pending",style: TextStyle(fontSize: 18), ),

          ],

        ),
        vol[0].pay == "1"? SizedBox() :  ElevatedButton(onPressed: () async {


          // final paymentMethod =
          //     await Stripe.instance.createPaymentMethod(PaymentMethodParams.card());


          // launch("https://pmny.in/lrUxi6efvkST");

paymentOnline(vol[0]);

        }, child: Text("PAY NOW",style: TextStyle(fontSize: 10),),


          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kred.withOpacity(0.6),

        ),
        ),
        ),

        Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
            enabled: false,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: kblackcolor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: kred, width: 3)),
              icon: Icon(
                Icons.email,
                color: kpurple,
              ),
              contentPadding: EdgeInsets.all(11.25),
              hintText: vol[0].email,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            style: TextStyle(color: kpurple),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
            enabled: false,
            controller: phoneController,
            cursorColor: kblackcolor,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: kred, width: 3)),
              icon: Icon(
                Icons.phone_iphone_outlined,
                color: kpurple,
              ),
              contentPadding: EdgeInsets.all(11.25),
              hintText: vol[0].number,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            style: TextStyle(color: kpurple),
            onChanged: (value) {
              setState(() {
                phone = value;
              });
            },
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
            enabled: false,
            controller: nameController,
            cursorColor: kblackcolor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: kred, width: 3)),
              icon: Icon(
                Icons.person,
                color: kpurple,
              ),
              contentPadding: EdgeInsets.all(11.25),
              hintText: vol[0].name,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            style: TextStyle(color: kpurple),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
            enabled: false,
            controller: passwordController,
            obscureText: true,
            cursorColor: kblackcolor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: kred, width: 3)),
              icon: Icon(
                Icons.lock,
                color: kpurple,
              ),
              contentPadding: EdgeInsets.all(11.25),
              hintText: vol[0].password,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            style: TextStyle(color: kpurple),
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
            enabled: false,
            controller: countryController,
            cursorColor: kblackcolor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: kred, width: 3)),
              icon: Icon(
                Icons.map,
                color: kpurple,
              ),
              contentPadding: EdgeInsets.all(11.25),
              hintText: vol[0].country,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            style: TextStyle(color: kpurple),
            onChanged: (value) {
              setState(() {
                country = value;
              });
            },
          ),
        ),
        SizedBox(height: 10,),
        Center(
          child: Container(
            width: Get.width * 0.5,
            child: ElevatedButton(
              onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              //Return bool
               prefs.setBool('loggedin',false);

               Get.offAll(Login());

            }, child: Text("LOGUT",style: TextStyle(fontSize: 14),),


              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kgreybg.withOpacity(0.6),

                ),
              ),
            ),
          ),
        ),
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: 60,
        //   margin: EdgeInsets.only(top: 20, left: 30, right: 30),
        //   child: ElevatedButton(
        //     style: ButtonStyle(
        //       backgroundColor: MaterialStateProperty.all<Color>(
        //         kred,
        //       ),
        //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //         RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(30),
        //         ),
        //       ),
        //     ),
        //     onPressed: () {
        //       if (
        //           phone != null &&
        //           phone != ""&& name != null &&
        //               name != ""&& email != null &&
        //               email != ""&& password != null &&
        //               password != ""&&  country != null &&
        //               country != "") {
        //
        //       } else {
        //         Get.snackbar("ERROR", "PLEASE CHECK DETAILS AGAIN",
        //             backgroundColor: kredcolor,
        //             snackPosition: SnackPosition.BOTTOM);
        //       }
        //     },
        //     child: Text("SAVE CHANGES",
        //         style: TextStyle(
        //           color: kwhite,
        //           fontSize: 17,
        //         )),
        //   ),
        // ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Future<void> confirmPayment() async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment succesfully completed'),
        ),
      );
    } on Exception catch (e) {
      if (e is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unforeseen error: ${e}'),
          ),
        );
      }
    }
}


  Future paymentOnline(VolunteerModel vol) async {
    print("clicked");


    // create some billingdetails
    final billingDetails = BillingDetails(
      email: 'email@stripe.com',
      phone: '+48888000888',
      address: Address(
        city: 'Houston',
        country: 'US',
        line1: '1459  Circle Drive',
        line2: '',
        state: 'Texas',
        postalCode: '77063',
      ),
    ); //

    var userGetURL = Uri.parse("https://api.stripe.com/v1/payment_intents");


    var response = await http.post(userGetURL,

      body: {

          'amount': '38000',
          'currency': 'inr',
          'payment_method_types[]':'card',
          'description':"Donations by ${vol.email}"

      },

      headers: {
      'Authorization' : 'Bearer $rskeys',
        'Content-Type': 'application/x-www-form-urlencoded'
      }

    );

    print("paymentResponse ${response.body}");

    paymentIntentData =  jsonDecode(response.body);

    await Stripe.instance.initPaymentSheet(

        paymentSheetParameters: SetupPaymentSheetParameters(


            paymentIntentClientSecret: paymentIntentData['client_secret'],
            applePay: true,
            googlePay: true,
            style: ThemeMode.light,
            // merchantCountryCode: 'US',
            merchantDisplayName: 'Nazir Care Foundation',
            // billingDetails: billingDetails,
            // customerId: paymentIntentData['customer'],
            // customerEphemeralKeySecret: paymentIntentData['ephemeralKey']

        ));

         await  displaySheet();

  }

  Future displaySheet()async {

    try{


      await Stripe.instance.presentPaymentSheet(

        parameters: PresentPaymentSheetParameters(clientSecret: paymentIntentData['client_secret'],confirmPayment:true));

      // await Stripe.instance.confirmPaymentSheetPayment();

    // await confirmPayment();

      setState(() {
        paymentIntentData = null;
      });

      await AllApi().updatepayment(widget.uid);
      Get.snackbar("Updated", "Payment");
      print("Success");



    } on StripeException catch(e){

      Get.snackbar("Error", e.toString() );

    }

  }


}
