import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../ApiConstants/ApiConstants.dart';
import '../../UserModel/staggered_model.dart';
import '../../UserModel/user_model.dart';



class  NetworkServices{

  static List<UserModel> userList = [];
  static List<StaggeredModel> staggeredList = [];

   //Post Api call for register to user
   Future<bool> register(String email, String password) async {
     try {
       var response = await post(Uri.parse(ApiConstants().registerApi), body: {
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

  //Post Api call for login to user
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


   ///************BannerList*****************///


  //api for horizontal view
   Future<List<UserModel>> userModel() async {
     try {
       print("Calling User Model");

       final response = await http.get(Uri.parse(ApiConstants().userModelApi));
       print("Calling User Model2");

       print(response.body);
       var data = jsonDecode(response.body);

       if (response.statusCode == 200) {
         for (Map i in data) {
           userList.add(UserModel.fromJson(i));
         }
         print("User list lenght : ${userList[0].image}");
       }
     } catch (e, s) {
       print(e.toString());
       print(s.toString());
     }

     return userList;
   }

  //api for staggered view
   Future<List<StaggeredModel>> staggeredModel() async {
    staggeredList = [];
    try{
      final response =
      await http.get(Uri.parse(ApiConstants().staggeredModelApi));

      var dataStaggered = jsonDecode(response.body);

      print("BannerList****");
      print("Staggered list ${response.body}");
      //print(dataStaggered);
      if (response.statusCode == 200) {
        for (Map i in dataStaggered) {
          //print(i);
          staggeredList.add(StaggeredModel.fromJson(i));
        }
      }
    }catch (e, s) {
      print(e.toString());
      print(s.toString());
    }

    return staggeredList;
  }


}