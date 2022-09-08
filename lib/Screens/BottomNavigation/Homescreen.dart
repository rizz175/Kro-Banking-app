import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/ManageCard.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/SendMoney/Send_kro_List.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/alltransactions.dart';
import 'package:kro/Screens/Widgets/secondryButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Helper/dbHelper.dart';
import '../../Model/TransactionModel.dart';
import '../../Model/userModel.dart';
import '../../constants.dart';
import 'HomeSection/AddMoney/AddMoney.dart';
import 'HomeSection/TransactionDetail.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
SharedPreferences? prefs;
var user;

String myname="";

final dbHelper = DatabaseHelper.instance;
List<UserModel> userdata = [];
List<TransactionModel>translist=[];
String balance="0.00";
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
      String id=user['id'].toString();
      _gettrans(id);
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
      balance=userdata[0].balance.toString();
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
void _gettrans(String id) async {

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
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child:Column(
        children: [

          Stack(
            clipBehavior:Clip.none,
            children: [
              Container(
                  height:height*0.26,
                  color:primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      Text("Hi ${myname.split(' ').first}!",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w800,
                          fontSize:height*0.03,letterSpacing:1),)
                     , GestureDetector(
                          onTap:(){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    manageCard(),
                              ),
                            );
                          },
                       child: Container(
                          height:height*0.045,
                          width:50,

                          decoration: BoxDecoration(
                            color:Colors.white70.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(Icons.credit_card_rounded,color:secondryColor,size:height*0.03
                            ,),
                        ),
                     )
                    ],),
                  )),
              Container(
                margin:  EdgeInsets.only(left:20,top:height*0.18,right:20),


                width:width,
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  color:Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0,0), // changes position of shadow
                    ),
                  ],
                ),

           child:Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical:17),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("Your Balance",style:TextStyle(fontSize: height*0.023,letterSpacing:0.5),),
                      InkWell(
                         onTap:(){

                           getuserData();
                         },

                          child: Icon(Icons.refresh,color:secondryColor,))
                   ],
                 )
             ,SizedBox(height:5,),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text("\£${double.parse(balance).toStringAsFixed(2)}",style:TextStyle(fontSize: height*0.05,letterSpacing:0.5,fontWeight:FontWeight.w500),),

                   ],
                 ),
                 SizedBox(height:20,),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Container(
                       height:height*0.05,

                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15)),
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(primary:secondryColor),
                         onPressed:(){

                           Navigator.push(
                               context,
                               new MaterialPageRoute(
                                   builder: (context) =>
                                       sendkrolist()));
                         },
                         child:Row(
                           children: [
                             Text(
                               "Send",
                               style: TextStyle(color:Colors.white, fontSize:height*0.022),
                             ),SizedBox(width:10,),
                             Icon(Icons.send)
                           ],
                         ),
                       ),
                     ),SizedBox(width:20,),
                     Container(
                       height:height*0.05,

                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15)),
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(primary:secondryColor),
                         onPressed:(){



                           Navigator.push(
                               context,
                               new MaterialPageRoute(
                                   builder: (context) =>
                                       addMoney())).then((value) { setState(() {
                           getuserData();
                           });});
                         },
                         child:Row(
                           children: [
                             Text(
                               "Add",
                               style: TextStyle(color:Colors.white, fontSize: height*0.022),
                             ),SizedBox(width:10,),
                             Icon(Icons.add_circle)
                           ],
                         ),
                       ),
                     )

                   ],
                 )
               ],
             ),
           ),

              )

            ],
          ),

          Container(
            margin: const EdgeInsets.only(left:20,top:20,right:20),


            width:width,
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(10),
              color:Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.06),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0,0), // changes position of shadow
                ),
              ],
            ),

            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical:17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Transactions",style:TextStyle(fontSize: height*0.03,letterSpacing:0.5,fontWeight:FontWeight.w600,color:secondryColor),)
                  ,SizedBox(height:8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recent",style:TextStyle(fontSize: height*0.02,letterSpacing:0.5,fontWeight:FontWeight.w500),),
                      GestureDetector(
                          onTap:(){


                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        alltransactions()));
                          },
                          child: Text("See All",style:TextStyle(fontSize: height*0.02,letterSpacing:0.5,fontFamily:"Aerial",color:secondryColor),)),

                    ],
                  ),
                  ListView.builder(
                    shrinkWrap:true,

                      itemCount:translist.length>3?3:translist.length,
                      itemBuilder:(context,index)
                  {

                    return ListTile(

                      onTap:(){

                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    transactionDetail(translist[index])));
                      },
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
                      subtitle: Text(translist[index].reference.toString(),style:TextStyle(fontSize:12),),
                      trailing:Text("\£${double.parse(translist[index].amount.toString()).toStringAsFixed(2)}",style:TextStyle(fontWeight:FontWeight.bold,fontSize:14),),

                    );
                  }
                  )

                ],
              ),
            ),

          )


        ],
      ),
    );
  }

}
