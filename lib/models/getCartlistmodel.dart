// To parse this JSON data, do
//
//     final getCartList = getCartListFromJson(jsonString);

import 'dart:convert';

GetCartList getCartListFromJson(String str) => GetCartList.fromJson(json.decode(str));

String getCartListToJson(GetCartList data) => json.encode(data.toJson());

class GetCartList {
    bool status;
    List<Datum> data;

    GetCartList({
        required this.status,
        required this.data,
    });

    factory GetCartList.fromJson(Map<String, dynamic> json) => GetCartList(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String userId;
    String serviceId;
    String quantity;
    DateTime createdAt;
    DateTime updatedAt;
    String serviceName;
    String image;
    String price;
    String description;

    Datum({
        required this.id,
        required this.userId,
        required this.serviceId,
        required this.quantity,
        required this.createdAt,
        required this.updatedAt,
        required this.serviceName,
        required this.image,
        required this.price,
        required this.description,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        serviceId: json["service_id"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        serviceName: json["service_name"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "service_id": serviceId,
        "quantity": quantity,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "service_name": serviceName,
        "image": image,
        "price": price,
        "description": description,
    };
}
