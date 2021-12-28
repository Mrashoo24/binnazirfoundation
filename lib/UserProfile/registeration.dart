import 'package:binnazirfoundation/components/constants.dart';
import 'package:binnazirfoundation/components/model.dart';
import 'package:binnazirfoundation/login.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Registeration extends StatefulWidget {
  const Registeration({Key key}) : super(key: key);

  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  bool showPassword = false;

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

  bool payment = false;

  Future getPayment() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var value = pref.getBool("payment") ?? false;

    return value;
  }


  @override
  void initState() {
    super.initState();
    getPayment().then((value) {
      print("payment $value");
      setState(() {
        payment = value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,automaticallyImplyLeading: true,actionsIconTheme: IconThemeData(color: kred),iconTheme: IconThemeData(color: kred),),

      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kscafpadding),
          child: Center(child: buildRegisterColumn(context)

              // buildRegisterColumn(context),
              ),
        ),
      ),
    );
  }

  Column buildRegisterColumn(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          "Volunteer",
          style: TextStyle(
              color: kred, fontSize: 35, fontFamily: 'CentraleSansRegular'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Registration",
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
        payment
            ? SizedBox() :   Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
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
              hintText: "Email",
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
        payment
            ? SizedBox() :   Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
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
              hintText: "Phone Number",
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
        payment
            ? SizedBox() :    Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
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
              hintText: "User Name",
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
        payment
            ? SizedBox() :    Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
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
              hintText: "User Password",
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
        payment
            ? SizedBox() :   InkWell(
          onTap: (){
            showCurrencyPicker(
              context: context,
              showFlag: true,
              showCurrencyName: true,
              showCurrencyCode: true,
              onSelect: (Currency currency) {
                print('Select currency: ${currency.name}');
                setState(() {
                  country = currency.name;
                });
              },
              favorite: ['INR'],
            );
          },
              child: Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
            enabled: false,
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
                hintText: country == null ? "Country" : country,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              style: TextStyle(color: kpurple),
          ),
        ),
            ),
        payment
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      kred,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (phone != null &&
                        phone != "" &&
                        name != null &&
                        name != "" &&
                        email != null &&
                        email != "" &&
                        password != null &&
                        password != "" &&
                        country != null &&
                        country != "") {

                      await launch("https://pmny.in/lrUxi6efvkST");

                    } else {
                      Get.snackbar("ERROR", "PLEASE CHECK DETAILS AGAIN",
                          backgroundColor: kredcolor,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  child: Text("Pay Membership Fee Now",
                      style: TextStyle(
                        color: kwhite,
                        fontSize: 17,
                      )),
                ),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      kred,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: () async {

                    if (phone != null &&
                        phone != "" &&
                        name != null &&
                        name != "" &&
                        email != null &&
                        email != "" &&
                        password != null &&
                        password != "" &&
                        country != null &&
                        country != "") {
                      await allapi
                          .setVolunteer(VolunteerModel(
                              name: name,
                              country: country,
                              password: password,
                              email: email,
                              status: "1",
                              pay:"0",
                              number: phone))
                          .then((value) async {
                        if (value == "User has been updated!") {


                          Get.snackbar("Your Form is Submitted",
                              "Login and Please Pay the Monthly Membership Fee For More Info Contact Us");

                                Get.offAll(Login());
                          //  SharedPreferences pref = await SharedPreferences.getInstance();
                          //   pref.setBool("payment", true);
                          // setState(() {
                          //   payment = true;
                          // });
                          //
                        }
                        {
                          Fluttertoast.showToast(msg: "Something Went Wrong");
                        }
                      });
                    } else {
                      Get.snackbar("ERROR", "PLEASE CHECK DETAILS AGAIN",
                          backgroundColor: kredcolor,
                          snackPosition: SnackPosition.BOTTOM);
                    }

                  },
                  child: Text("SAVE CHANGES",
                      style: TextStyle(
                        color: kwhite,
                        fontSize: 17,
                      )),
                ),
              ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
