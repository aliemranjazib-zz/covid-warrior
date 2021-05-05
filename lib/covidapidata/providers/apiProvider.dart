import 'dart:convert';
import 'package:covidpk/covidapidata/model/homeservices.dart';
import 'package:covidpk/covidapidata/model/province.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

//https://localcoviddata.com/covid19/v1/cases/jhu?daysInPast=4&country=PAK

class CovidApi with ChangeNotifier {
  HomeStats homeStats = HomeStats();
  Provice p = Provice();
  bool loading = false;
  Future<HomeStats> getHomeCase(context) async {
    String url = 'https://coronavirus-19-api.herokuapp.com/countries/Pakistan';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      return HomeStats.fromJSON(json.decode(response.body));
    } else {
      throw Exception("Failed to load Post");
    }
  }

  Future<Provice> getProvince(context) async {
    String url =
        "https://localcoviddata.com/covid19/v1/cases/jhu?daysInPast=1&country=PAK";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      final data = jsonDecode(response.body);
      p = Provice.fromJson(data);
      print(p.historicData.historicData[0].countryShortName);
      return p;
    } else {
      throw Exception("faild to load provice data");
    }
  }

  getprovincedata(context) async {
    loading = true;
    p = await getProvince(context);
    loading = false;
    notifyListeners();
  }

  getPostData(context) async {
    loading = true;
    homeStats = await getHomeCase(context);
    loading = false;
    notifyListeners();
  }
}
