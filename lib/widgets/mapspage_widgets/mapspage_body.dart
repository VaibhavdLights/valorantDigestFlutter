import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

import '../../my_webview.dart';

class MapsBody extends StatefulWidget {
  const MapsBody({Key? key}) : super(key: key);

  @override
  State<MapsBody> createState() => _MapsBodyState();
}

class _MapsBodyState extends State<MapsBody> {
  String url = "https://valorant-api.com/v1/maps";
  List<MapDetail> maps = [];
  var isLoaded = false;
  String? _selectedValue = "Valorant";
  @override
  void initState() {
    getJsonData();
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
        if (i['displayIcon'] != null) {
          MapDetail map =
              MapDetail(i['displayName'], i['coordinates'], i['splash']);
          maps.add(map);
        }
      }
      isLoaded = true;
      _selectedValue = maps[0].displayName;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "CHOOSE YOUR\nMAP",
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
                labelText: "Maps",
                contentPadding: EdgeInsets.all(10),
                hintText: "Choose Map",
                prefixIcon: Icon(Icons.gamepad_rounded),
                border: OutlineInputBorder(),
              ),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffece8e1),
              ),
              // dropdownPadding: const EdgeInsets.only(right: 20),
              items: maps
                  .map((e) => DropdownMenuItem(
                        value: e.displayName,
                        child: Text(e.displayName),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as String;
                });
              },
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
                  GestureDetector(
                    onTap: () {
                      // launchURL("https://playvalorant.com/en-us/arsenal/");
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => MyWebView(
                      //       title: "MAPS",
                      //       selectedUrl:
                      //           "https://playvalorant.com/en-us/arsenal/"),
                      // ));
                    },
                    child: Visibility(
                      visible: isLoaded,
                      replacement: const CircularProgressIndicator().centered(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "MAP DETAILS",
                            style: TextStyle(fontFamily: 'couture'),
                          ).pOnly(left: 20),
                          SizedBox(
                            height: 230,
                            width: MediaQuery.of(context).size.width - 20,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyWebView(
                                        title: "LEARN",
                                        selectedUrl:
                                            "https://playvalorant.com/en-us/maps/"),
                                  ));
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 140,
                                          child: Image.network(
                                            getMapIMG(_selectedValue!, maps),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          getMapCoor(_selectedValue, maps),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                              color: Colors.white38,
                                              fontFamily: 'couture'),
                                        ).pOnly(top: 10, left: 10, right: 10),
                                        // const SizedBox(height: 8.0),
                                        Text(
                                          _selectedValue!,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'couture'),
                                        ).pOnly(top: 10, left: 10, right: 10),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          const Text(
                            "FIGHT AROUND THE WORLD",
                            style: TextStyle(fontFamily: 'couture'),
                          ).pOnly(left: 20),
                          Stack(
                            children: [
                              Column(
                                children: [
                                  // const SizedBox(
                                  //   height: 34,
                                  // ),
                                  Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: const Color(0xff181414),
                                    ),
                                  ),
                                ],
                              ),
                              FittedBox(
                                fit: BoxFit.contain,
                                child: SizedBox(
                                  height: 130,
                                  width: MediaQuery.of(context).size.width,
                                  child: const Text(
                                    "Each map is a playground to showcase your creative thinking. Purpose-built for team strategies, spectacular plays, and clutch moments. Make the play others will imitate for years to come.",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 17,
                                        fontFamily: 'europa'),
                                    textAlign: TextAlign.justify,
                                  ).p(10),
                                ),
                              ),
                            ],
                          ),
                        ],
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
        ).pOnly(left: 20, right: 20),
      ],
    );
  }
}

String getMapIMG(String? selectedValue, List<MapDetail> maps) {
  for (int i = 0; i < maps.length; i++) {
    if (maps[i].displayName == selectedValue) return maps[i].splash;
  }
  return "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Valorant_logo_-_pink_color_version.svg/2560px-Valorant_logo_-_pink_color_version.svg.png";
}

String getMapCoor(String? selectedValue, List<MapDetail> maps) {
  for (int i = 0; i < maps.length; i++) {
    if (maps[i].displayName == selectedValue) {
      return maps[i].coordinates.toString().toUpperCase();
    }
  }
  return "NULL";
}

class MapDetail {
  final dynamic displayName, coordinates, splash;

  MapDetail(this.displayName, this.coordinates, this.splash);
}

ElevatedButton yourMapsButton() {
  return ElevatedButton(
    onPressed: () {
      launchURL("https://playvalorant.com/en-us/maps/");
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xfffb4454)),
        child: Container(
          width: 200,
          height: 55,
          alignment: Alignment.center,
          child: const Text(
            'YOUR MAPS',
            style: TextStyle(
              fontSize: 16,
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
