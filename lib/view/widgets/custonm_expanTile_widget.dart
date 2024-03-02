import 'package:flutter/material.dart';
import '../../constants/expan_item_list.dart';

class CwstomExpansionTile extends StatefulWidget {
  const CwstomExpansionTile({super.key});

  @override
  State<CwstomExpansionTile> createState() => _CwstomExpansionTileState();
}

class _CwstomExpansionTileState extends State<CwstomExpansionTile> {
  // bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: kExpanList.length,
          itemBuilder: (_, index) {
            return CardExpansionTile(
              title: kExpanList[index]['title']!,
              content: kExpanList[index]["content"]!,
              subTitle: kExpanList[index]["subtitle"]!,
            );
          }),
    );
  }
}

class CardExpansionTile extends StatelessWidget {
  final String title, subTitle, content;
  const CardExpansionTile(
      {super.key,
      required this.title,
      required this.content,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            child: ExpansionTile(
              // backgroundColor: kGrey300,
              collapsedBackgroundColor: Colors.grey.shade300,
              backgroundColor: Colors.grey.shade200,
              iconColor: Colors.black,
              title: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                subTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              children: <Widget>[
                ListTile(title: Text(content)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
