import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kro/Model/userModel.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Helper/dbHelper.dart';
import '../constants.dart';


class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final dbHelper = DatabaseHelper.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


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
  void _insert() async {

    var accountno = 10000000+ Random().nextInt(11111111 - 10000000);
    // row to insert
    var sortcode = 100000+ Random().nextInt(111111 - 100000);
    var pincode = 1000+ Random().nextInt(9999 - 1000);

    print('account no '+accountno.toString());
    print('sort code '+_addDashes(sortcode.toString()).toString());

    Map<String, dynamic> row = {
      'name':fullname.text.toString(),
      'phone':phonecontroller.text.toString(),
      'password':Password.text.toString(),
      'email':Email.text.toString(),
      'accountno':accountno.toString(),
      'sortcode':sortcode.toString(),
      'pincode':pincode.toString(),
       'address':addresscontroller.text.toString(),
      'balance':"0.00"
    };
    UserModel user = UserModel.fromMap(row);
    try {
      final id = await dbHelper.insert(user);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        dismissDirection: DismissDirection.up,
        content: Text("Account Created"),
      ));
      Navigator.pop(context);
    }catch(e){
      print(e.toString());
    }

  }
  String fname = '';
  String lname = '';
  TextEditingController fullname = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();

  TextEditingController Email = TextEditingController();

  TextEditingController Password = TextEditingController();

  String address = '';

  String password = '';
  bool emailok = false;
  final formGlobalKey = GlobalKey<FormState>();

  String email = '';
  bool showSpinner = false;

  bool isPasswordValid(String password) => password.length >= 6;

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

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
  void initState() {}
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(
            color: Colors.red,
          ),
          inAsyncCall: showSpinner,
          child:SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formGlobalKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height:10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: primaryColor,
                              size: 25,
                            ),
                          ),
                          Center(
                              child: Image.asset(
                                "assets/logo.jpeg",width:width*0.3,
                              )),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Text("Create Account",
                          style: TextStyle(
                              fontSize: height * 0.04,
                              fontWeight: FontWeight.w600,
                              color:Colors.black)),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      const Text(
                        "Full Name",
                        style: TextStyle(color:Colors.black87),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        child: TextFormField(
                          controller: fullname,
                          validator: (fname) {
                            if (fname!.isNotEmpty)
                              return null;
                            else
                              return 'Fullname is empty';
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            prefixIcon: const Icon(Icons.perm_identity),
                            contentPadding: const EdgeInsets.all(16),
                            fillColor: const Color(0xfff6f5f5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      const Text(
                        "Phone No.",
                        style: TextStyle(color:Colors.black87),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        child: TextFormField(
                          controller: phonecontroller,
                          validator: (phonee) {
                            if (phonee!.isNotEmpty)
                              return null;
                            else
                              return 'Enter a valid Phone';
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Phone No.',
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
                              prefixIcon: const Icon(Icons.phone),
                              prefixIconColor: primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      const Text(
                        "Full Address",
                        style: TextStyle(color:Colors.black87),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        child: TextFormField(

                          controller:addresscontroller,
                          validator: (address) {
                            if (address!.isNotEmpty)
                              return null;
                            else
                              return 'Enter a valid Address';
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Address.',
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
                              prefixIcon: const Icon(Icons.location_on),
                              prefixIconColor: primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(color:Colors.black87),
                      ),
                      SizedBox(
                        height: height * 0.01,
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
                              prefixIcon: const Icon(Icons.email_outlined),
                              prefixIconColor: primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      const Text(
                        "Password",
                        style: const TextStyle(color:Colors.black87),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        child: TextFormField(
                          controller: Password,
                          obscureText: _obscured,
                          validator: (password) {
                            if (isPasswordValid(password.toString()))
                              return null;
                            else
                              return 'Password must be greater than 5 characters';
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                child: GestureDetector(
                                  onTap: _toggleObscured,
                                  child: Icon(
                                    !_obscured
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded,
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
                            prefixIcon: const Icon(Icons.lock),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Container(
                          height: 48,
                          width: width,
                          child: ElevatedButton(
                              onPressed: () {
                                if (formGlobalKey.currentState!.validate()) {
                                  formGlobalKey.currentState!.save();
                                  _insert();
                                }
                                // signUp(email, password);
                              },
                              child: const Text(
                                "REGISTER",
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))),
                      SizedBox(
                        height: height * 0.037,
                      ),
                      Container(
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "  Sign in",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
