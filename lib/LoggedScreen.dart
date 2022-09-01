import 'package:figma/signin.dart';
import 'package:figma/res/Colors.dart';
import 'package:figma/res/components/ConstString.dart';
import 'package:figma/res/components/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'signup.dart';

class LoggedScreen extends StatefulWidget {
  const LoggedScreen({Key? key}) : super(key: key);

  @override
  State<LoggedScreen> createState() => _LoggedScreenState();
}

class _LoggedScreenState extends State<LoggedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/loggedout.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: SizedBox(
                      child: Image.asset(
                        "assets/photo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 15,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              maxRadius: 25,
                              backgroundColor: Colors.transparent,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset("assets/mahipal.jpg"),
                              )
                              //backgroundColor: Colors.transparent,
                              ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                               ConstString.loggedScreenBhawani,
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    ConstString.loggedScreenMahi,
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          buildPadding(),
        ],
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        children: [
          ///go to login field
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            flex: 1,
            child: Buttons(
              textColor: Colors.purpleAccent,
              onPress: () {
                print("********Login*********");
                Get.off(Login());
              },
              backgroundColor: AppColors.WhiteColor,
              borderColor: Colors.purpleAccent,
              title: ConstString.loggedScreenSignIn,
              fontSize: 12.0,
            ),
          ),

          SizedBox(
            width: 10.0,
          ),

          ///go to sign up field
          Expanded(
            flex: 1,
            child: Buttons(
              textColor: Colors.white,
              onPress: () {
                print("********Sign up*********");
                Get.off(SignUp());
              },
              backgroundColor: AppColors.blackColor,
              borderColor: Colors.purpleAccent,
              title: ConstString.loggedScreenSignUP,
              fontSize: 12.0,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }
}
