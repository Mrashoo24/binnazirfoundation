
import 'package:adr_in_app_review/adr_in_app_review.dart';
import 'package:binnazirfoundation/Favourites/favorite.dart';
import 'package:binnazirfoundation/Notification/notification.dart';
import 'package:binnazirfoundation/UserProfile/user.dart';
import 'package:binnazirfoundation/ZakatCalculator/zakatcalc.dart';
import 'package:binnazirfoundation/about/contactus.dart';
import 'package:binnazirfoundation/screens/explore.dart';
import 'package:binnazirfoundation/screens/heart.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'about/aboutus.dart';
import 'components/constants.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  final String userId;


  const HomePage({Key key, this.userId}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  var selectedColor = kred;
  var unselectedcolor = Colors.grey;

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null && initialMessage.data['order'] == 'order') {
      Get.to(MyApp());
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['type'] == 'home') {
        Get.to(MyApp());
      }
    });
  }

  @override
  void initState() {

    firebaseMessaging.requestPermission(
        alert: true, badge: true, provisional: true, sound: true);

    setupInteractedMessage();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  channel.description,
                  icon: 'grocerylogo',
                  sound: RawResourceAndroidNotificationSound('notification'),
                  // other properties...
                  importance: channel.importance,
                  priority: Priority.max
              ),
            ));
      }
    });



    super.initState();
  }




  void onTabTapped(int index){
    setState(() {
     _currentIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {


    List<Widget> _children = [

      // Heart(),
      Explore( userid: widget.userId),
      FavoriteCases(),
      NotifcationScreen(),
      UserProfile( userid: widget.userId),
      ContactUs(),
      ZakatCalculator(),
      AboutUs(),

    ];

    return SafeArea(
      child: Scaffold(
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
                  kred,)
              ),

            ]
        ),
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
            // buildIconButton(0,FontAwesomeIcons.book),
            buildIconButton(0,FontAwesomeIcons.home),
            buildIconButton(1,FontAwesomeIcons.heart),
            buildIconButton(2,FontAwesomeIcons.bell),
            buildIconButton(3,FontAwesomeIcons.user),
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
              child:  Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 1),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kwhite,
                    ),
                    child: Container(
                      child: Image.asset("assets/logo.webp"),
                    ),
                  ),
                  Text("NAZIR CARE FOUNDATION")
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: kwhite,
            ),
          ),
          // buildListTile("Your Donations",FontAwesomeIcons.book,0),
          buildListTile("Home",FontAwesomeIcons.home,0),
          buildListTile("Beloved Cases",FontAwesomeIcons.heart,1),
          buildListTile("Notifications",FontAwesomeIcons.bell,2),
          buildListTile("Profile",FontAwesomeIcons.user,3),
          buildListTile("Contact us",FontAwesomeIcons.phone,4),
          buildListTile("ZakatCalculator",FontAwesomeIcons.calculator,5),
          buildListTile("About Nazir Care Foundation",FontAwesomeIcons.leaf,6),
          buildListTile("Invite a friend",FontAwesomeIcons.peopleCarry,7),
          buildListTile("Rate the app",FontAwesomeIcons.star,8),
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
          onTap: () async => {

          index == 7  ?  await FlutterShare.share(
          title: 'Help The Needy People Give Your Zakaat,Sadqa and Other Donations through Nazir Care Foundation..we care',
          text: 'Help The Needy People Give Your Zakaat,Sadqa and Other Donations through Nazir Care Foundation..we care',
          linkUrl: 'https://nazircare.com',
          chooserTitle: 'Example Chooser Title'
          ) :index == 8 ?  Future.microtask(() async {
          AdrInAppReview.startInAppReview()
              .then((value) => print('result $value'))
              .catchError((e) {
          print(e.toString());
          // only to avoid crash when error happened and not being handled
          });
          }) :  setState(() {
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