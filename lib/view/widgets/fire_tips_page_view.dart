import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: PageView(
                controller: _pageController,
                children: [
                  Lottie.asset("assets/json_images/tips.json"),
                  Lottie.asset("assets/json_images/tips.json"),
                  Lottie.asset("assets/json_images/tips1.json",
                      width: 100, height: 100),
                ],
              ),
            ),
          ),
          // SizedBox(height: 20),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: JumpingDotEffect(
              activeDotColor: Colors.orange[900]!,
              spacing: 20,
              verticalOffset: 20,
            ),
          ),
        ],
      ),
    );
  }
}
