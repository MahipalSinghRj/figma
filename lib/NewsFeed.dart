import 'package:flutter/material.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 1, 0, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          maxRadius: 30,
                                          minRadius: 20,
                                          backgroundColor: Colors.transparent,
                                          child: Image.asset(
                                            "assets/circular.png",
                                          ),
                                          //backgroundColor: Colors.transparent,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Anil_Distributor"),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "@anil_2183",
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Text(
                                                  "|",
                                                  style: TextStyle(),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: "Distributor",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.red.shade800,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.red.shade800),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: Colors.white),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 5),
                                      child: Text(
                                        "Message",
                                        style: TextStyle(
                                            color: Colors.red.shade800),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Tractor के कुछ नए पार्ट्स आये है। जो लोग \n Interested हैं कृपया मैसेज करे !",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            width: MediaQuery.of(context).size.width,
                            height: 25,
                            color: Colors.black54,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Our Products",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "See All",
                                  style: TextStyle(
                                      color: Colors.red.shade800,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 5, 8, 10),
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  child: ListView.builder(
                                      itemCount: 3,
                                      // physics: ScrollPhysics().parent,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                          elevation: 5,
                                          shadowColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.6,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 8, 8.0, 8),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/bearingOuter.png",
                                                    width: 100,
                                                    height: 90,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Text(
                                                        "₹ 280",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: Colors.red),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                          "Case 70 Universal Cross"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  elevation: 5,
                                  shadowColor: Colors.white70,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    height: 35,
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          20, 17, 10, 0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                              "Enter your comments here...",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.thumb_up,
                                              color: Colors.red.shade800),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text("2.3k")
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(Icons.message,
                                              color: Colors.black45),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("2.3k")
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(Icons.whatsapp,
                                              color: Colors.green),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("1.3k")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
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
}
