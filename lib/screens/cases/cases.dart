import 'package:auto_animated/auto_animated.dart';
import 'package:binnazirfoundation/components/common.dart';
import 'package:binnazirfoundation/components/constants.dart';
import 'package:binnazirfoundation/components/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cases extends StatefulWidget {
  final String cat,catid;
  const Cases({Key key, this.cat, this.catid}) : super(key: key);

  @override
  _CasesState createState() => _CasesState();
}

class _CasesState extends State<Cases> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:Text(widget.cat),backgroundColor: kred,),
        body: FutureBuilder(
          future: Future.wait([allapi.getCasesById(widget.catid)]),
          builder: (context, snapshot) {

            if(!snapshot.hasData){

              return Center(child:Image.asset("assets/preloader.png",width: 100,height: 100,));

            }

            if(snapshot.hasError){

              Fluttertoast.showToast(msg: "Something Went Wrong ");

            }

            List<UrgentCasesModel>  urgentcaselist= snapshot.requireData[0] ;



            return  LiveList.options(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              options: options,

              // Like ListView.builder, but also includes animation property
              itemBuilder: (
                  BuildContext context,
                  int index,
                  Animation<double> animation,
                  ) {
                return animatedWidget(animation, ListofCases(urgentcase: urgentcaselist[index],));
              },

              // Other properties correspond to the
              // `ListView.builder` / `ListView.separated` widget
              scrollDirection: Axis.vertical,
              itemCount: urgentcaselist.length,
            );
          }
        ),
      ),
    );
  }
}
