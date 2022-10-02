import 'package:flutter/material.dart';
import 'package:valorant_db/pages/about_page.dart';
import 'package:valorant_db/pages/agents_page.dart';
import 'package:valorant_db/pages/learn_page.dart';
import 'package:valorant_db/pages/maps_page.dart';
import 'package:valorant_db/pages/weapons_page.dart';
import 'package:valorant_db/widgets/agentspage_widgets/agents_detail.dart';
import 'package:valorant_db/widgets/learnpage_widgets/gamemodes.dart';
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
        "/learn": (context) => const LearnPage(),
        "/gamemode": (context) => const GameModes(),
        "/agents": (context) => const AgentsPage(),
        "/agentsDetail": (context) => const AgentsSelect(),
        "/maps": (context) => const MapsPage(),
        "/weapons": (context) => const WeaponsPage(),
      },
    );
  }
}
