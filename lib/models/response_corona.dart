import 'dart:convert';

ResponseCorona responseCoronaFromJson(String str) => ResponseCorona.fromJson(json.decode(str));

String responseCoronaToJson(ResponseCorona data) => json.encode(data.toJson());

class ResponseCorona {
  Confirmed confirmed;
  Confirmed recovered;
  Confirmed deaths;
  String daily;
  String image;
  String source;
  DateTime lastUpdate;

  ResponseCorona({
    this.confirmed,
    this.recovered,
    this.deaths,
    this.daily,
    this.image,
    this.source,
    this.lastUpdate,
  });

  factory ResponseCorona.fromJson(Map<String, dynamic> json) => ResponseCorona(
    confirmed: Confirmed.fromJson(json["confirmed"]),
    recovered: Confirmed.fromJson(json["recovered"]),
    deaths: Confirmed.fromJson(json["deaths"]),
    daily: json["daily"],
    image: json["image"],
    source: json["source"],
    lastUpdate: DateTime.parse(json["lastUpdate"]),
  );

  Map<String, dynamic> toJson() => {
    "confirmed": confirmed.toJson(),
    "recovered": recovered.toJson(),
    "deaths": deaths.toJson(),
    "daily": daily,
    "image": image,
    "source": source,
    "lastUpdate": lastUpdate.toIso8601String(),
  };
}

class Confirmed {
  int value;
  String detail;

  Confirmed({
    this.value,
    this.detail,
  });

  factory Confirmed.fromJson(Map<String, dynamic> json) => Confirmed(
    value: json["value"],
    detail: json["detail"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "detail": detail,
  };
}
