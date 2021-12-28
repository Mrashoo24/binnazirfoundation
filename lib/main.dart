import 'package:binnazirfoundation/homePage.dart';
import 'package:binnazirfoundation/screens/Slider/slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'components/constants.dart';
import 'components/splashscreenMY.dart';
import 'login.dart';

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     'This channel is used for important notifications.', // description
//     importance: Importance.max,
//     playSound: true,
//     sound: RawResourceAndroidNotificationSound('notification'),
//     enableLights: true);

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();

Future<void> firebaseMessgaingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();

  pref.setString("title", message.notification.title);
  pref.setString("desc", message.notification.body);

  pref.setStringList(
      "notifications", [message.notification.title, message.notification.body]);

  print("a message bg : ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(firebaseMessgaingBackgroundHandler);
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //     AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(

    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,

  );

  Stripe.publishableKey = "pk_live_51K9pBSSInPgXpYUdR7ZOlKhn8JpEQiGLWxkywTFPQ6clBXy2Zj68FygbV9VT3mJW1LntSFCBKRrmJIGUuRwwjTw700zMb986RC";
await Stripe.instance.applySettings();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  var isloggedin = false;

  var id = "null";
  var uid = "null";

  Future getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool('loggedin') ?? false;
    String id = prefs.getString("userid") ?? "null";
    String uid = prefs.getString("uid") ?? "null";
    print("boolvalue $boolValue");
    print("id $id");
    return [boolValue, id,uid];
  }

  @override
  void initState() {
    getBoolValuesSF().then((value) {
      setState(() {
        isloggedin = value[0];
        id = value[1];
        uid = value[2];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kred,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(fontFamily: "CentraleSansRegular"),
          headline2:
              TextStyle(color: Colors.black, fontFamily: "CentraleSansRegular"),
          headline3:
              TextStyle(color: Colors.black, fontFamily: "CentraleSansRegular"),
          headline4:
              TextStyle(color: Colors.black, fontFamily: "CentraleSansRegular"),
          headline5:
              TextStyle(color: Colors.black, fontFamily: "CentraleSansRegular"),
          headline6:
              TextStyle(color: Colors.black, fontFamily: "CentraleSansRegular"),
          subtitle1:
              TextStyle(color: Colors.black, fontFamily: "CentraleSansRegular"),
          subtitle2:
              TextStyle(color: Colors.black, fontFamily: "CentraleSansRegular"),
          bodyText1:
              TextStyle(color: Colors.black, fontFamily: "CentraleSansRegular"),
          bodyText2:
              TextStyle(color: Colors.black, fontFamily: "CentraleSansRegular"),
          caption:
              TextStyle(color: Colors.black, fontFamily: "CentraleSansRegular"),
          overline:
              TextStyle(color: Colors.black, fontFamily: "CentraleSansRegular"),
        ),
      ),
      home: SplashScreenMy(
        duration: 18000,
        imageSrc: "assets/logov.gif",
        text: "NAZIR FOUNDATION",
        colors: [Colors.white],
        textType: TextType1.ScaleAnimatedText,
        textStyle: GoogleFonts.cabin(
            fontSize: 30, color: kgreybg, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        navigateRoute: id != "null"
            ? HomePage(
                userId: id,uid:uid

              )
            : isloggedin
                ? Login()
                : StartSlider(),

      ),
    );
  }
}
