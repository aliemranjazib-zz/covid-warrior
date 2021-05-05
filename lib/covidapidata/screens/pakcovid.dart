import 'package:covidpk/covidapidata/providers/apiProvider.dart';
import 'package:covidpk/covidapidata/widgets/pktile.dart';
import 'package:covidpk/drawer/adddrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PakCovidScreen extends StatefulWidget {
  static const String routeName = '/PakCovidScreen';

  @override
  _PakCovidScreenState createState() => _PakCovidScreenState();
}

class _PakCovidScreenState extends State<PakCovidScreen> {
  @override
  void initState() {
    super.initState();
    final postMdl = Provider.of<CovidApi>(context, listen: false);
    postMdl.getPostData(context);
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<CovidApi>(context);
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'PAKISTAN CASES',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.green),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: postMdl.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Flag(),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          HomeTile(
                            caseCount: postMdl.homeStats.cases,
                            infoHeader: 'Cases',
                            tileColor: Colors.blueAccent,
                          ),
                          HomeTile(
                            caseCount: postMdl.homeStats.todayCases,
                            infoHeader: 'todayCases',
                            tileColor: Colors.green,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          HomeTile(
                            caseCount: postMdl.homeStats.deaths,
                            infoHeader: 'deaths',
                            tileColor: Colors.redAccent,
                          ),
                          HomeTile(
                            caseCount: postMdl.homeStats.todayDeaths,
                            infoHeader: 'todayDeaths',
                            tileColor: Colors.orangeAccent,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          HomeTile(
                            caseCount: postMdl.homeStats.recovered,
                            infoHeader: 'recovered',
                            tileColor: Colors.pinkAccent,
                          ),
                          HomeTile(
                            caseCount: postMdl.homeStats.active,
                            infoHeader: 'active',
                            tileColor: Colors.purpleAccent,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          HomeTile(
                            caseCount: postMdl.homeStats.critical,
                            infoHeader: 'critical',
                            tileColor: Colors.indigoAccent,
                          ),
                          HomeTile(
                            caseCount: postMdl.homeStats.casesPerOneMillion,
                            infoHeader: 'casesPerOneMill',
                            tileColor: Colors.cyanAccent,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          HomeTile(
                            caseCount: postMdl.homeStats.deathsPerOneMillion,
                            infoHeader: 'deathsPerOnMIll',
                            tileColor: Colors.deepPurpleAccent,
                          ),
                          HomeTile(
                            caseCount: postMdl.homeStats.totalTests,
                            infoHeader: 'totalTests',
                            tileColor: Colors.purpleAccent,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 90,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class Flag extends StatelessWidget {
  String emoji() {
    int flagOffset = 0x1F1E6;
    int asciiOffset = 0x41;

    String country = "PK";

    int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
    int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;

    String emoji =
        String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
    return emoji;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "${emoji()}",
          style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.1),
        ),
        Text(
          "PAKISTAN",
          style: TextStyle(
              fontFamily: 'MyFont',
              fontSize: MediaQuery.of(context).size.height * 0.05),
        ),
      ],
    );
  }
}

enum CaseType { confirmed, deaths, recovered, sick }

class LinearCases {
  final int type;
  final int count;
  final int total;
  final String text;

  LinearCases(this.type, this.count, this.total, this.text);
}
