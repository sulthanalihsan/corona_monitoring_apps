import 'dart:convert';

List<ResponseDetailCorona> responseDetailCoronaFromJson(String str) => List<ResponseDetailCorona>.from(json.decode(str).map((x) => ResponseDetailCorona.fromJson(x)));

String responseDetailCoronaToJson(List<ResponseDetailCorona> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseDetailCorona {
  String provinceState;
  String countryRegion;
  int lastUpdate;
  double lat;
  double long;
  int confirmed;
  int deaths;
  int recovered;

  ResponseDetailCorona({
    this.provinceState,
    this.countryRegion,
    this.lastUpdate,
    this.lat,
    this.long,
    this.confirmed,
    this.deaths,
    this.recovered,
  });

  factory ResponseDetailCorona.fromJson(Map<String, dynamic> json) => ResponseDetailCorona(
    provinceState: json["provinceState"] == null ? '' : json["provinceState"],
    countryRegion: json["countryRegion"],
    lastUpdate: json["lastUpdate"],
    lat: json["lat"].toDouble(),
    long: json["long"].toDouble(),
    confirmed: json["confirmed"],
    deaths: json["deaths"],
    recovered: json["recovered"],
  );

  Map<String, dynamic> toJson() => {
    "provinceState": provinceState == null ? null : provinceState,
    "countryRegion": countryRegion,
    "lastUpdate": lastUpdate,
    "lat": lat,
    "long": long,
    "confirmed": confirmed,
    "deaths": deaths,
    "recovered": recovered,
  };
}
