
import 'package:auto_animated/auto_animated.dart';
import 'package:binnazirfoundation/components/common.dart';
import 'package:binnazirfoundation/components/constants.dart';
import 'package:binnazirfoundation/screens/cases/cases.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'categfories/category.dart';

class Explore extends StatelessWidget {


  // Build animated item (helper for all examples)





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(kscafpadding),
          child: Column(
            children: <Widget>[
              Container(
                height: Get.height*0.16,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[

                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(LineAwesomeIcons.search,
                      color: kred,
                      size: 30,),
                    ),

                    Text(
                      "Explore",
                       style: TextStyle(
                                color: kred,
                                fontSize: 35,
                                fontFamily: 'CentraleSansRegular'),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    Text(
                      "Categories",
                       style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 32,
                                fontFamily: 'CentraleSansRegular',
                                fontWeight: FontWeight.w300),
                    ),

                    InkWell(
                      onTap: (){
                        Get.to(CategoryPage());
                      },
                      child: Text(
                        "View All",
                         style: TextStyle(
                                  color: kpurple.withOpacity(0.8),
                                  fontSize: 20,
                                  fontFamily: 'CentraleSansRegular',
                                  fontWeight: FontWeight.w100),
                      ),
                    ),

                      ],
                    )
                  ],
                ),
              ),
              Divider(height: 4,thickness: 2,),
              Container(
                height: 50,
                child:
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                      buildCatCard2("Education","assets/ed.png"),
                    buildCatCard2("Humanity","assets/hum.png"),
                    buildCatCard2("Nature","assets/nat.png"),
                    buildCatCard2("Medicine","assets/med.png"),

                  ],
                ),
              ),

              Divider(height: 4,thickness: 2,),

              SizedBox(height: 20,),

              Text(
                "Urgent Cases",
                style: TextStyle(
                    color: kblackcolor,
                    fontSize: 35,
                    fontFamily: 'CentraleSansRegular'),
              ),

              LiveList.options(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                options: options,

                // Like ListView.builder, but also includes animation property
                itemBuilder: (
                    BuildContext context,
                    int index,
                    Animation<double> animation,
                ) {
                  return animatedWidget(animation, ListofCases());
                },

                // Other properties correspond to the
                // `ListView.builder` / `ListView.separated` widget
                scrollDirection: Axis.vertical,
                itemCount: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCatCard2(String title , String img) {
    return InkWell(
      onTap: (){
        Get.to(Cases(cat: title,));
      },
      child: Card(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 30),
                            child: Row(
                              children: [
                                Image.asset(img,width: 50,),
                                SizedBox(width: 10,),
                                Text(title,style: TextStyle(letterSpacing: 2),)

                              ],
                            ),
                          ),
                        ),
                      ),
    );
  }

}