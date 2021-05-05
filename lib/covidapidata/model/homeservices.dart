class HomeStats {
  final int cases;
  final int todayCases;
  final int tested;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int totalTests;
  final int testsPerOneMillion;
  HomeStats(
      {this.cases,
      this.tested,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.testsPerOneMillion,
      this.totalTests});

  factory HomeStats.fromJSON(Map<String, dynamic> json) {
    return HomeStats(
        cases: json['cases'],
        tested: json['tested'],
        deaths: json['deaths'],
        recovered: json["recovered"],
        todayCases: json['todayCases'],
        active: json['active'],
        critical: json['critical'],
        casesPerOneMillion: json['casesPerOneMillion'],
        deathsPerOneMillion: json['deathsPerOneMillion'],
        totalTests: json['totalTests'],
        todayDeaths: json['todayDeaths'],
        testsPerOneMillion: json['testsPerOneMillion']);
  }
}
