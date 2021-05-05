import 'package:covidpk/selfTest/checkyouCovidScreen.dart';
import 'package:covidpk/selfTest/testedPosotiveScreen.dart';
import 'package:covidpk/selfTest/unorderlist.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class FirstTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headerStyle = TextStyle(fontSize: 25);
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.dangerous_sharp,
                    size: 70,
                    color: Colors.red,
                  ),
                ),
                Text(
                  'Do you have any of these life‑threatening symptoms?',
                  style: headerStyle,
                ),
                UnorderedList([
                  "Pale, gray, or blue-colored skin, lips, or nail beds, depending on skin tone",
                  "Severe and constant pain or pressure in the chest",
                  'Extreme difficulty breathing (such as gasping for air, being unable to talk without catching your breath, severe wheezing, nostrils flaring)',
                  'New disorientation (acting confused)',
                  'Unconscious or very difficult to wake up',
                  'Slurred speech or difficulty speaking (new or worsening)',
                  'New or worsening seizures',
                  'Signs of low blood pressure (too weak to stand, dizziness, lightheaded, feeling cold, pale, clammy skin)',
                  'Dehydration (dry lips and mouth, not urinating much, sunken eyes)'
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      minWidth: 150,
                      color: kPrimaryColor,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => TestPositiveScreen()));
                      },
                      child: Text(
                        'YES',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      minWidth: 150,
                      color: kDeathColor,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => CheckyourCovidScreen()));
                      },
                      child: Text(
                        'NO',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
