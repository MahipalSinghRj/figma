import 'package:figma/ApiConstants/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'Dashboard.dart';
import 'LoggedScreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;
  bool isLogin = false;
  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(() => LoggedScreen());
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "Please enter email";
                      }
                      return null;
                    }),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "Enter Email",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !isVisibility,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "Please enter password";
                      } else if (value.length < 6) {
                        return "Password can't be less than six words";
                      }
                      return null;
                    }),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(isVisibility
                            ? Icons.visibility
                            : Icons.visibility_off),
                        color: isVisibility ? Colors.grey : Colors.grey,
                        onPressed: () {
                          setState(() {
                            isVisibility = !isVisibility;
                          });
                        },
                      ),
                      labelText: "Enter Password",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await login(emailController.text.toString(),
                                    passwordController.text.toString())
                                .then((value) {
                              if (value) {
                                showInSnackBar("Login Successful");

                                Future.delayed(const Duration(seconds: 2), () {
                                  emailController.text = "";
                                  passwordController.text = "";

                                  setState(() {
                                    isLoading = true;
                                  });
                                  Get.to(() => const Dashboard());
                                });
                              } else {
                                showInSnackBar("Invalid credentials...");
                              }
                            });
                          }

                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        //style: ElevatedButton.styleFrom(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> login(String email, String password) async {
    try {
      var response = await post(Uri.parse(ApiConstants().loginApi), body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        print("Login successfully");
        return true;
      } else {
        print("Failed");
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }
}
