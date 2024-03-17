import 'package:chat_app/view/screens/Auth/widgets/logo_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../constants/constants.dart';
import 'home_page_in_fire_state.dart';
import 'home_page_in_safe_state.dart';
import 'widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _safeState = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGrey,
        title: CustomAppBar(
          onPressed: () {
            _safeState = !_safeState;
            setState(() {});
          },
        ),
      ),
      body: Container(
        color: kGrey,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: _safeState
            ? const HomePageInSafeState()
            : const HomePageInFireState(),
      ),
    );
  }
}
