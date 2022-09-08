import 'package:flutter/material.dart';
import 'package:kro/constants.dart';

class profileinfoScreen extends StatefulWidget {
var user;

profileinfoScreen(this.user);

  @override
  _profileinfoScreenState createState() => _profileinfoScreenState();
}

class _profileinfoScreenState extends State<profileinfoScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
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
                    "Your Profile",
                    style: TextStyle(
                        fontSize: height * 0.025, fontWeight: FontWeight.w600,letterSpacing:1),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    decoration: BoxDecoration(
                        color: secondryColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.perm_identity,
                      color: Colors.white,
                      size: height * 0.04,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0,bottom:10),
                child: Text("If you would like to update details please get in touch with customer service",style:TextStyle(fontWeight:FontWeight.w700,
                    color:Colors.black54,fontSize:height*0.025)),
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
                      horizontal: 15.0, vertical:25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Name"),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${widget.user['name']}",
                        style: TextStyle(
                            color: secondryColor,
                            letterSpacing: 1,
                            fontSize: height * 0.026),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical:25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Email"),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${widget.user['email']}",
                        style: TextStyle(
                            color: secondryColor,
                            letterSpacing: 1,
                            fontSize: height * 0.026),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical:25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Phone number"),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "+44${widget.user['phone']}",
                        style: TextStyle(
                            color: secondryColor,
                            letterSpacing: 1,
                            fontSize: height * 0.026),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical:25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Home Address"),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${widget.user['address']}",
                        style: TextStyle(
                            color: secondryColor,
                            letterSpacing: 1,
                            fontSize: height * 0.026),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
