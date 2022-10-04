import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class AgentsBody extends StatefulWidget {
  const AgentsBody({Key? key}) : super(key: key);

  @override
  State<AgentsBody> createState() => _AgentsBodyState();
}

class _AgentsBodyState extends State<AgentsBody> {
  // AudioPlayer audioPlayer = AudioPlayer();
  String url = "https://valorant-api.com/v1/agents";
  List<Agents> agents = [];
  String? _selectedValue = "Valorant";
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
        if (i['isPlayableCharacter'] == true) {
          // ignore: non_constant_identifier_names
          Agents AgentsData = Agents(
              i['displayName'],
              i['description'],
              i['developerName'],
              i['displayIcon'],
              i['fullPortrait'],
              i['background'],
              i['role'],
              i['abilities'],
              i['voiceLine']);
          agents.add(AgentsData);
        }
      }
      isLoaded = true;
      _selectedValue = agents[0].displayName;
    });
    return "Success";
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "CHOOSE YOUR\nAGENT",
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
            labelText: "Agents",
            contentPadding: EdgeInsets.all(10),
            hintText: "Choose Agents",
            prefixIcon: Icon(Icons.support_agent),
            border: OutlineInputBorder(),
          ),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffece8e1),
          ),
          // dropdownPadding: const EdgeInsets.only(right: 20),
          items: agents
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
          height: 16,
        ),
        Visibility(
          visible: isLoaded,
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width - 40,
                    child: GestureDetector(
                      onDoubleTap: () async {
                        final audioPlayer = AudioPlayer();
                        await audioPlayer
                            .play(UrlSource(fn6(_selectedValue!, agents)));
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(fn1(_selectedValue!, agents)),
                          Image.network(fn2(_selectedValue!, agents)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selectedValue!,
                    style: const TextStyle(
                        fontFamily: 'couture',
                        fontSize: 18,
                        decoration: TextDecoration.underline),
                  ),
                  Text(
                    fn3(_selectedValue!, agents),
                    style: const TextStyle(
                        fontFamily: 'europa',
                        color: Colors.grey,
                        decoration: TextDecoration.underline),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(fn4(_selectedValue!, agents),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontFamily: 'europa', color: Colors.grey)),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: (MediaQuery.of(context).size.width - 40) /
                                  2.0,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor:
                                            const Color(0xffece8e1),
                                        title: Text(
                                          fn5b(_selectedValue!, agents, 0),
                                          style: const TextStyle(
                                              color: Color(0xff181414),
                                              fontFamily: 'couture'),
                                        ),
                                        content: Text(
                                          fn5c(_selectedValue!, agents, 0),
                                          style: const TextStyle(
                                              color: Color(0xff181414),
                                              fontFamily: 'europa'),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Card(
                                  color: const Color(0xff181414),
                                  child: Row(
                                    children: [
                                      Image.network(
                                              fn5a(_selectedValue!, agents, 0))
                                          .p(5),
                                      SizedBox(
                                        width: 110,
                                        child: Text(
                                          fn5b(_selectedValue!, agents, 0),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'europa',
                                              fontSize: 14),
                                        ).pOnly(left: 6),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: (MediaQuery.of(context).size.width - 40) /
                                  2.0,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor:
                                            const Color(0xffece8e1),
                                        title: Text(
                                          fn5b(_selectedValue!, agents, 1),
                                          style: const TextStyle(
                                              color: Color(0xff181414),
                                              fontFamily: 'couture'),
                                        ),
                                        content: Text(
                                          fn5c(_selectedValue!, agents, 1),
                                          style: const TextStyle(
                                              color: Color(0xff181414),
                                              fontFamily: 'europa'),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Card(
                                  color: const Color(0xff181414),
                                  child: Row(
                                    children: [
                                      Image.network(
                                              fn5a(_selectedValue!, agents, 1))
                                          .p(5),
                                      SizedBox(
                                        width: 110,
                                        child: Text(
                                          fn5b(_selectedValue!, agents, 1),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'europa',
                                              fontSize: 14),
                                        ).pOnly(left: 6),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: (MediaQuery.of(context).size.width - 40) /
                                  2.0,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor:
                                            const Color(0xffece8e1),
                                        title: Text(
                                          fn5b(_selectedValue!, agents, 2),
                                          style: const TextStyle(
                                              color: Color(0xff181414),
                                              fontFamily: 'couture'),
                                        ),
                                        content: Text(
                                          fn5c(_selectedValue!, agents, 2),
                                          style: const TextStyle(
                                              color: Color(0xff181414),
                                              fontFamily: 'europa'),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Card(
                                  color: const Color(0xff181414),
                                  child: Row(
                                    children: [
                                      Image.network(
                                              fn5a(_selectedValue!, agents, 2))
                                          .p(5),
                                      SizedBox(
                                        width: 110,
                                        child: Text(
                                          fn5b(_selectedValue!, agents, 2),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'europa',
                                              fontSize: 14),
                                        ).pOnly(left: 6),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: (MediaQuery.of(context).size.width - 40) /
                                  2.0,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor:
                                            const Color(0xffece8e1),
                                        title: Text(
                                          fn5b(_selectedValue!, agents, 3),
                                          style: const TextStyle(
                                              color: Color(0xff181414),
                                              fontFamily: 'couture'),
                                        ),
                                        content: Text(
                                          fn5c(_selectedValue!, agents, 3),
                                          style: const TextStyle(
                                              color: Color(0xff181414),
                                              fontFamily: 'europa'),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Card(
                                  color: const Color(0xff181414),
                                  child: Row(
                                    children: [
                                      Image.network(
                                              fn5a(_selectedValue!, agents, 3))
                                          .p(5),
                                      SizedBox(
                                        width: 110,
                                        child: Text(
                                          fn5b(_selectedValue!, agents, 3),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'europa',
                                              fontSize: 14),
                                        ).pOnly(left: 6),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ).pOnly(left: 20, right: 20);
  }
}

String fn1(String selectedValue, List<Agents> agents) {
  for (int i = 0; i < agents.length; i++) {
    if (agents[i].displayName == selectedValue) {
      return agents[i].background;
    }
  }
  return "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Valorant_logo_-_pink_color_version.svg/2560px-Valorant_logo_-_pink_color_version.svg.png";
}

String fn2(String selectedValue, List<Agents> agents) {
  for (int i = 0; i < agents.length; i++) {
    if (agents[i].displayName == selectedValue) {
      return agents[i].fullPortrait;
    }
  }
  return "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Valorant_logo_-_pink_color_version.svg/2560px-Valorant_logo_-_pink_color_version.svg.png";
}

String fn3(String selectedValue, List<Agents> agents) {
  for (int i = 0; i < agents.length; i++) {
    if (agents[i].displayName == selectedValue) {
      return agents[i].role['displayName'];
    }
  }
  return "Role";
}

String fn4(String selectedValue, List<Agents> agents) {
  for (int i = 0; i < agents.length; i++) {
    if (agents[i].displayName == selectedValue) {
      return agents[i].description;
    }
  }
  return "Description";
}

String fn5a(String selectedValue, List<Agents> agents, int k) {
  for (int i = 0; i < agents.length; i++) {
    if (agents[i].displayName == selectedValue) {
      return agents[i].abilities[k]['displayIcon'];
    }
  }
  return "https://media.valorant-api.com/agents/dade69b4-4f5a-8528-247b-219e5a1facd6/abilities/ability1/displayicon.png";
}

String fn5b(String selectedValue, List<Agents> agents, int k) {
  for (int i = 0; i < agents.length; i++) {
    if (agents[i].displayName == selectedValue) {
      return agents[i].abilities[k]['displayName'];
    }
  }
  return "Ability";
}

String fn5c(String selectedValue, List<Agents> agents, int k) {
  for (int i = 0; i < agents.length; i++) {
    if (agents[i].displayName == selectedValue) {
      return agents[i].abilities[k]['description'];
    }
  }
  return "Ability";
}

String fn6(String selectedValue, List<Agents> agents) {
  for (int i = 0; i < agents.length; i++) {
    if (agents[i].displayName == selectedValue) {
      return agents[i].voiceLine['mediaList'][0]["wave"].toString();
    }
  }
  return agents[0].voiceLine['mediaList']['wave'];
}

ElevatedButton yourAgentsButton() {
  return ElevatedButton(
    onPressed: () {
      launchURL("https://playvalorant.com/en-gb/agents/");
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
            'YOUR AGENTS',
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

class Agents {
  final dynamic displayName,
      description,
      developerName,
      displayIcon,
      fullPortrait,
      background,
      role,
      abilities,
      voiceLine;

  Agents(
      this.displayName,
      this.description,
      this.developerName,
      this.displayIcon,
      this.fullPortrait,
      this.background,
      this.role,
      this.abilities,
      this.voiceLine);
}
