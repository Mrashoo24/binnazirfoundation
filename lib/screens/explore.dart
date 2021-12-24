
import 'dart:io';

import 'package:auto_animated/auto_animated.dart';
import 'package:binnazirfoundation/UserProfile/registeration.dart';
import 'package:binnazirfoundation/components/common.dart';
import 'package:binnazirfoundation/components/constants.dart';
import 'package:binnazirfoundation/components/model.dart';
import 'package:binnazirfoundation/login.dart';
import 'package:binnazirfoundation/screens/cases/cases.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'categfories/category.dart';

class Explore extends StatefulWidget {
  final String userid;

  const Explore({Key key, this.userid}) : super(key: key);
  // Build animated item (helper for all examples)





  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
ScrollController scrollController = ScrollController();
bool viewAppBar = true;
List<UrgentCasesModel> urgentCases = [] ;
String search ;

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding:  EdgeInsets.all(kscafpadding),
          child: FutureBuilder(
            future: Future.wait([allapi.getUrgentCases(),  allapi.getCategory(),]),
            builder: (context, snapshot) {


              if(!snapshot.hasData){

                return preloader;

              }

              if(snapshot.hasError){

                Fluttertoast.showToast(msg: "Something Went Wrong ");

              }

              List<UrgentCasesModel>  urgentcaselist= snapshot.requireData[0] ;
              List<CategoryModel>  catlist= snapshot.requireData[1] ;

              return Column(
                children: <Widget>[

                  SizedBox(height: 40,),
                  Container(
                    height: Get.height*0.22,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[

                       Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              widget.userid == "Guest" ?    ElevatedButton(onPressed: (){

                                Get.to(Registeration());

                              }, child: Text("BECOME A VOLUNTEER",style: TextStyle(fontSize: 10),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kred.withOpacity(0.6)
                              ),
                              ),
                              ): SizedBox(height: 50,),

                              // InkWell(
                              //   onTap: (){
                              //
                              //
                              //   },
                              //   child: Icon(LineAwesomeIcons.search,
                              //   color: kred,
                              //   size: 30,),
                              // ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: kred,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: kred.withOpacity(0.6), width: 3)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: kred.withOpacity(0.6), width: 3)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: kred.withOpacity(0.6), width: 3)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: kred, width: 3)),
                                      suffixIcon: Icon(
                                        Icons.search,
                                        color: kred,
                                      ),
                                      contentPadding: EdgeInsets.all(11.25),
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                    style: TextStyle(color: kpurple),
                                    onChanged: (value) {
                                      setState(() {
                                        search = value.removeAllWhitespace;

                                        setState(() {

                                          urgentCases = urgentcaselist.where((element) => element.name.toLowerCase().contains(value.removeAllWhitespace.toLowerCase() ?? "")).toList();

                                        });
                                        print(urgentCases );
                                      });
                                    },
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ) ,

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
                            Get.to(CategoryPage(catList:catlist));
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
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: catlist.length,
                      itemBuilder:(context,index){
                       return buildCatCard2(catlist[index].name, "assets/nat.png",catlist[index].id,);
              }
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
                          return animatedWidget(animation, ListofCases(urgentcase: search == null || search.toString().isBlank ? urgentcaselist[index] : urgentCases[index]));
                        },

                        // Other properties correspond to the
                        // `ListView.builder` / `ListView.separated` widget
                        scrollDirection: Axis.vertical,
                        itemCount: search == null || search.toString().isBlank ? urgentcaselist.length : urgentCases.length,
                      )
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  Widget buildCatCard2(String title , String img,String catid) {
    return InkWell(
      onTap: (){
        Get.to(Cases(cat: title,catid:catid));
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