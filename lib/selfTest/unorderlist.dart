import 'dart:ui';

import 'package:flutter/material.dart';

class UnorderedList extends StatelessWidget {
  UnorderedList(this.texts);
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(UnorderedListItem(text));
      // Add space between items
      widgetList.add(SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  UnorderedListItem(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Icon(
          //   Icons.arrow_forward_ios,
          //   size: 20,
          // ),
          // SizedBox(
          //   width: 10,
          // ),
          Text(
            "○  ",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
