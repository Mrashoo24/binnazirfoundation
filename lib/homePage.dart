
import 'package:binnazirfoundation/Favourites/favorite.dart';
import 'package:binnazirfoundation/Notification/notification.dart';
import 'package:binnazirfoundation/UserProfile/user.dart';
import 'package:binnazirfoundation/ZakatCalculator/zakatcalc.dart';
import 'package:binnazirfoundation/about/contactus.dart';
import 'package:binnazirfoundation/screens/explore.dart';
import 'package:binnazirfoundation/screens/heart.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'components/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  var selectedColor = kpurple;
  var unselectedcolor = Colors.grey;



  List<Widget> _children = [
    Heart(),
    Explore(),
    FavoriteCases(),
    NotifcationScreen(),
    UserProfile( ),
    ContactUs(),
    ZakatCalculator(),
    Container(),
  ];

  void onTabTapped(int index){
    setState(() {
     _currentIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      key: scafKey,
      drawer: buildSideBar(),
      bottomNavigationBar: buildBNB(),
      body: Stack(
          children:[
            _children[_currentIndex],
            Positioned(
                top: Get.height*0.01,
                left: Get.width*0.01,
                child: IconButton(
                  onPressed: (){
                    scafKey.currentState.openDrawer();
                  },
                  icon:Icon(FontAwesomeIcons.bars),color:
                _currentIndex == 0 ? kwhite:kred,)
            ),

          ]
      ),
    );
  }

  Widget buildBNB() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 75,
      width: double.infinity,
// double.infinity means it cove the available width
      decoration: BoxDecoration(
        color: kwhite,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -7),
            blurRadius: 33,
            color: kwhite.withOpacity(0.11),
          ),
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildIconButton(0,FontAwesomeIcons.heart),
            buildIconButton(1,FontAwesomeIcons.home),
            buildIconButton(2,FontAwesomeIcons.heart),
            buildIconButton(3,FontAwesomeIcons.bell),
            buildIconButton(4,FontAwesomeIcons.user),
          ]
      ),
    );
  }

  IconButton buildIconButton(int index,IconData icon) {
    return IconButton(
      onPressed: (){
        setState(() {
          setState(() {
            _currentIndex = index;
          });
        }
        );
      },
            icon:Icon(icon,
              size:24,
              color: _currentIndex == index ? selectedColor :unselectedcolor,
            ),

          );


  }

  Widget buildSideBar(){
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child:  Container(
                margin: EdgeInsets.only(top: 12),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kwhite,
                ),
                child: Container(
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Image.asset("assets/logo.webp"),
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: kwhite,
            ),
          ),
          buildListTile("Your Donations",FontAwesomeIcons.heart,0),
          buildListTile("Home",FontAwesomeIcons.home,1),
          buildListTile("Beloved Cases",FontAwesomeIcons.heart,2),
          buildListTile("Notifications",FontAwesomeIcons.bell,3),
          buildListTile("Profile",FontAwesomeIcons.user,4),
          buildListTile("Contact us",FontAwesomeIcons.phone,5),
          buildListTile("ZakatCalculator",FontAwesomeIcons.calculator,6),
          buildListTile("About Nazir Foundation",FontAwesomeIcons.leaf,7),
          buildListTile("Invite a friend",FontAwesomeIcons.peopleCarry,8),
          buildListTile("Rate the app",FontAwesomeIcons.star,9),
          SizedBox(height: 10,)
        ],
      ),
    );
  }

  ListTile buildListTile(String title,IconData icon,index) {
    return ListTile(
          leading: Icon(
            icon,
            size:24,
            color: _currentIndex == index ? selectedColor :unselectedcolor,
          ),
          title: Text(title,style: TextStyle(color: _currentIndex == index ? selectedColor :unselectedcolor,),),
          onTap: () => {

          index == 8 || index == 9 ?  Fluttertoast.showToast(msg: "Next update") :  setState(() {
              setState(() {
                _currentIndex = index;
                Get.back();
              });
            }

            )

          },
        );
  }
}