import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valorant_db/widgets/appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffece8e1),
      appBar: myAppBar(),
      body: const LearnBody(),
    );
  }
}

class LearnBody extends StatefulWidget {
  const LearnBody({Key? key}) : super(key: key);

  @override
  State<LearnBody> createState() => _LearnBodyState();
}

class _LearnBodyState extends State<LearnBody> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(left: 20),
          child: const VerticalDivider(
            color: Color(0xff181414),
            thickness: 0.5,
            width: 0,
          ),
        ),
        Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "WE ARE VALORANT",
                  style: TextStyle(
                      fontFamily: 'zuume',
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff15232b)),
                ).pOnly(top: 10),
                const SizedBox(
                  height: 28,
                ),
                const Text(
                  "DEFY THE LIMITS",
                  style: TextStyle(
                      fontFamily: 'europa',
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xff15232b)),
                ).pOnly(top: 10),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width - 60,
                  child: const Text(
                    "Blend your style and experience on a global, competitive stage. You have 13 rounds to attack and defend your side using sharp gunplay and tactical abilities. And, with one life per-round, you'll need to think faster than your opponent if you want to survive. Take on foes across Competitive and Unranked modes as well as Deathmatch and Spike Rush.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 50,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
              ],
            ),
            learnGameButton().pOnly(left: 20),
          ],
        ),
      ],
    );
  }
}

ElevatedButton learnGameButton() {
  return ElevatedButton(
    onPressed: () {
      launchURL(
          "https://playvalorant.com/en-us/news/announcements/beginners-guide/");
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    ),
    child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: const Color(0xfffb4454)),
        child: Container(
          width: 200,
          height: 55,
          alignment: Alignment.center,
          child: const Text(
            'LEARN THE GAME',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'couture',
            ),
          ),
        )),
  );
}

launchURL(String url) async {
  // ignore: deprecated_member_use
  await launch(url, forceWebView: true, enableJavaScript: true);
}
