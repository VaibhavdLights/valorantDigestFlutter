import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class MapsBody extends StatefulWidget {
  const MapsBody({Key? key}) : super(key: key);

  @override
  State<MapsBody> createState() => _MapsBodyState();
}

class _MapsBodyState extends State<MapsBody> {
  String url = "https://valorant-api.com/v1/maps";
  List<MapDetail> maps = [];
  var isLoaded = false;
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
    });
    return "Success";
  }

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
        SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "YOUR MAPS",
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
                    "FIGHT AROUND THE WORLD",
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
                    height: 128,
                    width: MediaQuery.of(context).size.width - 60,
                    child: const Text(
                      "Each map is a playground to showcase your creative thinking. Purpose-built for team strategies, spectacular plays, and clutch moments. Make the play others will imitate for years to come.",
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
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 210,
                    color: const Color(0xff201414),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 640,
                    child: Visibility(
                      visible: isLoaded,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ListView.builder(
                        // ignore: unnecessary_null_comparison
                        itemCount: maps == null ? 0 : maps.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 300,
                            child: GestureDetector(
                              onTap: () {
                                launchURL(
                                    "https://playvalorant.com/en-us/maps/");
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
                                          maps[index].splash,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        maps[index]
                                            .coordinates
                                            .toString()
                                            .toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: Colors.white38,
                                            fontFamily: 'couture'),
                                      ).pOnly(top: 10, left: 10, right: 10),
                                      // const SizedBox(height: 8.0),
                                      Text(
                                        maps[index]
                                            .displayName
                                            .toString()
                                            .toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'couture'),
                                      ).pOnly(top: 10, left: 10, right: 10),
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
              ),
              const SizedBox(
                height: 36,
              ),
              yourMapsButton().centered().pOnly(right: 20),
            ],
          ),
        ),
      ],
    );
  }
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
