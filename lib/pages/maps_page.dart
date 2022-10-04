import 'package:flutter/material.dart';
import 'package:valorant_db/widgets/appbar.dart';
import 'package:valorant_db/widgets/mapspage_widgets/mapspage_body.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: const SingleChildScrollView(child: const MapsBody()),
      backgroundColor: const Color(0xffece8e1),
    );
  }
}
