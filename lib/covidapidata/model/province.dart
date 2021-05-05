import 'dart:convert';

Provice proviceFromJson(String str) => Provice.fromJson(json.decode(str));

String proviceToJson(Provice data) => json.encode(data.toJson());

class Provice {
  Provice({
    this.historicData,
  });

  HistoricData historicData;

  factory Provice.fromJson(Map<String, dynamic> json) => Provice(
        historicData: HistoricData.fromJson(json["historicData"]),
      );

  Map<String, dynamic> toJson() => {
        "historicData": historicData.toJson(),
      };
}

class HistoricData {
  HistoricData({
    this.historicData,
  });

  List<HistoricDatum> historicData;

  factory HistoricData.fromJson(Map<String, dynamic> json) => HistoricData(
        historicData: List<HistoricDatum>.from(
            json["historicData"].map((x) => HistoricDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "historicData": List<dynamic>.from(historicData.map((x) => x.toJson())),
      };
}

class HistoricDatum {
  HistoricDatum({
    this.provinceStateName,
    this.peoplePositiveCasesCt,
    this.deathCt,
    this.recoveredCt,
    this.countryShortName,
    // this.date,
  });

  String provinceStateName;
  int peoplePositiveCasesCt;
  int deathCt;
  int recoveredCt;
  CountryShortName countryShortName;
  //DateTime date;

  factory HistoricDatum.fromJson(Map<String, dynamic> json) => HistoricDatum(
        provinceStateName: json["provinceStateName"],
        peoplePositiveCasesCt: json["peoplePositiveCasesCt"],
        deathCt: json["deathCt"],
        recoveredCt: json["recoveredCt"],
        countryShortName: countryShortNameValues.map[json["countryShortName"]],
        // date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "provinceStateName": provinceStateName,
        "peoplePositiveCasesCt": peoplePositiveCasesCt,
        "deathCt": deathCt,
        "recoveredCt": recoveredCt,
        "countryShortName": countryShortNameValues.reverse[countryShortName],
      };
}

enum CountryShortName { PAKISTAN }

final countryShortNameValues =
    EnumValues({"Pakistan": CountryShortName.PAKISTAN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
