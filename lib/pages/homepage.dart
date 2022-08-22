import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/main.mkv")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0);
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffece8e1),
      appBar: myAppBar(),
      body: myBody(_controller),
    );
  }
}

Column myBody(VideoPlayerController controller) {
  return Column(
    children: [
      firstBody(controller),
    ],
  );
}

Stack firstBody(VideoPlayerController controller) {
  return Stack(
    children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(100),
        ),
        child: SizedBox(
          width: controller.value.size.width,
          height: 250,
          child: VideoPlayer(controller),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "A 5v5 character-based tactical shooter",
            style: TextStyle(
              fontFamily: 'europa',
              color: Colors.white,
            ),
          ).pOnly(top: 54).centered(),
          const SizedBox(height: 22),
          const Text(
            "VALORANT",
            style: TextStyle(
              fontFamily: 'valorant',
              color: Colors.white,
              fontSize: 60.0,
            ),
          ).centered(),
          myButton().centered(),
        ],
      )
    ],
  );
}

ElevatedButton myButton() {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        )),
    child: Ink(
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Colors.red,
              Colors.pink,
            ]),
            borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 150,
          height: 40,
          alignment: Alignment.center,
          child: const Text(
            'PLAY NOW',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'couture',
            ),
          ),
        )),
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
