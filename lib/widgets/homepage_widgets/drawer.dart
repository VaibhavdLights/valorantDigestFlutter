import 'package:flutter/material.dart';
import 'package:valorant_db/my_webview.dart';
import 'package:valorant_db/widgets/appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // width: MediaQuery.of(context).size.width - 120,
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
          ).pOnly(top: 20, left: 24, bottom: 5),
          const Divider(
            color: Colors.white38,
          ),
          TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white10)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyWebView(
                      title: "LEARN",
                      selectedUrl:
                          "https://playvalorant.com/en-us/news/announcements/beginners-guide/"),
                ));
              },
              child: const Text(
                "LEARN",
                style: TextStyle(color: Colors.white, fontFamily: 'couture'),
              )),
          const Divider(
            color: Colors.white38,
          ),
          TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white10)),
              onPressed: () {
                Navigator.pushNamed(context, "/agents");
              },
              child: const Text(
                "AGENTS",
                style: TextStyle(color: Colors.white, fontFamily: 'couture'),
              )),
          const Divider(
            color: Colors.white38,
          ),
          TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white10)),
              onPressed: () {
                Navigator.pushNamed(context, "/maps");
              },
              child: const Text(
                "MAPS",
                style: TextStyle(color: Colors.white, fontFamily: 'couture'),
              )),
          const Divider(
            color: Colors.white38,
          ),
          TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white10)),
              onPressed: () {
                Navigator.pushNamed(context, "/weapons");
              },
              child: const Text(
                "WEAPONS",
                style: TextStyle(color: Colors.white, fontFamily: 'couture'),
              )),
          const Divider(
            color: Colors.white38,
          ),
          TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white10)),
              onPressed: () {
                Navigator.pushNamed(context, "/skins");
              },
              child: const Text(
                "SKINS",
                style: TextStyle(color: Colors.white, fontFamily: 'couture'),
              )),
          const Divider(
            color: Colors.white38,
          ),
          TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white10)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyWebView(
                    title: "LEARN",
                    selectedUrl: "https://valorantesports.com/",
                  ),
                ));
              },
              child: const Text(
                "ESPORTS",
                style: TextStyle(color: Colors.white, fontFamily: 'couture'),
              )),
          const Divider(
            color: Colors.white38,
          ),
          TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white10)),
              onPressed: () {
                Navigator.pushNamed(context, "/about");
              },
              child: const Text(
                "ABOUT",
                style: TextStyle(color: Colors.white, fontFamily: 'couture'),
              )),
          const Divider(
            color: Colors.white38,
          ),
          TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white10)),
              onPressed: () {},
              child: const Text(
                "HELP",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'couture',
                ),
              )),
          const Divider(
            color: Colors.white38,
          ),
        ],
      ),
    );
  }
}
