import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kro/Model/TransactionModel.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/AddMoney/ChooseAmount.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/PinDetails.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/TransactionDetail.dart';
import 'package:kro/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Helper/dbHelper.dart';

class alltransactions extends StatefulWidget {
  const alltransactions({Key? key}) : super(key: key);

  @override
  _alltransactionsState createState() => _alltransactionsState();
}

class _alltransactionsState extends State<alltransactions> {
  SharedPreferences? prefs;
  var user;
  List<TransactionModel>translist=[];

  final dbHelper = DatabaseHelper.instance;
  @override
  void initState() {
    getuserData();
  }

  getuserData()
  async
  {
    prefs = await SharedPreferences.getInstance();


    String? encodedMap = await prefs!.getString('userdata');
    user= json.decode(encodedMap!);
    setState(() {

      String email=user['id'].toString();
      _getdata(email);
    });

    print(user['name']);
  }
  void _getdata(String id) async {

    final allRows = await dbHelper.getTRANslist(id);

    translist.clear();
    setState(() {
      allRows.forEach((row) => translist.add(TransactionModel.fromMap(row)));
      translist=translist.reversed.toList();
    });

    print("User data"+translist.length.toString());

    if(translist.length>0) {

    }

    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     dismissDirection: DismissDirection.up,
    //     content: Text("Incorrect Credentials"),
    //   ));
    // }
  }

  bool freezit=false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(
                          Icons.arrow_back,
                          color: secondryColor,
                        ),
                      ),
                    ),
                    Text(
                      "Your Transactions",
                      style: TextStyle(
                          fontSize: height * 0.025, fontWeight: FontWeight.w600,letterSpacing:1),
                    ),
                    const Text("          "),
                  ],
                ),
                const SizedBox(height:20,),



                Container(
                  margin: const EdgeInsets.only(left: 0, top: 20, right: 0),
                  padding: const EdgeInsets.only(left: 0, top: 10,bottom:10),
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.06),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Transactions",style:TextStyle(fontSize: height*0.03,letterSpacing:0.5,fontWeight:FontWeight.w600,color:secondryColor),)
                        ,const SizedBox(height:8,),
                        
                        ListView.builder(
                            shrinkWrap:true,
                            physics:const NeverScrollableScrollPhysics(),
                            itemCount:translist.length,
                            itemBuilder:(context,index)
                            {

                              return ListTile(
                                onTap:(){

                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                             transactionDetail(translist[index])));
                                },minVerticalPadding: 10,
                                leading: Container(
                                  height:height*0.06,
                                  width:55,

                                  decoration: BoxDecoration(
                                      color:secondryColor.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(Icons.account_balance,color:Colors.white,size:height*0.030
                                    ,),
                                ),
                                title:Text("To ${translist[index].r_name.toString()}",style:TextStyle(fontSize:15)),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(translist[index].date.toString(),style:TextStyle(fontSize:12)),
                                    Text(translist[index].reference.toString(),style:TextStyle(fontSize:12)),

                                  ],
                                ),
                                trailing:Text("\£${double.parse(translist[index].amount.toString()).toStringAsFixed(2)}",style:TextStyle(fontWeight:FontWeight.bold,fontSize:15),),


                              );
                            }
                        )

                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
