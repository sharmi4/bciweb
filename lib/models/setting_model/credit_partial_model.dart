// To parse this JSON data, do
//
//     final creditPartialModel = creditPartialModelFromJson(jsonString);


// To parse this JSON data, do
//
//     final partialAmountModel = partialAmountModelFromJson(jsonString);

import 'dart:convert';

CreditPartialModel partialAmountModelFromJson(String str) =>
    CreditPartialModel.fromJson(json.decode(str));

String partialAmountModelToJson(CreditPartialModel data) =>
    json.encode(data.toJson());

class CreditPartialModel {
  List<PartialAmount> partialAmount;

  CreditPartialModel({
    required this.partialAmount,
  });

  factory CreditPartialModel.fromJson(Map<String, dynamic> json) =>
      CreditPartialModel(
        partialAmount: List<PartialAmount>.from(
            json["Partial Amount"].map((x) => PartialAmount.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Partial Amount":
            List<dynamic>.from(partialAmount.map((x) => x.toJson())),
      };
}

class PartialAmount {
  int id;
  String customerId;
  String planName;
  String planAmount;
  String collectedAmount;
  dynamic collectedDate;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String planTitle;

  PartialAmount({
    required this.id,
    required this.customerId,
    required this.planName,
    required this.planAmount,
    required this.collectedAmount,
    required this.collectedDate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.planTitle,
  });

  factory PartialAmount.fromJson(Map<String, dynamic> json) => PartialAmount(
        id: json["id"],
        customerId: json["customer_id"],
        planName: json["plan_name"],
        planAmount: json["plan_amount"],
        collectedAmount: json["collected_amount"],
        collectedDate: json["collected_date"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        planTitle: json["planTitle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "plan_name": planName,
        "plan_amount": planAmount,
        "collected_amount": collectedAmount,
        "collected_date":
            "${collectedDate.year.toString().padLeft(4, '0')}-${collectedDate.month.toString().padLeft(2, '0')}-${collectedDate.day.toString().padLeft(2, '0')}",
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "planTitle": planTitle,
      };
}


// import 'dart:convert';

// CreditPartialModel creditPartialModelFromJson(String str) => CreditPartialModel.fromJson(json.decode(str));

// String creditPartialModelToJson(CreditPartialModel data) => json.encode(data.toJson());

// class CreditPartialModel {
//     List<PartialAmount> partialAmount;

//     CreditPartialModel({
//         required this.partialAmount,
//     });

//     factory CreditPartialModel.fromJson(Map<String, dynamic> json) => CreditPartialModel(
//         partialAmount: List<PartialAmount>.from(json["Partial Amount"].map((x) => PartialAmount.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "Partial Amount": List<dynamic>.from(partialAmount.map((x) => x.toJson())),
//     };
// }

// class PartialAmount {
//     int id;
//     String customerId;
//     String planName;
//     String planAmount;
//     String collectedAmount;
//     DateTime collectedDate;
//     String status;
//     DateTime createdAt;
//     DateTime updatedAt;
//     String planTitle;

//     PartialAmount({
//         required this.id,
//         required this.customerId,
//         required this.planName,
//         required this.planAmount,
//         required this.collectedAmount,
//         required this.collectedDate,
//         required this.status,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.planTitle,
//     });

//     factory PartialAmount.fromJson(Map<String, dynamic> json) => PartialAmount(
//         id: json["id"],
//         customerId: json["customer_id"],
//         planName: json["plan_name"],
//         planAmount: json["plan_amount"],
//         collectedAmount: json["collected_amount"],
//         collectedDate: DateTime.parse(json["collected_date"]),
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         planTitle: json["planTitle"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "customer_id": customerId,
//         "plan_name": planName,
//         "plan_amount": planAmount,
//         "collected_amount": collectedAmount,
//         "collected_date": "${collectedDate.year.toString().padLeft(4, '0')}-${collectedDate.month.toString().padLeft(2, '0')}-${collectedDate.day.toString().padLeft(2, '0')}",
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "planTitle": planTitle,
//     };
// }
