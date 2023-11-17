import 'dart:convert';

ServiceModel serviceModelFromJson(String str) =>
    ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  String message;
  List<ServiceData> data;

  ServiceModel({
    required this.message,
    required this.data,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        message: json["message"],
        data: List<ServiceData>.from(
            json["data"].map((x) => ServiceData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ServiceData {
  int id;
  dynamic categoryId;
  dynamic vendorId;
  String title;
  dynamic actualAmount;
  dynamic bvcAmount;
  dynamic saleAmount;
  dynamic isOffer;
  String unit;
  String quantity;
  dynamic sgst;
  dynamic cgst;
  String? offerPercentage;
  String? offerUptoAmount;
  dynamic isCoupon;
  dynamic couponAmount;
  String description;
  dynamic isBooking;
  dynamic status;
  dynamic isRecomended;
  List<Amenty>? amenties;
  List<String> images;
  DateTime createdAt;
  DateTime updatedAt;

  ServiceData({
    required this.id,
    required this.categoryId,
    required this.vendorId,
    required this.title,
    required this.actualAmount,
    required this.bvcAmount,
    required this.saleAmount,
    required this.isOffer,
    this.offerPercentage,
    this.offerUptoAmount,
    this.cgst,
    this.isRecomended,
    required this.quantity,
    this.sgst,
    required this.unit,
    required this.isCoupon,
    this.couponAmount,
    required this.description,
    required this.isBooking,
    required this.status,
    this.amenties,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        id: json["id"] ?? 0,
        categoryId: json["category_id"] ?? '',
        vendorId: json["vendor_id"] ?? '',
        title: json["title"] ?? "",
        actualAmount: json["actual_amount"] ?? "",
        bvcAmount: json["bvc_amount"] ?? "",
        saleAmount: json["sale_amount"] ?? "",
        isOffer: json["isOffer"] ?? "",
        offerPercentage: json["offerPercentage"] ?? "",
        offerUptoAmount: json["offerUpto_amount"] ?? "",
        isCoupon: json["isCoupon"] ?? "",
        couponAmount: json["coupon_amount"] ?? "",
        description: json["description"] ?? "",
        isBooking: json["is_booking"] ?? "",
        status: json["status"] ?? "",
        isRecomended: json["is_recomended"] ?? "",
        amenties: json["amenties"] == null
            ? []
            : List<Amenty>.from(
                json["amenties"]!.map((x) => Amenty.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        sgst: json["cgst"],
        cgst: json["sgst"],
        quantity: json["quantity"] ?? "",
        unit: json["unit"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "vendor_id": vendorId,
        "title": title,
        "actual_amount": actualAmount,
        "bvc_amount": bvcAmount,
        "sale_amount": saleAmount,
        "isOffer": isOffer,
        "offerPercentage": offerPercentage,
        "offerUpto_amount": offerUptoAmount,
        "isCoupon": isCoupon,
        "coupon_amount": couponAmount,
        "description": description,
        "is_booking": isBooking,
        "quantity": quantity,
        "unit": unit,
        "status": status,
        "amenties": amenties == null
            ? []
            : List<dynamic>.from(amenties!.map((x) => x.toJson())),
        "image": images,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Amenty {
  String value;

  Amenty({
    required this.value,
  });

  factory Amenty.fromJson(Map<String, dynamic> json) => Amenty(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}
