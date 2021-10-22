import 'package:binnazirfoundation/components/common.dart';
import 'package:binnazirfoundation/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cases extends StatefulWidget {
  final String cat;
  const Cases({Key key, this.cat}) : super(key: key);

  @override
  _CasesState createState() => _CasesState();
}

class _CasesState extends State<Cases> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:Text(widget.cat),backgroundColor: kred,),
        body: ListView(
          children: [
          ListofCases(),
          ListofCases(), ListofCases(),
            ListofCases(),
            ListofCases(),
          ],
        ),
      ),
    );
  }
}
