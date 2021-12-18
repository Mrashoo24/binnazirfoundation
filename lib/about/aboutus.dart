import 'package:binnazirfoundation/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
              "About",
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

          Expanded(
            child: ListView(

              children: [
                Text(
                  "Nazir Care, a Nonprofit Organisation situated in BKC, Mumbai, is more than just trust; it is an idea, a belief, and an oath taken by us to change the life of those in need and make this world a better place to live. We have taken it upon us to serve the needful and make them feel accepted into the society they deemed to have lost. We cannot fight this battle alone; We need warriors, donors, and members to support us. In this fight for humanity, we call you to help us serve this nation's poor, backward class and achieve our combined dream of equality in India. Let's take an oath together to make India a better place for every human being by any and every means possible. Let's come together and answer this cry for help by donating through our online website nazircare.com or Nazir Care app. Those who give others are always bigger, prosperous, and happy. Let's make India a better place for everyone. Contribute and watch this world turn a little bit better for everybody. Let's together put a smile on these sad faces and cherish this moment forever. We at Nazir Care thank everyone who donates through us in charity; even if you think about donating, you have already made a change in this world. Feel free to contact us on nazircare.com or navigate through our app Nazir Care for more information.",
                  style: GoogleFonts.slabo27px(
                      color: kgreybg,

                      fontSize: 20),
                ),
              ],
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
