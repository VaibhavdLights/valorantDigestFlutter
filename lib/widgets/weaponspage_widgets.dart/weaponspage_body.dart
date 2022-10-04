import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shadow/shadow.dart';

class WeaponsBody extends StatefulWidget {
  const WeaponsBody({Key? key}) : super(key: key);

  @override
  State<WeaponsBody> createState() => _WeaponsBodyState();
}

class _WeaponsBodyState extends State<WeaponsBody> {
  String url = "https://valorant-api.com/v1/weapons";
  List<Weapons> weapons = [];
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
        if (i['displayName'] != null) {
          Weapons weaponsData = Weapons(i['displayName'], i['category'],
              i['displayIcon'], i['weaponStats'], i['shopData']);
          weapons.add(weaponsData);
        }
      }
      isLoaded = true;
      _selectedValue = weapons[0].displayName;
    });
    return "Success";
  }

  @override
  void dispose() {
    super.dispose();
  }
  // _WeaponsBodyState() {
  //   _selectedValue = weapons[0].displayName;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: const Text(
            "CHOOSE YOUR\nWEAPON",
            style: TextStyle(
                fontFamily: 'zuume',
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xff15232b)),
          ).pOnly(top: 10),
        ),
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
            labelText: "Weapons",
            contentPadding: EdgeInsets.all(10),
            hintText: "Choose Weapon",
            prefixIcon: Icon(Icons.gamepad_rounded),
            border: OutlineInputBorder(),
          ),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffece8e1),
          ),
          // dropdownPadding: const EdgeInsets.only(right: 20),
          items: weapons
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
              const Text(
                "WEAPON DETAILS",
                style: TextStyle(fontFamily: 'couture'),
              ).pOnly(left: 20),
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width - 20,
                child: GestureDetector(
                  onTap: () {
                    launchURL("https://playvalorant.com/en-us/arsenal/");
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
                                  weaponIMG(_selectedValue, weapons))),
                        ).pOnly(top: 20, left: 10),
                        const SizedBox(
                          height: 10,
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
                        Container(
                          child: Text(
                            weaponCost(_selectedValue, weapons),
                            style: const TextStyle(
                                fontFamily: 'europa',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ).pOnly(left: 20),
                        ).pOnly(bottom: 6),
                        Container(
                          child: Text(
                            weaponCategory(_selectedValue, weapons),
                            style: const TextStyle(
                                fontFamily: 'valorant',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ).pOnly(left: 20),
                        ).pOnly(bottom: 4),
                        Container(
                          child: Text(
                            weaponMag(_selectedValue, weapons),
                            style: const TextStyle(
                                fontFamily: 'valorant',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
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
              Stack(
                children: [
                  Column(
                    children: [
                      // const SizedBox(
                      //   height: 34,
                      // ),
                      Container(
                        height: 100,
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
                      height: 110,
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "Riot’s five-vs-five tactical shooter has a diverse arsenal of weapons to encourage constant action and jam-jacked, nail-biting, adrenaline-pumping gameplay.",
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
              const Text(
                "Hit a headshot and your enemy is dead.",
                style: TextStyle(fontFamily: 'europa', fontSize: 18),
              ).p(10),
            ],
          ),
        ),
      ],
    ).pOnly(left: 20, right: 20);
  }
}

String weaponIMG(String? selectedValue, List<Weapons> weapons) {
  for (int i = 0; i < weapons.length; i++) {
    if (weapons[i].displayName == selectedValue) return weapons[i].displayIcon;
  }
  return "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Valorant_logo_-_pink_color_version.svg/2560px-Valorant_logo_-_pink_color_version.svg.png";
}

String weaponCategory(String? selectedValue, List<Weapons> weapons) {
  for (int i = 0; i < weapons.length; i++) {
    if (weapons[i].displayName == selectedValue) {
      return "Category :: ${weapons[i].category.toString().substring(21, weapons[i].category.toString().length)}";
    }
  }
  return "Category :: Weapon";
}

String weaponMag(String? selectedValue, List<Weapons> weapons) {
  for (int i = 0; i < weapons.length; i++) {
    if (weapons[i].displayName == selectedValue && selectedValue != "Melee") {
      return "Magazine Size :: ${weapons[i].weaponStats["magazineSize"]}";
    }
  }
  return "Magazine Size :: 0";
}

String weaponCost(String? selectedValue, List<Weapons> weapons) {
  for (int i = 0; i < weapons.length; i++) {
    if (weapons[i].displayName == selectedValue && selectedValue != "Melee") {
      return "Cost - ${weapons[i].shopData["cost"]}";
    }
  }
  return "Cost - 0";
}

class Weapons {
  final dynamic displayName, category, displayIcon, weaponStats, shopData;

  Weapons(this.displayName, this.category, this.displayIcon, this.weaponStats,
      this.shopData);
}

launchURL(String url) async {
  // ignore: deprecated_member_use
  await launch(url, forceWebView: true, enableJavaScript: true);
}
