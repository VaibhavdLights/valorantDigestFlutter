import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: const Color(0xff181414),
      child: ListView(
        children: [
          Row(
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
          ).pOnly(top: 20, left: 20, bottom: 5),
          const Divider(
            color: Colors.white38,
          ),
        ],
      ),
    );
  }
}
