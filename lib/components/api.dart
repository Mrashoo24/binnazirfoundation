import 'dart:convert';

import 'package:binnazirfoundation/components/model.dart';
import 'package:http/http.dart' as http;
import 'package:php_serializer/php_serializer.dart';

import 'constants.dart';



class AllApi {

  Future<List<UrgentCasesModel>> getUrgentCases () async {

  var userGetURL = Uri.parse("${URL}urgentcases.php");

  var response = await http.get(userGetURL);

  List list = json.decode(response.body);
  //
  // print(response.body);

  Iterable<UrgentCasesModel> newList = list.map((e) {
    return UrgentCasesModel().fromJson(e);
  });

  List<UrgentCasesModel> a = newList.toList();
  //
  // print(phpDeserialize(a[0].image));


  return a;


  }

  Future<List<UrgentCasesModel>> getCasesById (String catid) async {

    var userGetURL = Uri.parse("${URL}causes.php?id=$catid");

    var response = await http.get(userGetURL);

    List list = json.decode(response.body);
    //
    // print(response.body);

    Iterable<UrgentCasesModel> newList = list.map((e) {
      return UrgentCasesModel().fromJson(e);
    });

    List<UrgentCasesModel> a = newList.toList();
    //
    // print(phpDeserialize(a[0].image));


    return a;


  }

  Future<List<CategoryModel>> getCategory() async {

    var userGetURL = Uri.parse("${URL}category.php");

    var response = await http.get(userGetURL);

    List list = json.decode(response.body);

    print(response.body);

    Iterable<CategoryModel> newList = list.map((e) {

      return CategoryModel().fromJson(e);

    });

    List<CategoryModel> a = newList.toList();


    return a;


  }



}