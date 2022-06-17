import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Login.dart';
import 'Register.dart';

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
                                "Bhawani_Project",
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "@Mahi_7773",
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Container(
                  width: 167,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purpleAccent),
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.purpleAccent),
                    textAlign: TextAlign.center,
                  ),
                  padding: const EdgeInsets.all(10.0),
                ),
                onTap: () {
                  print("********Login*********");
                  Get.off(Login());
                },
              ),
              InkWell(
                onTap: () {
                  Get.to(() => Register());
                  print("********Register*********");
                },
                child: Container(
                  width: 167,
                  height: 40,
                  decoration: BoxDecoration(
                      //border: Border.all(color: Colors.purpleAccent),
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.black),
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  padding: const EdgeInsets.all(10.0),
                ),
              ),
            ],
          ),
        );
  }
}
