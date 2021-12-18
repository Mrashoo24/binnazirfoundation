
import 'package:binnazirfoundation/components/constants.dart';
import 'package:binnazirfoundation/components/model.dart';
import 'package:binnazirfoundation/screens/cases/cases.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  final String catid;
  final List<CategoryModel> catList;
  const CategoryPage({Key key, this.catid, this.catList}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Category"),backgroundColor: kred,),
      body: Padding(
        padding: EdgeInsets.all(kscafpadding),
        child: Center(
          child: GridView.builder(
              itemCount: widget.catList.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 1), itemBuilder: (context,index){
            return  buildCatCard(widget.catList[index].name,"assets/nat.png",widget.catList[index].id);
          })

        ),
      ),
    );
  }

  Widget buildCatCard(String title,String img,String catid) {
    return InkWell(
      onTap: (){

        Get.to(Cases(cat: title,catid:catid));

      },
      child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width:80,
                            height:50,
                            child: Image.asset(img),
                          ),
                          Text(title,textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
