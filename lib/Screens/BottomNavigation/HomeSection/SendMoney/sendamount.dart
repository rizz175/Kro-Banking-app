import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/PinDetails.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/AddMoney/SelectBank.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/AddMoney/successAdded.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/SendMoney/ReviewScreen.dart';
import 'package:kro/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Helper/dbHelper.dart';
import '../../../../Model/userModel.dart';

class sendAmount extends StatefulWidget {
 var member;


 sendAmount(this.member);

  @override
  _sendAmountState createState() => _sendAmountState();
}

class _sendAmountState extends State<sendAmount> {
  String _addDashes(String text) {
    const int addDashEvery = 2;
    String out = '';

    for (int i = 0; i < text.length; i++) {
      if (i + 1 > 2 && i % 2 == 0) {
        out += '-';
      }

      out += text[i];
    }

    return out;
  }

  SharedPreferences? prefs;
  var user;



  final dbHelper = DatabaseHelper.instance;
  List<UserModel> userdata = [];
  double balance=0;


  String reference="Sent From Kroo";
  bool freezit=false;

  TextEditingController number=TextEditingController();

  String firstLetter="";
  @override
  void initState() {
    firstLetter=widget.member.name.toString().substring(0,1);

    getuserData();
  }

  getuserData()
  async
  {
    prefs = await SharedPreferences.getInstance();


    String? encodedMap = await prefs!.getString('userdata');
    user= json.decode(encodedMap!);
    setState(() {

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
      });
      print("My Balance"+userdata[0].balance.toString());

    }


  }







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
                          "Bank Transfer",
                          style: TextStyle(
                              fontSize: height * 0.025, fontWeight: FontWeight.w600,letterSpacing:1),
                        ),
                        const Text("          "),
                      ],
                    ),
                    const SizedBox(height:20,),





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
                              leading: Stack(
                                clipBehavior: Clip.none,
                                children: [Container(

                                  height:height*0.07,
                                  width:55,

                                  decoration: BoxDecoration(
                                      color:primaryColor,
                                      shape:BoxShape.circle),
                                  child:Center(
                                      child: Text("$firstLetter",style:TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      overflow: TextOverflow
                                          .ellipsis),)),
                                ),
                                  Positioned(
                                    bottom:-1,right:-3,
                                    child: CircleAvatar(
                                      backgroundColor:Colors.white,
                                      radius:12,
                                      child: Icon(Icons.account_balance,color:secondryColor,size:height*0.026
                                        ,),
                                    ),
                                  )
                                ]
                                    ,

                              ),
                              title:Text("${widget.member.name} ${widget.member.surname}",  style: TextStyle(
                                  fontSize: height * 0.027,

                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87)),
                              subtitle:Text("${_addDashes(widget.member.sortcode.toString())} . ${widget.member.accountno.toString()}"),



                            )

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
                        const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [

                                Text("\£",style:TextStyle(
                                    fontWeight:FontWeight.w400,color:Colors.black,
                                    fontSize: height*0.06
                                )),
                                Container(
                                  width:width*0.6,
                                  child: TextField(
 controller:number,
                                    autofocus: true,
                                    style:TextStyle(
                                        fontWeight:FontWeight.w400,color:Colors.black,
                                        fontSize: height*0.06
                                    ),
                                    keyboardType:TextInputType.numberWithOptions(decimal:true),
                                    decoration:InputDecoration(
                                      border:InputBorder.none,
                                      focusedBorder:InputBorder.none,
                                      hintText:"0",
                                      hintStyle:TextStyle(
                                          fontWeight:FontWeight.w400,color:Colors.black38,
                                          fontSize: height*0.06
                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height:10,),
                            Row(

                              children: [
                                Text("Balance:",style:TextStyle(
                                    fontWeight:FontWeight.w400,color:Colors.black45,
                                    fontSize: height*0.024
                                )),const SizedBox(width:10,),
                                Text("\£${balance.toStringAsFixed(2)}",style:TextStyle(
                                    fontWeight:FontWeight.w400,color:Colors.black45,
                                    fontSize: height*0.024
                                )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      child: TextField(
 onChanged:(s){
   setState(() {

     reference=s;
   });
 },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Reference: Sent from Kroo',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height:30,), Container(
                      height:height*0.07,
                      width:width,


                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary:secondryColor),
                        onPressed:(){
                          double getblance=double.parse(number.text.toString());

                          if(getblance<=balance)
                            {

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ReviewScreen(widget.member,reference,getblance.toString())));
                            }
                          else{

                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              dismissDirection: DismissDirection.up,
                              content: Text("Insufficent Balance"),
                            ));
                          }


                        },
                        child:Text(
                          "Send",
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
