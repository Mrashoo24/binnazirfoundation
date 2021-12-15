
import 'package:binnazirfoundation/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final String catid;
  const CategoryPage({Key key, this.catid}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Category"),backgroundColor: kred,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kscafpadding),
          child: Center(
            child: Wrap(
              children: [
                  buildCatCard("Education","assets/ed.png"),
                buildCatCard("Humanity","assets/hum.png"),
                buildCatCard("Nature","assets/nat.png"),
                buildCatCard("Med","assets/med.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card buildCatCard(String title,String img) {
    return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width:80,
                          height:50,
                          child: Image.asset(img),
                        ),
                        Text(title)
                      ],
                    ),
                  ),
                ),
              );
  }
}
