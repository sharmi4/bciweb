// To parse this JSON data, do
//
//     final airportsearchModel = airportsearchModelFromJson(jsonString);

import 'dart:convert';

AirportsearchModel airportsearchModelFromJson(String str) => AirportsearchModel.fromJson(json.decode(str));

String airportsearchModelToJson(AirportsearchModel data) => json.encode(data.toJson());

class AirportsearchModel {
    int status;
    int offset;
    String max;
    List<Map<String, String?>> airports;

    AirportsearchModel({
        required this.status,
        required this.offset,
        required this.max,
        required this.airports,
    });

    factory AirportsearchModel.fromJson(Map<String, dynamic> json) => AirportsearchModel(
        status: json["status"],
        offset: json["offset"],
        max: json["max"],
        airports: List<Map<String, String?>>.from(json["airports"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "offset": offset,
        "max": max,
        "airports": List<dynamic>.from(airports.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}
