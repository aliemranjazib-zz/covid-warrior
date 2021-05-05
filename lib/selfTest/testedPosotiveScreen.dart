import 'package:covidpk/homescreen/mainpage.dart';
import 'package:covidpk/selfTest/unorderlist.dart';
import 'package:covidpk/widget_screens.dart/topic_page_view.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class TestPositiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headerStyle = TextStyle(fontSize: 20);
    final headerStyle1 = TextStyle(fontSize: 18);
    final headerStyle2 = TextStyle(fontSize: 15);
    final headerStyle3 = TextStyle(color: Colors.blue);

    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.dangerous_sharp,
                    size: 70,
                    color: Colors.red,
                  ),
                ),
                Text(
                  'Based on your symptoms, you may need urgent medical care.',
                  style: headerStyle,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Text(
                  'Please call 1166 or go to the nearest emergency department.',
                  style: headerStyle1,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 15),
                Text(
                  'Steps to follow every day:',
                  style: headerStyle3,
                ),
                SizedBox(height: 5),
                UnorderedList([
                  "Wear a mask over your nose and mouth.",
                  "Stay at least 6 feet away from people who don’t live with you.",
                  'Avoid crowded areas and poorly ventilated spaces.',
                  'Wash your hands often with soap and water, or use hand sanitizer with at least 60% alcohol',
                ]),
                Text(
                  "For more info",
                  style: headerStyle3,
                ),
                TopicPageView(),
                MaterialButton(
                  minWidth: double.infinity,
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => MainPage()));
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
