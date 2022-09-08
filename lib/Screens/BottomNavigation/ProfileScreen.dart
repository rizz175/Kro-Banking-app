import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kro/Screens/BottomNavigation/ProfileSection/AccountDetails.dart';
import 'package:kro/Screens/BottomNavigation/ProfileSection/AccountLimits.dart';
import 'package:kro/Screens/BottomNavigation/ProfileSection/ProfileinfoScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../LoginScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  SharedPreferences? prefs;
  var user;

  String myname="";
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
    });

    print(user['name']);
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  height: height * 0.26,
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: height * 0.03,
                              letterSpacing: 1),
                        ),
                        Container(
                          height: height * 0.05,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white70.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Help",
                              style: TextStyle(
                                  color: secondryColor,
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              GestureDetector(
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          profileinfoScreen(user),
                    ),
                  );
                },
                child: Container(
                  margin:  EdgeInsets.only(left: 20, top:height*0.18, right: 20),
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10),
                              decoration: BoxDecoration(
                                  color: secondryColor, shape: BoxShape.circle),
                              child: Icon(
                                Icons.perm_identity,
                                color: Colors.white,
                                size: height * 0.06,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "$myname",
                                    style: TextStyle(
                                        color: secondryColor,
                                        fontSize: height * 0.025,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: .5),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black54,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
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
                  Text(
                    "Account",
                    style: TextStyle(
                        fontSize: height * 0.027,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              accountDetails(user),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_balance,
                              color: Colors.black54,
                              size: height * 0.03,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Account details ",
                                style: TextStyle(
                                    fontSize: height * 0.022,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87)),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black54,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              accountLimits(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.black54,
                              size: height * 0.03,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Account Limits ",
                                style: TextStyle(
                                    fontSize: height * 0.022,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87)),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black54,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
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
                  Text(
                    "About \& Help",
                    style: TextStyle(
                        fontSize: height * 0.027,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.question_mark_rounded,
                            color: Colors.black54,
                            size: height * 0.03,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("Read our FAQ's ",
                              style: TextStyle(
                                  fontSize: height * 0.022,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87)),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                        size: 15,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.list_alt,
                            color: Colors.black54,
                            size: height * 0.03,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("Terms and Condtions ",
                              style: TextStyle(
                                  fontSize: height * 0.022,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87)),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                        size: 15,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap:() async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();

                      prefs.setBool("loggedin",false);
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          LoginScreen()), (Route<dynamic> route) => false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.black54,
                              size: height * 0.03,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Logout ",
                                style: TextStyle(
                                    fontSize: height * 0.022,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87)),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black54,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
