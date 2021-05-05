import 'package:covidpk/constant.dart';
import 'package:flutter/material.dart';

class SelftTest extends StatelessWidget {
  final VoidCallback onpressed;
  final Color c;
  final String title;

  const SelftTest(
      {Key key,
      @required this.onpressed,
      @required this.c,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: c, borderRadius: BorderRadiusDirectional.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COVID-19',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
