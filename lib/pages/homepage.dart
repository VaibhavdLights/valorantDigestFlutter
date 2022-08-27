import 'package:flutter/material.dart';
import 'package:valorant_db/widgets/appbar.dart';
import 'package:valorant_db/widgets/drawer.dart';
import 'package:valorant_db/widgets/firstbody.dart';
import 'package:valorant_db/widgets/secondbody.dart';
import 'package:valorant_db/widgets/thirdbody.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffece8e1),
      appBar: myAppBar(),
      body: myBody(),
      drawer: const MyDrawer(),
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
