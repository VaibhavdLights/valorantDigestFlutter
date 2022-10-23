import 'package:flutter/material.dart';
import 'package:valorant_db/widgets/appbar.dart';
import 'package:valorant_db/widgets/skins_page_widgets/skinspage_body.dart';

class SkinsPage extends StatefulWidget {
  const SkinsPage({Key? key}) : super(key: key);

  @override
  State<SkinsPage> createState() => _SkinsPageState();
}

class _SkinsPageState extends State<SkinsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar(),
      body: const SingleChildScrollView(
        child: SkinsBody(),
      ),
      backgroundColor: const Color(0xffece8e1),
    );
  }
}
