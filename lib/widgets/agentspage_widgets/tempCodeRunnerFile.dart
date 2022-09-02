import 'package:flutter/material.dart';
import 'package:valorant_db/widgets/appbar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AgentsSelect extends StatefulWidget {
  const AgentsSelect({Key? key}) : super(key: key);

  @override
  State<AgentsSelect> createState() => _AgentsSelectState();
}

class _AgentsSelectState extends State<AgentsSelect> {
  String url = "https://valorant-api.com/v1/agents";
  List<Agents> agentDetail = [];
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
          Agents agent = Agents(
              i['displayName'],
              i['description'],
              i['developerName'],
              i['fullPortrait'],
              i['displayIconSmall'],
              i['background'],
              i['backgroundGradientColors'],
              i['role'],
              i['abilities']);
          agentDetail.add(agent);
        }
      }
      isLoaded = true;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffece8e1),
      appBar: myAppBar(),
      body: ListView.builder(
        itemCount: agentDetail.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.0,
            color: Color(int.parse(
                "0xff" + agentDetail[index].backgroundGradientColors[3],
                radix: 16)),
            child: ListTile(
              leading: Image.network(agentDetail[index].displayIcon),
            ),
          );
        },
      ),
    );
  }
}

class Agents {
  final dynamic displayName,
      description,
      developerName,
      fullPortrait,
      displayIcon,
      background,
      backgroundGradientColors,
      role,
      abilities;

  Agents(
      this.displayName,
      this.description,
      this.developerName,
      this.fullPortrait,
      this.background,
      this.backgroundGradientColors,
      this.role,
      this.abilities,
      this.displayIcon);
}
