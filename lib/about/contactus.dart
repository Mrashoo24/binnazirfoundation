import 'package:binnazirfoundation/components/constants.dart';
import 'package:binnazirfoundation/screens/categfories/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

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

            Align(
              alignment: Alignment.centerRight,
              child: Icon(LineAwesomeIcons.search,
                color: kred,
                size: 30,),
            ),

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
                          color: kpurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Info@binnazir.com",
                      style: TextStyle(color: Colors.blue),
                    )),
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
                          color: kpurple.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                ),
                SizedBox(height: 10,),
                Center(
                  child: Wrap(
                    children: [
                      buildInkWell(FontAwesomeIcons.facebook),
                      SizedBox(
                        width: 30,
                      ),
                      buildInkWell(FontAwesomeIcons.instagram),
                      SizedBox(
                        width: 30,
                      ),
                      buildInkWell(FontAwesomeIcons.youtube),
                      SizedBox(
                        width: 30,
                      ),
                      buildInkWell(FontAwesomeIcons.snapchatGhost),
                      SizedBox(
                        width: 30,
                      ),
                      buildInkWell(FontAwesomeIcons.twitter),
                    ],
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

  InkWell buildInkWell(IconData icon) {
    return InkWell(
      onTap: () {
        // launch('https://www.facebook.com/' + "Zaika-Pizza-Hub-114019143801563");
      },
      child: Icon(
        icon,
        size: 50,
      ),
    );
  }
}
