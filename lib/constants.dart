import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

var primaryColor=Color(0xfff97d9d);
var secondryColor=Color(0xff525cbb);
void showmessage(String message){
  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIos: 1,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: primaryColor,
  );
}

class Extra{




}