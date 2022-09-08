import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kro/Model/kroModel.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/PinDetails.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/AddMoney/SelectBank.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/AddMoney/successAdded.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/SendMoney/PaymentSuccess.dart';
import 'package:kro/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Helper/dbHelper.dart';
import '../../../../Model/userModel.dart';

class newcontactscreen extends StatefulWidget {
  const newcontactscreen({Key? key}) : super(key: key);

  @override
  _newcontactscreenState createState() => _newcontactscreenState();
}

class _newcontactscreenState extends State<newcontactscreen> {

  double balance=0.04;
  bool freezit=false;
  TextEditingController name=TextEditingController();
  TextEditingController sortcode=TextEditingController();
  TextEditingController accountnumber=TextEditingController();
  TextEditingController surname=TextEditingController();
  SharedPreferences? prefs;
  var user;

  String ID="";

  final dbHelper = DatabaseHelper.instance;
  List<UserModel> userdata = [];

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
      ID=user['id'].toString();

    });

    print(user['name']);
  }



  void _insert() async {


    Map<String, dynamic> row = {
      'name':name.text.toString(),
      'accountno':accountnumber.text.toString(),
      'surname':surname.text.toString(),
      'sortcode':sortcode.text.toString(),
      'senderid':ID.toString()

    };
    KroModel user = KroModel.fromMap(row);
    try {
      final id = await dbHelper.insertKro(user);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        dismissDirection: DismissDirection.up,
        content: Text("Kro Member Added"),
      ));
      Navigator.pop(context,true);
    }catch(e){
      print(e.toString());
    }

  }
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
                          "New Contact",
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
                        const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sender details",
                              style: TextStyle(
                                  fontSize: height * 0.027,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45),
                            ),
                        SizedBox(height:20,),
                        Text(
                          "First Name",
                          style: TextStyle(color:secondryColor),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          child: TextField(
                           controller:name,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'e.g Harry',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              contentPadding: EdgeInsets.all(16),
                              fillColor: Color(0xfff6f5f5),
                            ),
                          ),
                        ),
                            SizedBox(height:20,),
                            Text(
                              "Surname",
                              style: TextStyle(color:secondryColor),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Container(
                              child: TextField(
                                controller:surname,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'e.g Walter',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(16),
                                  fillColor: Color(0xfff6f5f5),
                                ),
                              ),
                            ),


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
                        padding:
                        const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bank details",
                              style: TextStyle(
                                  fontSize: height * 0.027,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45),
                            ),
                            SizedBox(height:20,),
                            Text(
                              "Sort Code",
                              style: TextStyle(color:secondryColor),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Container(
                              child: TextField(
                                controller:sortcode,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'e.g 23-33-44',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,

                                  contentPadding: EdgeInsets.all(16),
                                  fillColor: Color(0xfff6f5f5),
                                ),
                              ),
                            ),
                            SizedBox(height:20,),
                            Text(
                              "Account Number",
                              style: TextStyle(color:secondryColor),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Container(
                              child: TextField(
                                controller:accountnumber,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'e.g 12345678',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(16),
                                  fillColor: Color(0xfff6f5f5),
                                ),
                              ),
                            ),


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
                         if(name.text.toString()!="" && surname.text.toString()!="" &&sortcode.text!=""&&accountnumber.text!="")

                           {
                             if(accountnumber.text.toString().length==8 &&sortcode.text.toString().length==6 )
                             {
                               _insert();
                             }
                             else{
                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                 dismissDirection: DismissDirection.up,
                                 content: Text("Account No must be 8 digits & SortCode must be 6 digits"),
                               ));
                             }




                           }
                         else{

                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                             dismissDirection: DismissDirection.up,
                             content: Text("Incorrect Credentials"),
                           ));
                         }



                        },
                        child:Text(
                          "Save Contact",
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
