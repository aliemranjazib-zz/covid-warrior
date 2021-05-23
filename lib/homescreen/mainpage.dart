import 'package:covidpk/constant.dart';
import 'package:covidpk/covidapidata/providers/apiProvider.dart';
import 'package:covidpk/drawer/adddrawer.dart';
import 'package:covidpk/homescreen/TextData.dart';
import 'package:covidpk/homescreen/counter.dart';
import 'package:covidpk/homescreen/selfttestwidget.dart';
import 'package:covidpk/mapsdata/mapsscreen.dart';
import 'package:covidpk/plasmadonation.dart/LoginScreen.dart';
import 'package:covidpk/plasmadonation.dart/AllPlasma.dart';
import 'package:covidpk/routes.dart';
import 'package:covidpk/selfTest/checkyouCovidScreen.dart';
import 'package:covidpk/widget_screens.dart/topic_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/MainPage';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String formatDate(DateTime date) => new DateFormat("MMMM d").format(date);
  @override
  void initState() {
    super.initState();
    final postMdl = Provider.of<CovidApi>(context, listen: false);
    postMdl.getPostData(context);
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<CovidApi>(context);

    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'HOME PAGE',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.green),
        ),
        body: SingleChildScrollView(
          // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          // width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TopicPageView(),
              SizedBox(height: 20),
              SingleChildScrollView(
                child: postMdl.loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "PAKISTAN CASES",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text('Stay Home Stay Safe'),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Case Update\n",
                                          style: kTitleTextstyle,
                                        ),
                                        TextSpan(
                                          text:
                                              "Last Updated on ${formatDate(DateTime.now())}",
                                          style: TextStyle(
                                            color: kTextLightColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(Routes.provincePage);
                                    },
                                    child: Text(
                                      "See details",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 30,
                                      color: kShadowColor,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Counter(
                                      color: kInfectedColor,
                                      number: postMdl.homeStats.cases,
                                      title: "CASES",
                                    ),
                                    Counter(
                                      color: kDeathColor,
                                      number: postMdl.homeStats.active,
                                      title: "ACTIVE",
                                    ),
                                    Counter(
                                      color: kRecovercolor,
                                      number: postMdl.homeStats.recovered,
                                      title: "RECOVERED",
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextData(
                                    title: "Today Death",
                                    number: postMdl.homeStats.todayDeaths,
                                    color: kDeathColor,
                                  ),
                                  TextData(
                                    title: "Today Cases",
                                    number: postMdl.homeStats.todayCases,
                                    color: kPrimaryColor,
                                  ),
                                  TextData(
                                    title: "Critcial",
                                    number: postMdl.homeStats.critical,
                                    color: kPrimaryColor,
                                  ),
                                ],
                              ),
                              SelftTest(
                                  title: "Self Checker Covid Test",
                                  c: Colors.red,
                                  onpressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.agreenmentScreen);
                                  }),
                              SelftTest(
                                  title: "Donate or Search Plasma",
                                  c: Colors.green,
                                  onpressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => LoginScreen()));
                                  }),
                              SelftTest(
                                  title: "Covid Vaccination ",
                                  c: Colors.blue,
                                  onpressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.mapsPage);
                                  }),
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ));
  }
}
