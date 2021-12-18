import 'package:binnazirfoundation/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';


class ZakatCalculator extends StatefulWidget {
  const ZakatCalculator({Key key}) : super(key: key);

  @override
  _ZakatCalculatorState createState() => _ZakatCalculatorState();
}

class _ZakatCalculatorState extends State<ZakatCalculator> {
  bool selectedasset = true;
  TextEditingController cashController = TextEditingController();
  TextEditingController goldController = TextEditingController();
  TextEditingController silverController = TextEditingController();
  TextEditingController propertyController = TextEditingController();
  TextEditingController personalexpenseController = TextEditingController();
  TextEditingController debtController = TextEditingController();

  String cash = "0";
  String gold = "0";
  String silver = "0";
  String property = "0";
  String personalexpense = "0";
  String debt = "0";

  String incomes = "0";

  String expenses = "0";

  String totalBalance = "0";

  TextEditingController goldValueC = TextEditingController();
  TextEditingController silverValueC = TextEditingController();

  String goldCurrency = "0";

  String silverCurrency = "0";

  String zakaat = "0";

  @override
  Widget build(BuildContext context) {

    incomes = "0";

    incomes = (double.parse(cash) +
            double.parse(gold) +
            double.parse(silver) +
            double.parse(property))
        .toString();

    expenses = "0";

    expenses = (double.parse(personalexpense) + double.parse(debt)).toString();

    totalBalance = (double.parse(incomes) - double.parse(expenses)).toString();

    String goldValue = (7.5 * double.parse(goldCurrency)).toString();

    String silverValue = (52.52 * double.parse(silverCurrency)).toString();

    print(
        "income = $incomes expense = $expenses total blance = $totalBalance zakat = $zakaat");

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kscafpadding),
          child: Column(
            children: <Widget>[
              Container(
                height: Get.height * 0.16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        LineAwesomeIcons.search,
                        color: kred,
                        size: 30,
                      ),
                    ),
                    Text(
                      "Zakat",
                      style: TextStyle(
                          color: kred,
                          fontSize: 35,
                          fontFamily: 'CentraleSansRegular'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Calculator",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 32,
                              fontFamily: 'CentraleSansRegular',
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                height: 4,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedasset = true;
                        zakaat == "0";

                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kblackcolor),
                            color: selectedasset ? kred : kwhite),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "With Gold",
                            style: TextStyle(
                                fontSize: 22,
                                color: selectedasset ? kwhite : kblackcolor),
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedasset = false;
                        zakaat == "0";
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kblackcolor),
                            color: selectedasset ? kwhite : kred),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "With Silver",
                            style: TextStyle(
                                fontSize: 22,
                                color: selectedasset ? kblackcolor : kwhite),
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //For Gold
              selectedasset
                  ? Text(
                      "Enter Gold value in your currency",
                      style: TextStyle(
                          color: kred,
                          fontSize: 22,
                          fontFamily: 'CentraleSansRegular',
                          fontWeight: FontWeight.w300),
                    )
                  : Text(
                      "Enter Silver value in your currency",
                      style: TextStyle(
                          color: kred,
                          fontSize: 22,
                          fontFamily: 'CentraleSansRegular',
                          fontWeight: FontWeight.w300),
                    ),

              selectedasset
                  ? textField(
                      goldValueC,
                      "Enter Gold Value in your Currency /tola",
                      goldCurrency, (value) {
                      setState(() {
                        print(value);
                        value == "" ? goldCurrency = "0" : goldCurrency = value;
                      });
                    })
                  : textField(
                      silverValueC,
                      "Enter Silver Value in your Currency /tola",
                      silverCurrency, (value) {
                      setState(() {
                        print(value);

                        value == ""
                            ? silverCurrency = "0"
                            : silverCurrency = value;
                      });
                    }),
              Divider(thickness: 2,),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter Total Income",
                style: TextStyle(
                    color: kred,
                    fontSize: 22,
                    fontFamily: 'CentraleSansRegular',
                    fontWeight: FontWeight.w300),
              ),
              Wrap(
                children: [
                  textField(cashController, "Total Cash", cash, (value) {
                    setState(() {
                      print(value);
                      value == "" ? cash = "0" : cash = value;
                    });
                  }),
                  textField(goldController, "Total Gold Value", gold, (value) {
                    setState(() {
                      print(value);

                      value == "" ? gold = "0" : gold = value;
                    });
                  }),
                  textField(silverController, "Total Silver Value", silver,
                      (value) {
                    setState(() {
                      print(value);
                      value == "" ? silver = "0" : silver = value;
                    });
                  }),
                  textField(
                      propertyController, "Total Property Value", property,
                      (value) {
                    setState(() {
                      print(value);

                      value == "" ? property = "0" : property = value;
                    });
                  }),
                ],
              ),
              Text(
                "Total Income =$incomes",
                style: TextStyle(
                    color: kred,
                    fontSize: 22,
                    fontFamily: 'CentraleSansRegular',
                    fontWeight: FontWeight.w300),
              ),
              Divider(thickness: 2,),
              SizedBox(
                height: 10,
              ),
              //fon debit
              Text(
                "Enter Total Expense",
                style: TextStyle(
                    color: kred,
                    fontSize: 22,
                    fontFamily: 'CentraleSansRegular',
                    fontWeight: FontWeight.w300),
              ),
              Wrap(
                children: [
                  textField(personalexpenseController, "Total Personal Expense",
                      personalexpense, (value) {
                    setState(() {
                      print(value);
                      value == ""
                          ? personalexpense = "0"
                          : personalexpense = value;
                    });
                  }),
                  textField(debtController, "Total Debit Pending", debt,
                      (value) {
                    setState(() {
                      print(value);

                      value == "" ? debt = "0" : debt = value;
                    });
                  }),
                ],
              ),
              Text(
                "Total Expenses =$expenses",
                style: TextStyle(
                    color: kred,
                    fontSize: 22,
                    fontFamily: 'CentraleSansRegular',
                    fontWeight: FontWeight.w300),
              ),

              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kred)),
                  onPressed: () {
                    if (selectedasset) {
                      if (goldCurrency == "" || goldCurrency == "0") {
                        Fluttertoast.showToast(msg: "enter gold amount");
                      } else {
                        setState(() {
                          zakaat = selectedasset
                              ? ((double.parse(totalBalance) -
                                          double.parse(goldValue)) *
                                      0.025)
                                  .toString()
                              : "0";
                        });
                      }
                    } else {

                      if (silverCurrency == "" || silverCurrency == "0") {
                        Fluttertoast.showToast(msg: "enter silver amount");
                      } else {

                        setState(() {
                          zakaat = selectedasset
                              ? ((double.parse(totalBalance) -
                              double.parse(silverValue)) *
                              0.025)
                              .toString()
                              : "0";
                        });
                      }


                    }
                  },
                  child: Text("Calculate Now")),

             Row(
               children: [
                 Text("Zakat Payable =",style: TextStyle(fontSize: 20),),

                 double.parse(zakaat) <= 0 ?Text("Zakat Not Applicable",style: TextStyle(fontSize: 20),) : Text("$zakaat",style: TextStyle(fontSize: 30),),
               ],
             )
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(TextEditingController controller, String label, String title,
      Function function) {
    return Container(
      margin: EdgeInsets.only(top: 22.5, right: 22.5, left: 22.5),
      child: TextField(
        controller: controller,
        cursorColor: kblackcolor,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: kblackcolor.withOpacity(0.6), width: 3)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: kblackcolor.withOpacity(0.6), width: 3)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: kblackcolor.withOpacity(0.6), width: 3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: kred, width: 3)),
          contentPadding: EdgeInsets.all(11.25),
          hintText: label,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        keyboardType: TextInputType.number,
        style: TextStyle(color: kred),
        onChanged: function,
      ),
    );
  }

  String calc() {
    return incomes;
  }
}
