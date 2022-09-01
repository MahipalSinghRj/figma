import 'package:figma/res/Colors.dart';
import 'package:figma/res/components/ConstString.dart';
import 'package:figma/res/components/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Data/NetworkServices/NetworkServices.dart';
import 'LoggedScreen.dart';
import 'Utils/utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
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
                    ConstString.SignUpScreenText,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),

                  ///email text field
                  TextFormField(
                    controller: emailController,
                    focusNode: emailFocusNode,
                    onFieldSubmitted: (value) {
                      Utils.filedFocusChange(
                          context, emailFocusNode, passFocusNode);
                    },
                    keyboardType: TextInputType.emailAddress,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return ConstString.SignUpScreenEmailReturnText;
                      }
                      return null;
                    }),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: ConstString.SignUpScreenEmailLabelText,
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

                  ///password text field
                  TextFormField(
                    controller: passwordController,
                    focusNode: passFocusNode,
                    obscureText: !isVisibility,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return ConstString.SignUpScreenPasswordReturnText;
                      } else if (value.length < 6) {
                        return ConstString.SignUpScreenPasswordLengthText;
                      }
                      return null;
                    }),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(isVisibility
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isVisibility = !isVisibility;
                          });
                        },
                      ),
                      labelText: ConstString.SignUpScreenPasswordLabelText,
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

                  //signup button text filed
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Buttons(
                      title: ConstString.SignUpScreenSignUpButtonText,
                      textColor: Colors.white,
                      backgroundColor: AppColors.blackColor,
                      borderColor: Colors.red,
                      onPress: () async {
                        if (_formKey.currentState!.validate()) {
                          await NetworkServices()
                              .register(emailController.text.toString(),
                                  passwordController.text.toString())
                              .then((value) {
                            if (value) {
                              Utils.flushBarMessage("Registration Successful",
                                  "Congratulation", context);

                              Future.delayed(const Duration(seconds: 2), () {
                                emailController.text = "";
                                passwordController.text = "";

                                setState(() {});
                                Get.to(() => const LoggedScreen());
                              });
                            } else {
                              Utils.flushBarMessage(
                                  "Please enter correct Credentials",
                                  "Registration Failed...",
                                  context);
                            }
                          });
                        }
                      },
                      fontSize: 16.0,
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
}
