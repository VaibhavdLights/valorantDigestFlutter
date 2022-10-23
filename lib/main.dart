import 'package:flutter/material.dart';
import 'package:valorant_db/pages/about_page.dart';
import 'package:valorant_db/pages/agents_page.dart';
import 'package:valorant_db/pages/maps_page.dart';
import 'package:valorant_db/pages/skins_page.dart';
import 'package:valorant_db/pages/weapons_page.dart';
import 'package:valorant_db/widgets/agentspage_widgets/agents_detail.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        "/home": (context) => const HomePage(),
        "/about": (context) => const AboutPage(),
        "/agents": (context) => const AgentsPage(),
        "/agentsDetail": (context) => const AgentsSelect(),
        "/maps": (context) => const MapsPage(),
        "/weapons": (context) => const WeaponsPage(),
        "/skins": (context) => const SkinsPage(),
      },
    );
  }
}
