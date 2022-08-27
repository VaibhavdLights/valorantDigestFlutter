import 'package:flutter/material.dart';

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
