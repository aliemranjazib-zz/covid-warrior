import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProvinceWidget extends StatelessWidget {
  final int postitiveCasesCount;
  final String postitiveCases;
  final int recoveredCount;
  final String recovered;
  final String death;
  final int deathCount;
  final Color tileColor;

  ProvinceWidget({
    @required this.postitiveCasesCount,
    @required this.postitiveCases,
    @required this.recovered,
    @required this.recoveredCount,
    @required this.death,
    @required this.deathCount,
    @required this.tileColor,
  });
  final formatter = NumberFormat("###,###");
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: tileColor,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.04),
        width: width * 0.45,
        height: height * 0.20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "COVID-19 Pakistan",
              style: TextStyle(
                  fontFamily: 'MyFont',
                  color: Colors.white,
                  fontSize: height * 0.015),
            ),
            SizedBox(height: height * 0.007),
            Row(
              children: [
                Text("$postitiveCases : ",
                    style: TextStyle(
                        fontFamily: 'MyFont',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.02)),
                Text("${formatter.format(postitiveCasesCount)}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.025,
                        fontFamily: 'MyFont')),
              ],
            ),
            Row(
              children: [
                Text("$recovered : ",
                    style: TextStyle(
                        fontFamily: 'MyFont',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.02)),
                Text("${formatter.format(recoveredCount)}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.025,
                        fontFamily: 'MyFont')),
              ],
            ),
            Row(
              children: [
                Text("$death : ",
                    style: TextStyle(
                        fontFamily: 'MyFont',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.02)),
                Text("${formatter.format(deathCount)}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.025,
                        fontFamily: 'MyFont')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
