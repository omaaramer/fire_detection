import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/custonm_expanTile_widget.dart';
import '../widgets/fire_tips_page_view.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});
  static const String id = 'SafetyScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey300,
      body: ListView(
        children: const [
          FireTipsPageView(),
          SizedBox(height: 50),
          CwstomExpansionTile(),
        ],
      ),
    );
  }
}
