import 'dart:convert';

import 'package:binnazirfoundation/components/model.dart';
import 'package:http/http.dart' as http;
import 'package:php_serializer/php_serializer.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


  Future setBelovedCases(List urgentCaseList) async {
     SharedPreferences pref = await SharedPreferences.getInstance();


        print("gotListonapi = $urgentCaseList");

     pref.setStringList("caselist", urgentCaseList);


  }




  Future getBelovedCases() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    //
    // print("getBeloved = ${pref.getString("caselist")}");

List decodedlist =    jsonDecode(pref.getStringList("caselist").toString());



    var newList = decodedlist == null ? [] : decodedlist.map((e) {
      print(e);
      return UrgentCasesModel().fromJson(e);
    }).toList();

    return newList;


  }

  Future setNotification(List notifications) async {

    SharedPreferences pref = await SharedPreferences.getInstance();


    print("notifications = $notifications");

    pref.setStringList("notifications", notifications);


  }

  Future getNotifications() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    //
    // print("getBeloved = ${pref.getString("caselist")}");

    var not = pref.getStringList("notifications") ?? [];

    List decodedlist =    jsonDecode(not.toString());

    // var newList = decodedlist.map((e) {
    //   print(e);
    //   return UrgentCasesModel().fromJson(e);
    // }).toList();

    return decodedlist;


  }


  Future setVolunteer (VolunteerModel volunteermodel) async {

    var userGetURL = Uri.parse("${URL}add-volunteers.php");

    var response = await http.post(userGetURL,
    body: {
     'number': volunteermodel.number,
      'status': volunteermodel.status,
      'email': volunteermodel.email,
      'password':  volunteermodel.password,
      'country':  volunteermodel.country,
      'name': volunteermodel.name
    }
    );


     print("addedVolunteer ${response.body}");




    return jsonDecode(response.body);


  }


  Future<List<VolunteerModel>> getVolunteer(String id) async {

    var userGetURL = Uri.parse("${URL}login.php?id=$id");

    var response = await http.get(userGetURL);

    List list = json.decode(response.body);

    print(response.body);

    Iterable<VolunteerModel> newList = list.map((e) {

      return VolunteerModel().fromJson(e);

    });

    List<VolunteerModel> a = newList.toList();


    return a;


  }

  Future updateToken(String id,String token) async {
    print("token $token");
    var userGetURL = Uri.parse("${URL}updatetoken.php?user=$id&token=$token");

    var response = await http.post(userGetURL,body: {
      "user":id,"token":token
    });

    var list = json.decode(response.body);




    return list;


  }




}