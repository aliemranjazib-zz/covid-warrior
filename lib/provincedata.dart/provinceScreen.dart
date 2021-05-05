import 'package:covidpk/constant.dart';
import 'package:covidpk/covidapidata/providers/apiProvider.dart';
import 'package:covidpk/drawer/adddrawer.dart';
import 'package:covidpk/provincedata.dart/provincewidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProvincesScreen extends StatefulWidget {
  static const String routeName = 'provincescreen';
  @override
  _ProvincesScreenState createState() => _ProvincesScreenState();
}

class _ProvincesScreenState extends State<ProvincesScreen> {
  @override
  void initState() {
    super.initState();
    final pmodel = Provider.of<CovidApi>(context, listen: false);
    pmodel.getprovincedata(context);
  }

  @override
  Widget build(BuildContext context) {
    final pmodel = Provider.of<CovidApi>(context);

    final style = TextStyle(fontSize: 25);
    return SafeArea(
      child: Scaffold(
        drawer: ClipPath(
          clipper: MyCustomClipper(),
          child: AppDrawer(),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Available Plasma',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.green),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Federal and Provincial Stats",
                style: style,
              ),
            ),
            pmodel.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        itemCount: pmodel.p.historicData.historicData.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = pmodel.p.historicData.historicData[index];
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      '${data.provinceStateName}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ProvinceWidget(
                                            postitiveCasesCount:
                                                data.peoplePositiveCasesCt,
                                            postitiveCases: 'Positive Cases : ',
                                            recovered: 'recovered',
                                            recoveredCount: data.recoveredCt,
                                            death: 'death',
                                            deathCount: data.deathCt,
                                            tileColor: kPrimaryColor),
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
