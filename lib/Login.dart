import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'LoggedScreen.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  login(String email, String password) async {
    try {
      var response =
      await post(Uri.parse("https://reqres.in/api/login"), body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        print("Login successfully");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }

  }

  void showSnackBar() {
    final snackBarContent = SnackBar(
      content: const Text("Login successful"),
      action: SnackBarAction(
          label: 'UNDO',
          onPressed: _scaffoldkey.currentState!.hideCurrentSnackBar),
    );
    _scaffoldkey.currentState?.showSnackBar(snackBarContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(() => LoggedScreen());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
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
                obscureText: true,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter password";
                  } else if (value.length < 6) {
                    return "Password can't be less than six words";
                  }
                  return null;
                }),
                decoration: InputDecoration(
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
                    onPressed: () {
                      showSnackBar();
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
    );
  }
}
