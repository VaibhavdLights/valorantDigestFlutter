import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

const String url = "https://vaibhavdlights.github.io/val-api/val-api.json";
List? data;
var isLoaded = false;

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    getJsonData();

    _controller = VideoPlayerController.asset("assets/videos/main.mkv")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0);
        setState(() {});
      });
  }

  Future<String> getJsonData() async {
    // ignore: unused_local_variable
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['data'];
      isLoaded = true;
    });
    return "Success";
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
      body: myBody(_controller, context),
    );
  }
}

Column myBody(VideoPlayerController controller, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      firstBody(controller),
      const SizedBox(height: 10),
      const Divider(
        thickness: 1,
        indent: 40,
        endIndent: 10,
      ),
      const SizedBox(height: 10),
      secondBody(),
      // const SizedBox(height: 10),
      thirdBody(context),
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

Widget secondBody() {
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

Widget thirdBody(BuildContext context) {
  return Stack(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 210,
        color: const Color(0xff201414),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 322,
        child: Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
            itemCount: data == null ? 0 : data?.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 300,
                child: GestureDetector(
                  onTap: () {
                    launchURL(data![index]['link']);
                  },
                  child: Card(
                    elevation: 6.0,
                    color: const Color(0xff181414),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            data![index]['image'],
                            fit: BoxFit.cover,
                          ),
                          Text(
                            data![index]['date'].toString().toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                color: Colors.white38, fontFamily: 'couture'),
                          ).pOnly(top: 10, left: 10, right: 10),
                          // const SizedBox(height: 8.0),
                          Text(
                            data![index]['title'].toString().toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white, fontFamily: 'couture'),
                          ).pOnly(top: 10, left: 10, right: 10),
                          Text(
                            data![index]['desc'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(color: Colors.white70),
                          ).pOnly(left: 10, right: 10),
                          TextButton(
                                  onPressed: () {
                                    launchURL(data![index]['link']);
                                  },
                                  child: const Text("LEARN MORE",
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontStyle: FontStyle.italic)))
                              .pOnly(left: 160, right: 10),
                        ],
                      ),
                    ),
                  ).pOnly(top: 10, left: 5, right: 5),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          ),
        ),
      ),
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

launchURL(String url) async {
  // ignore: deprecated_member_use
  await launch(url, forceWebView: true, enableJavaScript: true);
}
