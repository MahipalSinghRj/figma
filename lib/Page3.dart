import 'package:figma/res/Colors.dart';
import 'package:figma/res/components/round_button.dart';
import 'package:flutter/material.dart';
import 'Data/NetworkServices/NetworkServices.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  var loading = false;
  Future? staggeredData;

  @override
  initState() {
    super.initState();
    staggeredData = NetworkServices().staggeredModel();
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Buttons(
                            borderColor: Colors.purpleAccent,
                            fontSize: 16.0,
                            title: 'SEE MORE',
                            onPress: () {},
                            textColor: Colors.purpleAccent,
                            backgroundColor: AppColors.WhiteColor,
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
              itemCount: NetworkServices.staggeredList.length,
              //staticData.length,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 8.0,
                    child: Image.asset(
                        NetworkServices.staggeredList[index].image.toString()));
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
            future: NetworkServices().userModel(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.pinkAccent,
                ));
              } else {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: NetworkServices.userList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                                "assets/" +
                                    NetworkServices.userList[index].image
                                        .toString(),
                                fit: BoxFit.cover,
                                height: 392),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Image.asset(NetworkServices
                                      .userList[index].profileImage
                                      .toString()),
                                  backgroundColor: Colors.transparent,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      NetworkServices.userList[index].name
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w800),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(NetworkServices
                                        .userList[index].username
                                        .toString()),
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
}
