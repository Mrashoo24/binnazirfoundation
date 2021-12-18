import 'package:binnazirfoundation/components/constants.dart';
import 'package:binnazirfoundation/screens/categfories/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kscafpadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 50,),
            Text(
              "Contact",
              style: TextStyle(
                  color: kred,
                  fontSize: 35,
                  fontFamily: 'CentraleSansRegular'),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Us",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 32,
                      fontFamily: 'CentraleSansRegular',
                      fontWeight: FontWeight.w300),
                ),

              ],
            ),
    Divider(height: 4,thickness: 2,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 19),
                    child: Text(
                      "Email",
                      style: GoogleFonts.slabo27px(
                          color: kgreybg,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                InkWell(
                  onTap: (){

                    launch("mailto:smith@example.org?subject=News&body=New%20plugin");

                  },
                  child: Container(

                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "help@nazircare.com",
                        style: TextStyle(color: kred),

                      )),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Follow Us:",
                      style: GoogleFonts.slabo27px(
                          color: kgreybg.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 15),
                  child: Center(
                    child: Wrap(
                      children: [
                        buildInkWell(FontAwesomeIcons.facebook,"https://www.facebook.com/Nazircare-100648252490451/"),
                        SizedBox(
                          width: 30,
                        ),
                        buildInkWell(FontAwesomeIcons.instagram,"https://www.instagram.com/nazircare/"),
                        SizedBox(
                          width: 30,
                        ),
                        // buildInkWell(FontAwesomeIcons.youtube,""),
                        // SizedBox(
                        //   width: 30,
                        // ),
                        // buildInkWell(FontAwesomeIcons.snapchatGhost,""),
                        // SizedBox(
                        //   width: 30,
                        // ),
                        // buildInkWell(FontAwesomeIcons.twitter,""),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: kblackcolor.withOpacity(0.5),
              thickness: 2,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  child: RichText(

                    text: TextSpan(
                      children: [

                        TextSpan(
                            text:" AN International",style: TextStyle(color: kredcolor)
                        )
                      ],
                      text: "Developed By:",
                      style: TextStyle(color: kblackcolor)
                    ),


                  )

              ),
            ),
            Divider(
              color: kwhite.withOpacity(0.5),
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }

  InkWell buildInkWell(IconData icon,url) {
    return InkWell(
      onTap: () {
         launch(url);
      },
      child: Icon(
        icon,
        size: 30,
      ),
    );
  }
}
