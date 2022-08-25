import 'package:flutter/material.dart';
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

AppBar myAppBar() {
  return AppBar(
    titleSpacing: 0.0,
    title: Row(
      children: [
        Image.asset(
          "assets/images/valo-logo.png",
          fit: BoxFit.contain,
          height: 24.0,
        ),
        const SizedBox(width: 10.0),
        RichText(
            text: TextSpan(
                text: "Valorant ",
                style: const TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'valorant',
                ),
                children: <TextSpan>[
              TextSpan(
                text: "Digest",
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: Colors.grey[400],
                ),
              )
            ])),
      ],
    ),
    backgroundColor: const Color(0xff181414),
    // elevation: 0.0,
  );
}
