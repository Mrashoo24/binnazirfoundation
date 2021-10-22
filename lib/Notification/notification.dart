import 'package:auto_animated/auto_animated.dart';
import 'package:binnazirfoundation/Notification/notificationcard.dart';
import 'package:binnazirfoundation/components/common.dart';
import 'package:binnazirfoundation/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class NotifcationScreen extends StatefulWidget {
  const NotifcationScreen({Key key}) : super(key: key);

  @override
  _NotifcationScreenState createState() => _NotifcationScreenState();
}

class _NotifcationScreenState extends State<NotifcationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(kscafpadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(LineAwesomeIcons.search,
                          color: kred,
                          size: 30,),
                      ),

                      Text(
                        "Important",
                        style: TextStyle(
                            color: kred,
                            fontSize: 35,
                            fontFamily: 'CentraleSansRegular'),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Notification",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 32,
                                fontFamily: 'CentraleSansRegular',
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      Divider(height: 4,thickness: 2,),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child:  LiveList.options(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          options: options,

                          // Like ListView.builder, but also includes animation property
                          itemBuilder: (
                              BuildContext context,
                              int index,
                              Animation<double> animation,
                              ) {
                            return animatedWidget(animation, NotificationCard(),);
                          },

                          // Other properties correspond to the
                          // `ListView.builder` / `ListView.separated` widget
                          scrollDirection: Axis.vertical,
                          itemCount: 10,
                        )
                        //
                        // ListView(
                        //   physics: NeverScrollableScrollPhysics(),
                        //   shrinkWrap: true,
                        //   children: <Widget>[
                        //
                        //     NotificationCard(),
                        //
                        //
                        //   ],
                        // ),
                      )
                    ]
                ),
              ),
            )
        )
    );
  }
}
