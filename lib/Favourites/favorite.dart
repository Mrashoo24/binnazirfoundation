import 'package:auto_animated/auto_animated.dart';
import 'package:binnazirfoundation/components/common.dart';
import 'package:binnazirfoundation/components/constants.dart';
import 'package:binnazirfoundation/components/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class FavoriteCases extends StatefulWidget {
  const FavoriteCases({Key key}) : super(key: key);

  @override
  _FavoriteCasesState createState() => _FavoriteCasesState();
}

class _FavoriteCasesState extends State<FavoriteCases> {
  @override
  Widget build(BuildContext context) {
    allapi.getBelovedCases();
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: allapi.getBelovedCases(),
          builder: (context, snapshot) {



            if(!snapshot.hasData){
              if(snapshot.hasError){

                Fluttertoast.showToast(msg: "Something Went Wrong ");

              }
              return preloader;

            }

            if(snapshot.hasError){

              Fluttertoast.showToast(msg: "Something Went Wrong ");

            }

            List urgentcaselist= snapshot.requireData ;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(kscafpadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                //   Align(
                //   alignment: Alignment.centerRight,
                //   child: Icon(LineAwesomeIcons.search,
                //     color: kred,
                //     size: 30,),
                // ),
              SizedBox(height: 50,),
                Text(
                  "Beloved",
                  style: TextStyle(
                      color: kred,
                      fontSize: 35,
                      fontFamily: 'CentraleSansRegular'),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Cases",
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
                      child:urgentcaselist.length == 0 ? Text("You can add any cases to Favourite List") : LiveList.options(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        options: options,

                        // Like ListView  .builder, but also includes animation property
                        itemBuilder: (
                            BuildContext context,
                            int index,
                            Animation<double> animation,
                            ) {
                          return animatedWidget(animation, ListofCases(urgentcase: urgentcaselist[index],),);
                        },

                        // Other properties correspond to the
                        // `ListView.builder` / `ListView.separated` widget
                        scrollDirection: Axis.vertical,
                        itemCount: urgentcaselist.length,
                      )

                    )
                ]
      ),
              ),
            );
          }
        )
    )
    );
  }
}
