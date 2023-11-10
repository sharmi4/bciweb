// To parse this JSON data, do
//
//     final partialBookingHistoryModel = partialBookingHistoryModelFromJson(jsonString);

import 'dart:convert';

PartialBookingHistoryModel partialBookingHistoryModelFromJson(String str) => PartialBookingHistoryModel.fromJson(json.decode(str));

String partialBookingHistoryModelToJson(PartialBookingHistoryModel data) => json.encode(data.toJson());

class PartialBookingHistoryModel {
    List<PartialData> data;

    PartialBookingHistoryModel({
        required this.data,
    });

    factory PartialBookingHistoryModel.fromJson(Map<String, dynamic> json) => PartialBookingHistoryModel(
        data: List<PartialData>.from(json["data"].map((x) => PartialData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PartialData {
    int id;
    String planName;
    String planAmount;
    String collectedAmount;
    DateTime collectedDate;
    String partialId;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    String planTitle;

    PartialData({
        required this.id,
        required this.planName,
        required this.planAmount,
        required this.collectedAmount,
        required this.collectedDate,
        required this.partialId,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.planTitle,
    });

    factory PartialData.fromJson(Map<String, dynamic> json) => PartialData(
        id: json["id"],
        planName: json["plan_name"],
        planAmount: json["plan_amount"],
        collectedAmount: json["collected_amount"],
        collectedDate: DateTime.parse(json["collected_date"]),
        partialId: json["partial_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        planTitle: json["planTitle"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "plan_name": planName,
        "plan_amount": planAmount,
        "collected_amount": collectedAmount,
        "collected_date": "${collectedDate.year.toString().padLeft(4, '0')}-${collectedDate.month.toString().padLeft(2, '0')}-${collectedDate.day.toString().padLeft(2, '0')}",
        "partial_id": partialId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "planTitle": planTitle,
    };
}
