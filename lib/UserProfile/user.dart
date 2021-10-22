import 'package:binnazirfoundation/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool showPassword = false;

  TextEditingController emailController ;

  TextEditingController passwordController ;

  TextEditingController nameController ;
  TextEditingController phoneController ;


  String email  ;

  String password ;

  String name ;
  String phone ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kscafpadding),
          child: Center(
            child: buildRegisterColumn(context),
          ),
        ),
      ),
    );
  }


  Column buildRegisterColumn(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Align(
          alignment: Alignment.centerRight,
          child: Icon(LineAwesomeIcons.search,
            color: kred,
            size: 30,),
        ),

        Text(
          "User",
          style: TextStyle(
              color: kred,
              fontSize: 35,
              fontFamily: 'CentraleSansRegular'),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Profile",
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
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
            controller:  emailController,
            cursorColor: kblackcolor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color:  kblackcolor.withOpacity(0.6), width: 3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kred, width: 3)),
              icon: Icon(
                Icons.email,
                color: kpurple,
              ),
              contentPadding: EdgeInsets.all(11.25),
              hintText:  "Email",
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            style: TextStyle(color: kpurple),
            onChanged: (value){
              setState(() {
                email = value;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
            controller:  emailController,
            cursorColor: kblackcolor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color:  kblackcolor.withOpacity(0.6), width: 3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kred, width: 3)),
              icon: Icon(
                Icons.phone_iphone_outlined,
                color: kpurple,
              ),
              contentPadding: EdgeInsets.all(11.25),
              hintText:  "Phone Number",
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            style: TextStyle(color: kpurple),
            onChanged: (value){
              setState(() {
                email = value;
              });
            },
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
            controller:  emailController,
            cursorColor: kblackcolor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color:  kblackcolor.withOpacity(0.6), width: 3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kred, width: 3)),
              icon: Icon(
                Icons.person,
                color: kpurple,
              ),
              contentPadding: EdgeInsets.all(11.25),
              hintText:  "User Name",
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            style: TextStyle(color: kpurple),
            onChanged: (value){
              setState(() {
                email = value;
              });
            },
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
            controller:  emailController,
            cursorColor: kblackcolor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color:  kblackcolor.withOpacity(0.6), width: 3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kred, width: 3)),
              icon: Icon(
                Icons.person,
                color: kpurple,
              ),
              contentPadding: EdgeInsets.all(11.25),
              hintText:  "User Name",
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            style: TextStyle(color: kpurple),
            onChanged: (value){
              setState(() {
                email = value;
              });
            },
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
          child: TextField(
            controller:  emailController,
            cursorColor: kblackcolor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kblackcolor.withOpacity(0.6), width: 3)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color:  kblackcolor.withOpacity(0.6), width: 3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kred, width: 3)),
              icon: Icon(
                Icons.map,
                color: kpurple,
              ),
              contentPadding: EdgeInsets.all(11.25),
              hintText:  "Country",
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            style: TextStyle(color: kpurple),
            onChanged: (value){
              setState(() {
                email = value;
              });
            },
          ),
        ),
        // FutureBuilder<SharedPreferences>(
        //     future: SharedPreferences.getInstance(),
        //     builder: (context, snapshot) {
        //       if(!snapshot.hasData){
        //         return SizedBox();
        //       }
        //       var shData = snapshot.requireData.get("phone");
        //       return Container(
        //         margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
        //         child: TextField(
        //           controller: shData== null ? phoneController : TextEditingController(text: shData) ,
        //           cursorColor: Colors.white.withOpacity(0.4),
        //           decoration: InputDecoration(
        //             enabledBorder: UnderlineInputBorder(
        //               borderSide: BorderSide(
        //                 color: Color.fromRGBO(90, 90, 90, 1),
        //               ),
        //             ),
        //             icon: Icon(Icons.lock, color: Colors.white),
        //             contentPadding: EdgeInsets.all(11.25),
        //             hintText:  widget.lan == "en" ||
        //                 widget.lan == null
        //                 ? "Phone Number"
        //                 : "رقم الهاتف",
        //             hintStyle: TextStyle(
        //               color: Colors.white.withOpacity(0.4),
        //             ),
        //           ),
        //           style: TextStyle(color: kblue),
        //           onChanged: (value){
        //             setState(() {
        //               phone = value;
        //             });
        //           },
        //         ),
        //       );
        //     }
        // ),


        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          margin: EdgeInsets.only(top: 20, left: 30, right: 30),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                kred,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            onPressed: () {
              if(!emailController.value.text.isEmpty && emailController.value.text.isEmail && nameController.value.text != "" && phone != null && phone != ""
              ){
                // /
              }else{
                Get.snackbar("ERROR", "PLEASE CHECK DETAILS AGAIN",backgroundColor: kredcolor,snackPosition: SnackPosition.BOTTOM);
              }
            },
            child: Text("SAVE CHANGES",style:TextStyle(
              color: kwhite,
              fontSize: 17,

            )),
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}
