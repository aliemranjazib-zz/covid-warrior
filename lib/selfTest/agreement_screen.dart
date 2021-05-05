import 'dart:ui';

import 'package:covidpk/constant.dart';
import 'package:covidpk/selfTest/first_test.dart';
import 'package:flutter/material.dart';

class AgreementScreen extends StatelessWidget {
  static const routeNamwe = 'agreementScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                  'https://www.gstatic.com/health-screeners/Mobile_warm_welcome_2.png'),
              Text(
                "COVID‑19 self‑assessment",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'This resource can help you decide what kind of medical care you might need for COVID‑19.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.note_add_outlined),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "For informational purposes only",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Not a medical diagnosis")
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.security),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Private and secure",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Your answers aren't collected or shared")
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    minWidth: 150,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('I don\'t agree'),
                  ),
                  MaterialButton(
                    minWidth: 150,
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => FirstTest()));
                    },
                    child: Text(
                      'I agree',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
