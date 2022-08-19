import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7e7c7d),
      appBar: myAppBar(),
      body: myBody(),
    );
  }
}

Column myBody() {
  return Column(
    children: [
      const Text(
        "A 5v5 character-based tactical shooter",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ).pOnly(top: 100).centered(),
      const SizedBox(height: 22),
      const Text(
        "VALORANT",
        style: TextStyle(
          fontFamily: 'valorant',
          color: Colors.white,
          fontSize: 60.0,
        ),
      ),
      myButton(),
    ],
  );
}

Container myButton() {
  return Container(
    padding: const EdgeInsets.all(0),
    height: 32,
    margin: const EdgeInsets.only(top: 22, right: 120, left: 120),
    decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.red,
            Colors.pink,
          ],
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12)),
    child: InkWell(
      onTap: () {},
    ),
  );
}

AppBar myAppBar() {
  return AppBar(
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
