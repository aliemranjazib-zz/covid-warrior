import 'dart:io';

import 'package:covidpk/covidapidata/screens/pakcovid.dart';
import 'package:covidpk/homescreen/mainpage.dart';
import 'package:covidpk/plasmadonation.dart/chat_screen.dart';
import 'package:covidpk/provincedata.dart/provinceScreen.dart';
import 'package:covidpk/routes.dart';
import 'package:covidpk/selfTest/agreement_screen.dart';
import 'package:covidpk/selfTest/checkyouCovidScreen.dart';
import 'package:covidpk/widget_screens.dart/link_details_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'covidapidata/providers/apiProvider.dart';
import 'mapsdata/mapsscreen.dart';

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<CovidApi>(create: (_) => CovidApi()),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => CovidApi(),
      child: FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
                debugShowCheckedModeBanner: false, home: SplashScreen());
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Covid pk',
              theme: ThemeData(
                primarySwatch: Colors.green,
              ),
              //home: ProvincesScreen(),
              home: MainPage(),
              routes: {
                Routes.mainPage: (context) => MainPage(),
                Routes.pakCovidPage: (context) => PakCovidScreen(),
                Routes.mapsPage: (context) => MapsScreen(),
                Routes.chatPage: (context) => PlasmaUi(),
                Routes.provincePage: (context) => ProvincesScreen(),
                Routes.selftTest: (context) => CheckyourCovidScreen(),
                Routes.agreenmentScreen: (context) => AgreementScreen(),
                LinkDetailsScreen.routeName: (BuildContext ct) =>
                    LinkDetailsScreen()
              },
            );
          }
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.bloodtype,
          color: Colors.red,
          size: MediaQuery.of(context).size.width * 0.785,
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
