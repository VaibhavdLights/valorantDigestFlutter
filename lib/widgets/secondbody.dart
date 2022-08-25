import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SecondBody extends StatefulWidget {
  const SecondBody({Key? key}) : super(key: key);

  @override
  State<SecondBody> createState() => _SecondBodyState();
}

class _SecondBodyState extends State<SecondBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 20,
          width: 45,
          color: const Color(0xff181414),
        ).pOnly(left: 100),
        RichText(
          text: const TextSpan(
            text: "LATEST NEWS",
            style: TextStyle(
              fontFamily: 'zuume',
              fontWeight: FontWeight.bold,
              fontSize: 36.0,
              color: Color(0xffff4655),
              letterSpacing: 0.5,
            ),
          ),
        ).pOnly(left: 30),
        const Divider(
          indent: 20,
          endIndent: 200,
        ).pOnly(top: 30, left: 30, right: 30),
      ],
    );
  }
}
