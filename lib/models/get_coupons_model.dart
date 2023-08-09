// To parse this JSON data, do
//
//     final getCouponsModel = getCouponsModelFromJson(jsonString);

import 'dart:convert';

GetCouponsModel getCouponsModelFromJson(String str) => GetCouponsModel.fromJson(json.decode(str));

String getCouponsModelToJson(GetCouponsModel data) => json.encode(data.toJson());

class GetCouponsModel {
    String message;
    List<CouponsData> data;

    GetCouponsModel({
        required this.message,
        required this.data,
    });

    factory GetCouponsModel.fromJson(Map<String, dynamic> json) => GetCouponsModel(
        message: json["message"],
        data: List<CouponsData>.from(json["data"].map((x) => CouponsData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CouponsData {
    int id;
    dynamic userId;
    dynamic cId;
    dynamic planId;
    dynamic couponcode;
    dynamic amount;
    dynamic isRedeemed;
    DateTime expiryAt;
    DateTime createdAt;
    DateTime updatedAt;
    String name;

    CouponsData({
        required this.id,
        required this.userId,
        required this.cId,
        required this.planId,
        required this.couponcode,
        required this.amount,
        required this.isRedeemed,
        required this.expiryAt,
        required this.createdAt,
        required this.updatedAt,
        required this.name,
    });

    factory CouponsData.fromJson(Map<String, dynamic> json) => CouponsData(
        id: json["id"]??0,
        userId: json["user_id"]?? "",
        cId: json["c_id"]?? "",
        planId: json["plan_id"]?? "",
        couponcode: json["couponcode"] ?? "",
        amount: json["amount"]?? "",
        isRedeemed: json["is_redeemed"]?? "",
        expiryAt: DateTime.parse(json["expiry_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"]?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "c_id": cId,
        "plan_id": planId,
        "couponcode": couponcode,
        "amount": amount,
        "is_redeemed": isRedeemed,
        "expiry_at": expiryAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name":name,
    };
}


