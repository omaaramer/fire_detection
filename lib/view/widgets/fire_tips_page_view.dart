import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/constants.dart';

class FireTipsPageView extends StatefulWidget {
  const FireTipsPageView({
    super.key,
  });

  @override
  State<FireTipsPageView> createState() => _FireTipsPageViewState();
}

class _FireTipsPageViewState extends State<FireTipsPageView> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGrey300,
      padding: const EdgeInsets.all(30),
      height: 400,
      child: PageView(
        controller: _pageController,
        children: [
          Lottie.asset("assets/json_images/tips.json"),
          Lottie.asset("assets/json_images/tips1.json",
              width: 100, height: 100),
        ],
      ),
    );
  }
}
