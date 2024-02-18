import 'package:flutter/material.dart';

import '../widgets/custonm_expanTile_widget.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});
  static String id = 'SafetyScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SafetyScreen"),
      ),
      body: const CwstomExpansionTile(),
    );
  }
}
