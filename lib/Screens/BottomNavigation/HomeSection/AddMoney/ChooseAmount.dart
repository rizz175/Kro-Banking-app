import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/PinDetails.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/AddMoney/SelectBank.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/AddMoney/successAdded.dart';
import 'package:kro/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Helper/dbHelper.dart';
import '../../../../Model/userModel.dart';

class chooseAmount extends StatefulWidget {
  const chooseAmount({Key? key}) : super(key: key);

  @override
  _chooseAmountState createState() => _chooseAmountState();
}

class _chooseAmountState extends State<chooseAmount> {
  SharedPreferences? prefs;
  var user;

  String myname="";

  final dbHelper = DatabaseHelper.instance;
  List<UserModel> userdata = [];
  double balance=22;
  double fieldbalance=0;
  TextEditingController number=TextEditingController();
  String Bankname="Kroo Bank";
  Future<void> getfilterdata(BuildContext context) async {
    final result = await  Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) =>
                chooseBank()));
    log(result.toString());

    if (result.toString() != "null") {
      setState(() {
        Bankname=result.toString();
      });
    }
  }
  var id;
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
      myname=user['name'];
      String email=user['email'];
      _getdata(email);
    });

    print(user['name']);
  }
  void _getdata(String email) async {

    final allRows = await dbHelper.getBalance(email);
    userdata.clear();
    allRows.forEach((row) => userdata.add(UserModel.fromMap(row)));

    print("User data"+userdata.length.toString());

    if(userdata.length>0)
    {

      setState(() {
         balance=double.parse(userdata[0].balance.toString());
         id=userdata[0].id;
      });
      print("My Balance"+userdata[0].balance.toString());
      //
      // prefs.setString('userdata', encodedMap);
      //
      // Navigator.pushReplacement(
      //     context,
      //     new MaterialPageRoute(
      //         builder: (context) =>
      //             MyHomePage()));
    }

    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     dismissDirection: DismissDirection.up,
    //     content: Text("Incorrect Credentials"),
    //   ));
    // }
  }


  Future<void> updateBalance()
  async {

    double total=balance+double.parse(number.text.toString());
    print("total$total");
    final res = await dbHelper.updateBalance(id,total);
    print(res);


  }
  bool freezit=false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
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
                          "Choose amount",
                          style: TextStyle(
                              fontSize: height * 0.025, fontWeight: FontWeight.w600,letterSpacing:1),
                        ),
                        Text("          "),
                      ],
                    ),
                    SizedBox(height:20,),



                    Container(
                      margin: const EdgeInsets.only(left: 0, top: 20, right: 0),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Row(
                             children: [

                               Text("\£",style:TextStyle(
                                   fontWeight:FontWeight.w400,color:Colors.black,
                                   fontSize: height*0.08
                               )),
                               Container(
                                 width:width*0.6,
                                 child: TextField(

                                controller:number,
autofocus: true,
                                   style:TextStyle(
                                       fontWeight:FontWeight.w400,color:Colors.black,
                                       fontSize: height*0.08
                                   ),
                                   keyboardType:TextInputType.number,
                                   decoration:InputDecoration(
                                     border:InputBorder.none,
                                     focusedBorder:InputBorder.none,
                                     hintText:"0",
                                     hintStyle:TextStyle(
                                       fontWeight:FontWeight.w400,color:Colors.black38,
                                       fontSize: height*0.08
                                     ),

                                   ),
                                 ),
                               ),
                             ],
                           ),
                            SizedBox(height:10,),

                          ],
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 0, top: 20, right: 0),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            ListTile(

                              horizontalTitleGap:10,
                              dense:true,
                              leading: Container(
                                height:height*0.055,
                                width:45,

                                decoration: BoxDecoration(
                                    color:primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(Icons.account_balance,color:Colors.white,size:height*0.030
                                  ,),
                              ),
                              title:Text("$Bankname",  style: TextStyle(
                                  fontSize: height * 0.029,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87)),
                              trailing:GestureDetector(
                                onTap:(){
                                 getfilterdata(context);
                                },
                                child: Text("Change",style: TextStyle(
                                    fontSize: height * 0.023,
                                    letterSpacing: 0.5,

                                    color: secondryColor)),
                              ),



                            )

                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [

                  SizedBox(height:20,), Container(
                  height:height*0.07,
                  width:width,


                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary:secondryColor),
                    onPressed:(){
                      updateBalance();

                      Navigator.pushReplacement(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                 successAdded()));
                    },
                    child:Text(
                      "Continue",
                      style: TextStyle(color:Colors.white, fontSize:height*0.029),
                    ),
                  ),
                )
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
