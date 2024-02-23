import 'package:flutter/material.dart';
import '../widgets/custonm_expanTile_widget.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});
  static const String id = 'SafetyScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("SafetyScreen"),
      ),
      body: const CwstomExpansionTile(),
    );
  }
}
