import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AgentsBody extends StatefulWidget {
  const AgentsBody({Key? key}) : super(key: key);

  @override
  State<AgentsBody> createState() => _AgentsBodyState();
}

class _AgentsBodyState extends State<AgentsBody> {
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
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "YOUR AGENTS",
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
                  "CREATIVITY IS YOUR GREATEST WEAPON.",
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
                  height: 130,
                  width: MediaQuery.of(context).size.width - 60,
                  child: const Text(
                    "More than guns and bullets, you’ll choose an Agent armed with adaptive, swift, and lethal abilities that create opportunities to let your gunplay shine. No two Agents play alike, just as no two highlight reels will look the same.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 50,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/agentsDetail");
              },
              child: const Text("Agents >>>"),
            ).pOnly(left: 20)
          ],
        ),
      ],
    );
  }
}
