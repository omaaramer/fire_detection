import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomSlideAction extends StatelessWidget {
  final String _phoneNumber = "911";
  const CustomSlideAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SlideAction(
        outerColor: Colors.black.withOpacity(.2),
        elevation: 0,
        sliderButtonIconPadding: 14,
        textStyle: const TextStyle(
          color: kGrey300,
          fontSize: 18,
        ),
        sliderButtonIcon: const Icon(
          Icons.phone,
          color: Colors.green,
          size: 30,
        ),
        text: "  Call Emeregency",
        onSubmit: () async {
          final call = 'tel:$_phoneNumber';
          await launchUrlString(call);
        },
      ),
    );
  }
}
