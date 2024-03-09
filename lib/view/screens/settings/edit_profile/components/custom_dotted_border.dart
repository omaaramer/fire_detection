import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CustomDottedBorder extends StatelessWidget {
  const CustomDottedBorder({
    super.key,
    required this.url,
    required this.onPressed,
    required this.onTap,
  });
  final void Function() onPressed;
  final String? url;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      dashPattern: const [7, 7],
      color: Colors.black38,
      strokeWidth: 2,
      // padding: EdgeInsets.fromLTRB(115, 37, 115, 37),
      padding: const EdgeInsets.fromLTRB((75), (25), (75), (25)),
      child: Container(
        height: 70,
        width: 70,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
            boxShadow: [
              BoxShadow(spreadRadius: 6, color: Colors.black38),
            ]),
        child: url == null
            ? IconButton(
                icon: const Icon(
                  Icons.upload_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: onPressed,
              )
            : InkWell(
                onTap: onTap,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.network(
                    url!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      ),
    );
  }
}
