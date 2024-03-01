import 'package:chat_app/view/widgets/logo_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../constants/constants.dart';
import 'home_page_in_fire_state.dart';
import 'home_page_in_safe_state.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const LogoText(),
            IconButton(
                onPressed: () {
                  _safeState = !_safeState;
                  setState(() {});
                },
                icon: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black.withOpacity(.2),
                  ),
                  child: const Icon(
                    Icons.fireplace_outlined,
                    color: Colors.white,
                  ),
                )),
          ],
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
