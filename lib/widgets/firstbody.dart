import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';

class FirstBody extends StatefulWidget {
  const FirstBody({Key? key}) : super(key: key);

  @override
  State<FirstBody> createState() => _FirstBodyState();
}

class _FirstBodyState extends State<FirstBody> {
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
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(100),
          ),
          child: SizedBox(
            width: _controller.value.size.width,
            height: 250,
            child: VideoPlayer(_controller),
          ),
        ),
        Column(
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
