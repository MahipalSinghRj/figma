import 'package:figma/Utils/routes/routes_name.dart';
import 'package:figma/res/Colors.dart';
import 'package:figma/res/components/ConstString.dart';
import 'package:figma/res/components/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Data/NetworkServices/NetworkServices.dart';
import 'LoggedScreen.dart';
import 'Utils/utils.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //Form validation keys
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //Email and password controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //focus node class
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  //variables
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
                   ConstString.SignInScreenText,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ///email textField
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                    onFieldSubmitted: (value){
                      Utils.filedFocusChange(
                          context, emailFocusNode, passFocusNode);
                    },
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return ConstString.SignInScreenEmailReturnText;
                      }
                      return null;
                    }),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: ConstString.SignInScreenEmailLabelText,
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
                  ///password textField
                  TextFormField(
                    controller: passwordController,
                    focusNode: passFocusNode,
                    obscureText: !isVisibility,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return ConstString.SignInScreenPasswordReturnText;
                      } else if (value.length < 6) {
                        return ConstString.SignInScreenPasswordLengthText;
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
                      labelText: ConstString.SignInScreenPasswordLabelText,
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
                  ///validation button of email and password
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Buttons(
                      borderColor: Colors.purpleAccent,
                      textColor: Colors.purpleAccent,
                      title: ConstString.SignInScreenSignUpButtonText, backgroundColor: AppColors.WhiteColor, onPress: () async {
                        if (_formKey.currentState!.validate()) {
                      await NetworkServices().login(emailController.text.toString(),
                          passwordController.text.toString())
                          .then((value) async {
                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                        if (value) {

                          Utils.flushBarMessage("Login Successful",
                              "Congratulation", context);

                          Future.delayed(const Duration(seconds: 3), () {
                            emailController.text = "";
                            passwordController.text = "";

                            setState(() {
                              isLoading = true;
                            });

                            prefs.setString(
                                'email', 'eve.holt@reqres.in');
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext ctx) =>
                            //             Dashboard()));
                            Navigator.pushNamed(context, RoutesName.dashboard);

                            print("*************login email saved*********${prefs}");

                            print(prefs.toString());
                          });
                        } else {

                          Utils.flushBarMessage("Please enter correct Credentials",
                              "Login Failed",
                              context);
                        }
                      });
                    } }, fontSize: 16.0,


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
