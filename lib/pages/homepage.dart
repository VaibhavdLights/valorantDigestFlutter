import 'package:flutter/material.dart';
import 'package:valorant_db/widgets/appbar.dart';
import 'package:valorant_db/widgets/homepage_widgets/drawer.dart';
import 'package:valorant_db/widgets/homepage_widgets/firstbody.dart';
import 'package:valorant_db/widgets/homepage_widgets/secondbody.dart';
import 'package:valorant_db/widgets/homepage_widgets/thirdbody.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffece8e1),
      appBar: myAppBar(),
      body: SingleChildScrollView(child: myBody()),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffece8e1),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            //call function
          });
        },
        items: const [
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          // BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Shorts", icon: Icon(Icons.play_arrow)),
          // BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Logout", icon: Icon(Icons.logout)),
        ],
      ),
    );
  }
}

Column myBody() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      FirstBody(),
      SizedBox(height: 10),
      Divider(
        thickness: 1,
        indent: 40,
        endIndent: 10,
      ),
      SizedBox(height: 10),
      SecondBody(),
      // const SizedBox(height: 10),
      ThirdBody(),
    ],
  );
}
