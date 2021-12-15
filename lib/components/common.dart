import 'package:binnazirfoundation/components/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:php_serializer/php_serializer.dart';

import 'constants.dart';

class ListofCases extends StatefulWidget {
  final UrgentCasesModel urgentcase;

  const ListofCases({Key key, this.urgentcase}) : super(key: key);

  @override
  _ListofCasesState createState() => _ListofCasesState();
}

class _ListofCasesState extends State<ListofCases> {
  TextEditingController priceController= TextEditingController();

  String selectedPrice = null;
  bool fav = false;




  @override
  Widget build(BuildContext context) {
    return buildListCase(context);
  }



  Widget buildListCase (BuildContext  context){

    RelativeRect buttonMenuPosition(BuildContext context) {
      final RenderBox bar = context.findRenderObject() as RenderBox;
      final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
      const Offset offset = Offset.zero;
      final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(
          bar.localToGlobal(bar.size.centerRight(offset),
              ancestor: overlay),
          bar.localToGlobal(
              bar.size.centerRight(offset)
              ,
              ancestor: overlay),
        ),
        offset & overlay.size,
      );
      return position;
    }


   var percent = (( double.parse(widget.urgentcase.raised) * 100) /  double.parse(widget.urgentcase.amount)).toDouble().toPrecision(1) /100;


    var image = phpDeserialize(widget.urgentcase.image)[0];
    return Column(
      children: [
        ListTile(
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(icon:Icon(Icons.more_vert), onPressed: () {
                  final RelativeRect position =
                  buttonMenuPosition(context);
                  showMenu(context: context, position: position, items: [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text('Download Documents'),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text('More Info'),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text('Add Notification'),
                    ),
                  ]);
                },),

                IconButton(icon: fav == true ? Icon(FontAwesomeIcons.solidHeart,color: kred,): Icon(FontAwesomeIcons.heart,), onPressed: () {
                  setState(() {

                  fav == true? fav=false:  fav = true;
                  });
                },
                ),
              ],
            ),
          ),
          leading: Image.network("${imageURL}$image"),
          title: Text(widget.urgentcase.name,
              style: TextStyle(
                  fontFamily: "CentraleSansRegular",
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              )),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("\$${widget.urgentcase.amount}",
                  style: TextStyle(
                    fontFamily: "CentraleSansRegular",
                    fontSize: 15,
                  )),
              SizedBox(height: 10,),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Donation Raised",style: TextStyle(
                  color: kred,fontWeight: FontWeight.w700
              ),
              )),
        ),
        Container(
          margin: EdgeInsets.only(left: 15,right: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: LinearPercentIndicator(
                  // width: MediaQuery.of(context).size.width*0.4,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2500,
                  percent:percent,
                  center: Text("\$ ${widget.urgentcase.raised}",style: TextStyle(color: kwhite,letterSpacing: 2),),
                  linearStrokeCap: LinearStrokeCap.roundAll ,
                  progressColor: Colors.green ,
                ),
              ),
              SizedBox(width: 10,),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kpurple)
                  ),
                  onPressed: (){
                    Get.isSnackbarOpen ? Get.back() : Get.snackbar("How Much You Want to Donate?","",
                        snackPosition: SnackPosition.BOTTOM,
                        isDismissible: true,
                        boxShadows: [
                          BoxShadow(
                              color:kblackcolor,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 10)

                          )
                        ],
                        duration: Duration(minutes: 10),
                        borderRadius: 30,
                        backgroundColor: kwhite,
                        titleText: StatefulBuilder(
                          builder:(context,setState1) {
                            return Column(
                              children: [
                                Container(
                                  child: Text(
                                    "How Much You Want to Donate?",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                buildcontainer("100",selectedPrice == "100" ? kpurple:kwhite,(){
                                  setState1(() {
                                    selectedPrice = "100";
                                  });
                                }),
                                SizedBox(
                                  height: 15,
                                ),
                                buildcontainer("500",selectedPrice == "500" ? kpurple:kwhite,(){
                                  setState1(() {
                                    selectedPrice = "500";
                                  });
                                }),
                                SizedBox(
                                  height: 15,
                                ),
                                buildcontainer("800",selectedPrice == "800" ? kpurple:kwhite,(){
                                  setState1(() {
                                    selectedPrice = "800";
                                  });
                                }),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("-------------- or --------------",style: TextStyle(letterSpacing: 5),),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 12),
                                    child: TextFormField(
                                      controller: priceController,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "CentraleSansRegular"),
                                      decoration: InputDecoration(
                                        prefixText: "\$",
                                        hintText: 'Enter Price Manually',
                                        filled: true,
                                        fillColor: Colors.white.withOpacity(.4),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: kblackcolor, width: 3)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: kblackcolor, width: 3)),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: kblackcolor, width: 3)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: kred, width: 3)),
                                        labelText: "Enter Price",
                                        labelStyle: TextStyle(
                                            color: Colors.black.withOpacity(.4),
                                            fontSize: 17,
                                            fontFamily: "CentraleSansRegular"),
                                      ),
                                      keyboardType: TextInputType.number,
                                      onChanged: (value){
                                        setState1(() {
                                          selectedPrice = value;
                                        });
                                      },
                                    ),

                                  ),
                                ),
                                Container(
                                  width:Get.width,
                                  child: ElevatedButton(onPressed: (){

                                  },
                                    child: Padding(
                                      padding:  EdgeInsets.all(20.0),
                                      child: Text(
                                          "Donate Now"
                                      ),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(kred)
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        )

                    );

                  }, child: Text("Donate Now",style: TextStyle(fontSize: 12),)
              )
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget buildcontainer(String price,color,state) {
    return InkWell(
      onTap: state,
      child: Container(

        width: Get.width,
        decoration: BoxDecoration(
            color:color,
            border: Border.all(color: kblackcolor),
            borderRadius:
            BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12.0, vertical: 12),
            child: Text(
              "\$$price",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }

}
