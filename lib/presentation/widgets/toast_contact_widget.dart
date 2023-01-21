import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ToastContactWidget {
 static checkInternetConnectivity() {
      return Fluttertoast.showToast(
          msg: "Check your internet connection",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.sp
      );
    }

 // checkInternetConnectivityDialog() {
 //   showDialog(builder: (context) {
 //     return AlertDialog(
 //       title: Text("Network connection"),
 //     );
 //   }, context: context,);
 // }

}
