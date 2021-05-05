import 'package:covidpk/constant.dart';
import 'package:flutter/material.dart';

class TextData extends StatelessWidget {
  final String title;
  final int number;
  final Color color;

  const TextData({Key key, this.title, this.number, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            '$number',
            style: TextStyle(
              fontSize: 20,
              color: color,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(title, style: kSubTextStyle),
        ),
      ],
    );
  }
}
