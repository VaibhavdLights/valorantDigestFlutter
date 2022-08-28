import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:valorant_db/widgets/appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class GameModes extends StatefulWidget {
  const GameModes({Key? key}) : super(key: key);

  @override
  State<GameModes> createState() => _GameModesState();
}

class _GameModesState extends State<GameModes> {
  String url = "https://valorant-api.com/v1/gamemodes";
  List<Modes> modes = [];
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
          Modes mode = Modes(i['displayName'], i['displayIcon'], i['duration']);
          modes.add(mode);
        }
      }
      isLoaded = true;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Visibility(
              visible: isLoaded,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: ListView.builder(
                // ignore: unnecessary_null_comparison
                itemCount: modes == null ? 0 : modes.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    color: const Color(0xff181414),
                    child: SizedBox(
                        child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.network(
                              modes[index].image,
                              fit: BoxFit.contain,
                              alignment: Alignment.topCenter,
                            ).centered(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                modes[index].name.toString().toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white, fontFamily: 'couture'),
                              ).pOnly(left: 10, right: 10),
                              Text(
                                modes[index].duration.toString().toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                    color: Colors.white38,
                                    fontFamily: 'couture'),
                              ).pOnly(left: 10, right: 10),
                              // const SizedBox(height: 8.0),
                            ],
                          ).pOnly(top: 8)
                        ],
                      ).pOnly(top: 6, bottom: 6, left: 6),
                    )),
                  );
                },
                // scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Modes {
  final String name, image, duration;
  Modes(this.name, this.image, this.duration);
}
