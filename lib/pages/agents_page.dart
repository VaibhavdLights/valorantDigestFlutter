import 'package:flutter/material.dart';
import 'package:valorant_db/widgets/agentspage_widgets/agentspage_body.dart';
import 'package:valorant_db/widgets/appbar.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({Key? key}) : super(key: key);

  @override
  State<AgentsPage> createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar(),
      body: const SingleChildScrollView(
        child: AgentsBody(),
      ),
      backgroundColor: const Color(0xffece8e1),
    );
  }
}
