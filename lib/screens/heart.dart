
import 'package:binnazirfoundation/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Heart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: Get.height*0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100),bottomRight: Radius.circular(100)),
                  color: kred,
                ),

                child: Stack(
                  children: [
                    Container(
                        child: Opacity(

                            opacity: 0.4,
                            child: Image.asset("assets/leaf_1.png"))
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100),bottomRight: Radius.circular(100)),
                      child: Image(
                        height: Get.height*0.25,
                        alignment: Alignment.topCenter,
                        image: AssetImage("assets/hand_bg.png"),
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: Get.height *0.25,
                left: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Your Donations",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: "CentraleSansRegular",
                        )),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 380,
            height: 80,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff471a91), Color(0xff3cabff)],
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "THIS MONTH",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'CentraleSansRegular'),
                ),
                Text(
                  "\$32.20",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'CentraleSansRegular'),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Column(
          children: [
            buildCard("Zakat","45","12/08/2015"),
            buildCard("Zakat","45","12/08/2015"),
            buildCard("Zakat","45","12/08/2015"),
            buildCard("Zakat","45","12/08/2015"),
            buildCard("Zakat","45","12/08/2015"),  buildCard("Zakat","45","12/08/2015"),

          ],
          )
        ],
      ),
    );
  }

  Card buildCard(String title,String price,String date) {
    return Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                    Text(title,style: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
                      Text("\$$price",style: TextStyle(color:Colors.black),)
                  ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween
                  ),
                  Text("Date: $date")
                ],
              ),
            ),
          );
  }
}
