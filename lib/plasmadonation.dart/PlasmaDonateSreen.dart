import 'package:covidpk/plasmadonation.dart/blood_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class PlasmaDonateSreen extends StatelessWidget {
  static const String routeName = '/PlasmaDonateSreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ChatScreen(),

      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return PlasmaUi();
            }
            return BloodForm();
          }),
    );
  }
}
