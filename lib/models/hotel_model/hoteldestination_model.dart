// To parse this JSON data, do
//
//     final hotelDestinationModel = hotelDestinationModelFromJson(jsonString);

import 'dart:convert';

List<HotelDestinationModel> hotelDestinationModelFromJson(String str) => List<HotelDestinationModel>.from(json.decode(str).map((x) => HotelDestinationModel.fromJson(x)));

String hotelDestinationModelToJson(List<HotelDestinationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HotelDestinationModel {
    String cityid;
    String destination;
    String stateprovince;
    String stateProvinceCode;
    String country;
    String countrycode;

    HotelDestinationModel({
        required this.cityid,
        required this.destination,
        required this.stateprovince,
        required this.stateProvinceCode,
        required this.country,
        required this.countrycode,
    });

    factory HotelDestinationModel.fromJson(Map<String, dynamic> json) => HotelDestinationModel(
        cityid: json["cityid"]??"",
        destination: json["Destination"]??"",
        stateprovince: json["stateprovince"]??"",
        stateProvinceCode: json["StateProvinceCode"]??"",
        country:json['country']??"",
        countrycode:json['countrycode']??"",
    );

    Map<String, dynamic> toJson() => {
        "cityid": cityid,
        "Destination": destination,
        "stateprovince": stateprovince,
        "StateProvinceCode": stateProvinceCode,
        "country": country,
        "countrycode":countrycode,
    };
}




