import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:kro/Model/userModel.dart';
import 'package:kro/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/dbHelper.dart';
import 'BottomNavigation.dart';
import 'CreatAccountScreen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<UserModel> userdata = [];
  final dbHelper = DatabaseHelper.instance;
  void _query(String email,String password) async {
    final allRows = await dbHelper.queryRows(email,password);
    userdata.clear();
    allRows.forEach((row) => userdata.add(UserModel.fromMap(row)));

    print("User data"+userdata.length.toString());

    if(userdata.length>0)
      {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        String encodedMap = json.encode(userdata[0].toMap());
        print(encodedMap);

        prefs.setString('userdata', encodedMap);
        prefs.setBool("loggedin",true);

        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                    MyHomePage()));
      }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        dismissDirection: DismissDirection.up,
        content: Text("Incorrect Credentials"),
      ));
    }
  }
  bool isSignIn = false;
  bool google = false;

  bool isChecked = false;
  final formGlobalKey = GlobalKey<FormState>();
  String password = "";
  bool emailok = false;
  String email = "";
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  bool isPasswordValid(String password) => password.length >= 6;
  bool _obscured = true;
  final textFieldFocusNode = FocusNode();

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
      false; // Prevents focus if tap on eye
    });
  }

  @override
  void initState() {


    // TODO: implement initState


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(

      body:SingleChildScrollView(
        child: Column(
          children: [

            ClipPath(
              clipper: DiagonalPathClipperTwo(),
              child: Container(
                height:height*0.45,
                color:primaryColor,
                child: Center(child:Container(
                  margin: const EdgeInsets.only(top:100),
                  child: Image.asset(

                    "assets/logo.png",color:Colors.white,
                   ),
                ),
            ))),
            SizedBox(
              height: height * 0.55,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Container(
                        child: TextFormField(
                          controller: Email,
                          validator: (email) {
                            if (isEmail(email.toString()))
                              return null;
                            else
                              return 'Enter a valid email address';
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            contentPadding: const EdgeInsets.all(16),
                            fillColor: const Color(0xfff6f5f5),
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Container(
                        child: TextFormField(
                          controller: Password,
                          validator: (password) {
                            if (isPasswordValid(password.toString()))
                              return null;
                            else
                              return 'Password must be greater than 5 characters';
                          },
                          keyboardType: TextInputType.visiblePassword,
                          focusNode: textFieldFocusNode,
                          obscureText: _obscured,
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 0, 4, 0),
                                  child: GestureDetector(
                                    onTap: _toggleObscured,
                                    child: Icon(
                                      !_obscured
                                          ? Icons.visibility_rounded
                                          : Icons
                                          .visibility_off_rounded,
                                      size: 24,
                                      color: primaryColor,
                                    ),
                                  )),
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              contentPadding: const EdgeInsets.all(16),
                              fillColor: const Color(0xfff6f5f5),
                              prefixIcon: Icon(Icons.lock_outline)),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      SizedBox(
                          height: height * 0.067,
                          width: width,
                          child: ElevatedButton(
                              onPressed: () {
                                if (formGlobalKey.currentState!
                                    .validate()) {
                                              formGlobalKey.currentState!.save();
                                _query(Email.text.toString(),Password.text.toString());

                                }

                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2),
                              ))),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        width: width,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(""),
                            GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   new MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           ForgotPassword()),
                                  // );
                                },
                                child: const Text(
                                  "",
                                  textAlign: TextAlign.end,
                                )),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: height * 0.1,
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => signup()));
                                },
                                child: const Text(
                                  "  Register",
                                  style: TextStyle(
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
