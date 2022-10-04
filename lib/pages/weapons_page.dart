import 'package:flutter/material.dart';
import 'package:valorant_db/widgets/appbar.dart';
import 'package:valorant_db/widgets/weaponspage_widgets.dart/weaponspage_body.dart';

class WeaponsPage extends StatefulWidget {
  const WeaponsPage({Key? key}) : super(key: key);

  @override
  State<WeaponsPage> createState() => _WeaponsPageState();
}

class _WeaponsPageState extends State<WeaponsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: const SingleChildScrollView(child: WeaponsBody()),
      backgroundColor: const Color(0xffece8e1),
    );
  }
}
