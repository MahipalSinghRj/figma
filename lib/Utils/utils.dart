import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static flushBarMessage(String message,String title, BuildContext context) {
    Flushbar(

      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),

      backgroundGradient: LinearGradient(
        colors: [
          Colors.pink.shade500,
          Colors.pink.shade300,
          Colors.pink.shade100
        ],
        stops: [0.4, 0.7, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title:title,
      message: message,
      messageSize: 17,
    )..show(context);
  }
}
