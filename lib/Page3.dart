import 'dart:convert';
import 'package:figma/ApiConstants/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'UserModel/staggered_model.dart';
import 'UserModel/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  var loading = false;

  List<UserModel> userList = [];
  List<StaggeredModel> staggeredList = [];

  Future? staggeredData;

  @override
  initState() {
    super.initState();
    staggeredData = staggeredModel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: (loading)
                ? const CircularProgressIndicator(
                    backgroundColor: Colors.pinkAccent,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Discover",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "WHAT'S NEW TODAY",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildHorizontalView(context),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "BROWSE ALL",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildStaggeredView(),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          //Get.to(()=> Register());
                          print("********Register*********");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.purpleAccent),
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white),
                            child: Center(
                              child: const Text(
                                'SEE MORE',
                                style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontWeight: FontWeight.w800),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  //method for staggered list view

   _buildStaggeredView() {
    return FutureBuilder(
        future: staggeredData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.pinkAccent,
            ));
          } else {
            return MasonryGridView.count(
              padding: const EdgeInsets.all(8.0),
              crossAxisCount: 2,
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: staggeredList.length,
              //staticData.length,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 8.0,
                    child: Image.asset(staggeredList[index].image.toString()));
              },
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            );
          }
        });
  }

  //method for horizontal list view

  _buildHorizontalView(context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height * .55,
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: FutureBuilder(
            future: userModel(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.pinkAccent,
                ));
              } else {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: userList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                                "assets/" + userList[index].image.toString(),
                                fit: BoxFit.cover,
                                height: 392),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Image.asset(
                                      userList[index].profileImage.toString()),
                                  backgroundColor: Colors.transparent,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userList[index].name.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w800),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(userList[index].username.toString()),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }

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
    final response =
        await http.get(Uri.parse(ApiConstants().staggeredModelApi));

    var dataStaggered = jsonDecode(response.body);

    print("*****************************");
    print(dataStaggered);
    if (response.statusCode == 200) {
      for (Map i in dataStaggered) {
        print(i);
        staggeredList.add(StaggeredModel.fromJson(i));

        print("9999999999999");
        print(staggeredList.length);
      }
    }

    return staggeredList;
  }
}
