// To parse this JSON data, do
//
//     final getpaymentModel = getpaymentModelFromJson(jsonString);

import 'dart:convert';

GetpaymentModel getpaymentModelFromJson(String str) => GetpaymentModel.fromJson(json.decode(str));

String getpaymentModelToJson(GetpaymentModel data) => json.encode(data.toJson());

class GetpaymentModel {
    String message;
    Data data;

    GetpaymentModel({
        required this.message,
        required this.data,
    });

    factory GetpaymentModel.fromJson(Map<String, dynamic> json) => GetpaymentModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String userId;
    String mobile;
    String invoice;
    String cardNo;
    int plan;
    String amount;
    String validityDays;
    DateTime subscribedAt;
    DateTime expiryAt;
    DateTime amcDate;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Data({
        required this.userId,
        required this.mobile,
        required this.invoice,
        required this.cardNo,
        required this.plan,
        required this.amount,
        required this.validityDays,
        required this.subscribedAt,
        required this.expiryAt,
        required this.amcDate,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        mobile: json["mobile"],
        invoice: json["invoice"],
        cardNo: json["card_no"],
        plan: json["plan"],
        amount: json["amount"],
        validityDays: json["validity_days"],
        subscribedAt: DateTime.parse(json["subscribed_at"]),
        expiryAt: DateTime.parse(json["expiry_at"]),
        amcDate: DateTime.parse(json["amc_date"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "mobile": mobile,
        "invoice": invoice,
        "card_no": cardNo,
        "plan": plan,
        "amount": amount,
        "validity_days": validityDays,
        "subscribed_at": subscribedAt.toIso8601String(),
        "expiry_at": expiryAt.toIso8601String(),
        "amc_date": amcDate.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
