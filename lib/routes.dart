import 'package:covidpk/covidapidata/screens/pakcovid.dart';
import 'package:covidpk/homescreen/mainpage.dart';
import 'package:covidpk/plasmadonation.dart/PlasmaDonateSreen.dart';
import 'package:covidpk/plasmadonation.dart/chat_screen.dart';
import 'package:covidpk/provincedata.dart/provinceScreen.dart';
import 'package:covidpk/selfTest/agreement_screen.dart';
import 'package:covidpk/selfTest/checkyouCovidScreen.dart';
import 'mapsdata/mapsscreen.dart';

class Routes {
  static const String mainPage = MainPage.routeName;
  static const String pakCovidPage = PakCovidScreen.routeName;
  static const String mapsPage = MapsScreen.routeName;
  static const String chatPage = PlasmaUi.routeName;
  static const String provincePage = ProvincesScreen.routeName;
  static const String plasmaPage = PlasmaDonateSreen.routeName;
  static const String selftTest = CheckyourCovidScreen.routeName;
  static const String agreenmentScreen = AgreementScreen.routeNamwe;

  // static const String events = EventsPage.routeName;
  // static const String notes = NotesPage.routeName;
}
