import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shadow/shadow.dart';
import 'package:video_player/video_player.dart';

class SkinsBody extends StatefulWidget {
  const SkinsBody({Key? key}) : super(key: key);

  @override
  State<SkinsBody> createState() => _SkinsBodyState();
}

class _SkinsBodyState extends State<SkinsBody> {
  // late VideoPlayerController _controller1;
  String url = "https://valorant-api.com/v1/weapons/skins";
  late String arg =
      "https://valorant.dyn.riotcdn.net/x/videos/release-05.08/07c47f26-4dd6-fe8f-bcdc-18b9c1425667_default_universal.mp4";
  List<Skins> skins = [];
  String? _selectedValue = "Valorant";
  var isLoaded = false;
  @override
  void initState() {
    getJsonData();
    // _controller1 = VideoPlayerController.network(arg)
    //   ..initialize().then((_) {
    //     _controller1.play();
    //     _controller1.setLooping(true);
    //     _controller1.setVolume(0);
    //     setState(() {});
    //   });
    super.initState();
  }

  Future<String> getJsonData() async {
    // ignore: unused_local_variable
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    var jsonData = jsonDecode(response.body);

    // data = convertDataToJson['data'];
    setState(() {
      for (var i in jsonData['data']) {
        if (i['displayName'] != null &&
            i['displayName'] != 'Random Favorite Skin') {
          Skins skinsData = Skins(
              i['displayName'], i['displayIcon'], i['chromas'], i['levels']);
          skins.add(skinsData);
        }
      }
      isLoaded = true;
      _selectedValue = skins[0].displayName;
    });
    return "Success";
  }

  @override
  void dispose() {
    super.dispose();
    // _controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "CHOOSE YOUR\nSKIN",
          style: TextStyle(
              fontFamily: 'zuume',
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color(0xff15232b)),
        ).pOnly(top: 10),
        const SizedBox(
          height: 28,
        ),
        DropdownButtonFormField2(
          scrollbarAlwaysShow: true,
          isExpanded: true,
          dropdownMaxHeight: 400,
          dropdownWidth: MediaQuery.of(context).size.width - 20,
          // alignment: Alignment.center,
          value: _selectedValue,
          // dropdownColor: const Color(0xffece8e1),
          decoration: const InputDecoration(
            isDense: true,
            labelText: "Skins",
            contentPadding: EdgeInsets.all(10),
            hintText: "Choose  Skin",
            prefixIcon: Icon(Icons.gamepad_rounded),
            border: OutlineInputBorder(),
          ),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffece8e1),
          ),
          // dropdownPadding: const EdgeInsets.only(right: 20),
          items: skins
              .map((e) => DropdownMenuItem(
                    value: e.displayName,
                    child: Text(e.displayName),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedValue = value as String;
              arg = setArg(_selectedValue, skins);
              // _controller1 = VideoPlayerController.network(arg)
              //   ..initialize().then((_) {
              //     _controller1.play();
              //     _controller1.setLooping(true);
              //     _controller1.setVolume(0);
              //   });
            });
          },
        ),
        const SizedBox(
          height: 36,
        ),
        const SizedBox(
          height: 36,
        ),
        Visibility(
          visible: isLoaded,
          replacement: const CircularProgressIndicator().centered(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "SKIN DETAILS",
                style: TextStyle(fontFamily: 'couture'),
              ).pOnly(left: 20),
              SizedBox(
                height: 190,
                width: MediaQuery.of(context).size.width - 20,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          backgroundColor: Color(0xffece8e1),
                          content: SizedBox(
                            // height: 100,
                            // width: 100,
                            child: Text(
                              "Preview Coming Soon...",
                              style:
                                  TextStyle(fontFamily: 'europa', fontSize: 18),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    color: const Color(0xff181414),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width - 80,
                          child: Shadow(
                              options: const ShadowOptions(
                                overlayColor: Color(0xff181414),
                                scale: 1,
                                blur: 10,
                              ),
                              child: Image.network(
                                  skinIMG(_selectedValue, skins))),
                        ).pOnly(top: 20, left: 10),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          child: Text(
                            _selectedValue!,
                            style: const TextStyle(
                                fontFamily: 'couture',
                                fontSize: 24,
                                color: Colors.white),
                          ).pOnly(left: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
            ],
          ),
        ),
      ],
    ).pOnly(left: 20, right: 20);
  }
}

class PlayVideo extends StatefulWidget {
  const PlayVideo({Key? key}) : super(key: key);

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _SkinsBodyState obj = _SkinsBodyState();
    obj.skins;
    return Container();
  }
}

String skinIMG(String? selectedValue, List<Skins> skins) {
  for (int i = 0; i < skins.length; i++) {
    if (skins[i].displayName == selectedValue && skins[i].displayIcon != Null) {
      return skins[i].chromas[0]['fullRender'];
    }
  }
  return "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Valorant_logo_-_pink_color_version.svg/2560px-Valorant_logo_-_pink_color_version.svg.png";
}

String setArg(String? selectedValue, List<Skins> skins) {
  for (int i = 0; i < skins.length; i++) {
    if (skins[i].displayName == selectedValue &&
        skins[i].levels[0]['streamedVideo'] != null) {
      // print(skins[i].levels[skins[i].levels.length - 1]['streamedVideo']);
      return skins[i].levels[0]['streamedVideo'];
    }
  }
  return "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Valorant_logo_-_pink_color_version.svg/2560px-Valorant_logo_-_pink_color_version.svg.png";
}

class Skins {
  final dynamic displayName, displayIcon, chromas, levels;

  Skins(this.displayName, this.displayIcon, this.chromas, this.levels);
}
