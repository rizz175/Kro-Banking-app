import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kro/Model/kroModel.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/AddMoney/ChooseAmount.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/PinDetails.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/SendMoney/NewContact.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/SendMoney/sendamount.dart';
import 'package:kro/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Helper/dbHelper.dart';

class sendkrolist extends StatefulWidget {
  const sendkrolist({Key? key}) : super(key: key);

  @override
  _sendkrolistState createState() => _sendkrolistState();
}

class _sendkrolistState extends State<sendkrolist> {
  TextEditingController search = TextEditingController();
  SharedPreferences? prefs;
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

  var user;
  List<KroModel>searchlist=[];
  List<KroModel>krolist=[];
  Future<void> getfilterdata(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              const newcontactscreen(),
        ));
    log(result.toString());

    if (result.toString() != null) {
      getuserData();
    }
  }

  void _runFilter(String enteredKeyword) {
    List<KroModel> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = krolist;
    } else {
      results =krolist
          .where((user) => user.name.toString().contains(enteredKeyword))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      searchlist = results;
    });
  }

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

    final allRows = await dbHelper.getKrolist(id);
    krolist.clear();
    searchlist.clear();
    allRows.forEach((row) => krolist.add(KroModel.fromMap(row)));

    print("User data"+krolist.length.toString());

    if(krolist.length>0)
    {

      setState(() {
       searchlist=krolist;

       searchlist.sort((a, b) => a.name!.toLowerCase().toString().compareTo(b.name!.toLowerCase().toString()));

      });
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

  bool freezit=false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Send",
                    style: TextStyle(
                        fontSize: height * 0.025, fontWeight: FontWeight.w600,letterSpacing:1),
                  ),
                  const Text("          "),
                ],
              ),
              const SizedBox(height:20,),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),

                ),
                margin: const EdgeInsets.symmetric(horizontal:5, vertical: 10),
                child: TextField(
                    controller: search,
                    onChanged: (v) => _runFilter(v),
                    decoration: InputDecoration(


                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        fillColor:Colors.white,
                        filled: true,
                        hintText: "Search",
                        hintStyle:const TextStyle(fontSize: 18, color: Colors.black54),

                        prefixIcon: GestureDetector(
                            onTap: () {
                              // showDatePicker(context: context, initialDate: , firstDate: firstDate, lastDate: lastDate)
                            },
                            child: const Icon(
                              Icons.search,
                              color: Colors.black45,
                              size: 24,
                            )))),
              ),const SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kroo contacts",
                    style: TextStyle(
                        fontSize: height * 0.029,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                  GestureDetector(
                    onTap:(){
                      getfilterdata(context);
                    },
                    child: Text(
                      "New",
                      style: TextStyle(
                          fontSize: height * 0.027,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400,
                          color: secondryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:10,),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal:5, vertical: 10),

                    decoration:BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.circular(10),


              ),
                      child: searchlist.length != 0
                          ? ListView.builder(
                          itemCount: searchlist.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),

                              child: ListTile(
                                  onTap: () {
                                    // log("id"+searchlist[index].id.toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                             sendAmount(searchlist[index]),
                                        ));
                                  },


                                leading: Stack(
                                  clipBehavior: Clip.none,
                                  children: [Container(

                                    height:height*0.07,
                                    width:55,

                                    decoration: BoxDecoration(
                                        color:secondryColor,
                                        shape:BoxShape.circle),
                                    child:Center(child: Text("${searchlist[index].name.toString().substring(0,1)}",style:TextStyle(
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
                                  title: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.85,
                                          child: Text(
                                              "${searchlist[index].name} ${searchlist[index].surname}",
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  overflow: TextOverflow
                                                      .ellipsis)))),
                                  subtitle:Text("${_addDashes(searchlist[index].sortcode.toString())} . ${searchlist[index].accountno.toString()}"),

                              ),
                            );
                          }):const Center(
                        child:Text("No Contact",style:TextStyle(color:Colors.black54),),
                      )
                  ))
                          // : userlist.length > 0
                          // ? Center(child: Text("No Customer Found"))
                          // : Center(child: Text(""))))



            ],
          ),
        ),
      ),
    );
  }
}
