import 'package:figma/Dashboard.dart';
import 'package:figma/LoggedScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/mahipal.jpg'),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
        ),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      SharedPreferences obj = await SharedPreferences.getInstance();

      print("dynamic Navigation ");
      obj.get("email") != null
          ? Get.off(() => Dashboard())
          : Get.off(() => LoggedScreen());
    });
  }
}
