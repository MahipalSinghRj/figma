import 'package:figma/res/components/ConstString.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signin.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'Page4.dart';
import 'Page5.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int pageIndex = 2;

  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
     Page5(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () async {
              // do something
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('email');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext ctx) => Login()));
            },

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
        ],
        centerTitle: true,
        title: const Text(
          ConstString.dashboardScreenAppBar,
        ),
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMynavBar(context),
    );
  }

  buildMynavBar(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.pinkAccent,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.green,
                    size: 35,
                  ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.search_outlined,
                    color: Colors.pinkAccent,
                    size: 35,
                  )
                : const Icon(
                    Icons.search_off_outlined,
                    color: Colors.green,
                    size: 35,
                  ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                pageIndex = 2;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.17,
              height: MediaQuery.of(context).size.width * 0.09,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                gradient: const LinearGradient(
                  begin: Alignment(-0.95, 0.0),
                  end: Alignment(1.0, 0.0),
                  colors: [Color(0xff667eea), Colors.pinkAccent],
                  stops: [0.0, 1.0],
                ),
              ),
              child: const Icon(Icons.add),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
                    Icons.notification_add,
                    color: Colors.pinkAccent,
                    size: 35,
                  )
                : const Icon(
                    Icons.notification_add_outlined,
                    color: Colors.green,
                    size: 35,
                  ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 4;
              });
            },
            icon: pageIndex == 4
                ? const Icon(
                    Icons.person,
                    color: Colors.pinkAccent,
                    size: 35,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.green,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}
