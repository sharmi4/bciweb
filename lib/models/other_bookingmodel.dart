// To parse this JSON data, do
//
//     final otherbookingModel = otherbookingModelFromJson(jsonString);

import 'dart:convert';

OtherbookingModel otherbookingModelFromJson(String str) => OtherbookingModel.fromJson(json.decode(str));

String otherbookingModelToJson(OtherbookingModel data) => json.encode(data.toJson());

class OtherbookingModel {
    String message;
    List<Datum> data;

    OtherbookingModel({
        required this.message,
        required this.data,
    });

    factory OtherbookingModel.fromJson(Map<String, dynamic> json) => OtherbookingModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    dynamic paymentId;
    dynamic quantity;
    dynamic purchasePrice;
    String status;
    String service;
    String image;
    String description;
    String bookingdate;
    String time;

    Datum({
        required this.id,
        required this.paymentId,
        required this.quantity,
        required this.purchasePrice,
        required this.status,
        required this.service,
        required this.image,
        required this.description,
        required this.bookingdate,
        required this.time
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        paymentId: json["payment_id"],
        quantity: json["quantity"],
        purchasePrice: json["purchase_price"],
        status: json["status"] ?? "",
        service: json["service"]?? "" ,
        image: json["image"] ?? "",
        description: json["description"]?? "",
        bookingdate: json[ "booked_date"]??'',
        time: json['book_date_time']??''
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "payment_id": paymentId,
        "quantity": quantity,
        "purchase_price": purchasePrice,
        "status": status,
        "service": service,
        "image": image,
        "description": description,
        "booked_date":bookingdate,
        "book_date_time":time
    };
}
