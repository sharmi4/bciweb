// To parse this JSON data, do
//
//     final recomendedList = recomendedListFromJson(jsonString);

import 'dart:convert';

RecomendedList recomendedListFromJson(String str) => RecomendedList.fromJson(json.decode(str));

String recomendedListToJson(RecomendedList data) => json.encode(data.toJson());

class RecomendedList {
    String message;
    List<RecomendedListData> data;
    List<RecomendedListData> recommendedPackages;

    RecomendedList({
        required this.message,
        required this.data,
        required this.recommendedPackages,
    });

    factory RecomendedList.fromJson(Map<String, dynamic> json) => RecomendedList(
        message: json["message"],
        data: List<RecomendedListData>.from(json["data"].map((x) => RecomendedListData.fromJson(x))),
        recommendedPackages: List<RecomendedListData>.from(json["recommended_packages"].map((x) => RecomendedListData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "recommended_packages": List<dynamic>.from(recommendedPackages.map((x) => x.toJson())),
    };
}

class RecomendedListData {
    int id;
    int vendorId;
    String? location;
    int categoryId;
    String title;
    dynamic description;
    String image;
    int isRecomended;
    String? inclusion;
    String? exclusion;
    String amount;
    String packageoverview;
    String duration;
    String placeToVisit;
    String packageInclude;
    dynamic dayWiseItinerary;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    List<String>? images;
    String? categoryName;

    RecomendedListData({
        required this.id,
        required this.vendorId,
        this.location,
        required this.categoryId,
        required this.title,
        this.description,
        required this.image,
        required this.isRecomended,
        this.inclusion,
        this.exclusion,
        required this.amount,
        required this.packageoverview,
        required this.duration,
        required this.placeToVisit,
        required this.packageInclude,
        this.dayWiseItinerary,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        this.images,
        this.categoryName,
    });

    factory RecomendedListData.fromJson(Map<String, dynamic> json) => RecomendedListData(
        id: json["id"],
        vendorId: json["vendor_id"],
        location: json["location"],
        categoryId: json["category_id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        isRecomended: json["is_recomended"],
        inclusion: json["inclusion"],
        exclusion: json["exclusion"],
        amount: json["Amount"],
        packageoverview: json["packageoverview"],
        duration: json["Duration"],
        placeToVisit: json["place_to_visit"],
        packageInclude: json["package_include"],
        dayWiseItinerary: json["day_wise_itinerary"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        categoryName: json["category_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "location": location,
        "category_id": categoryId,
        "title": title,
        "description": description,
        "image": image,
        "is_recomended": isRecomended,
        "inclusion": inclusion,
        "exclusion": exclusion,
        "Amount": amount,
        "packageoverview": packageoverview,
        "Duration": duration,
        "place_to_visit": placeToVisit,
        "package_include": packageInclude,
        "day_wise_itinerary": dayWiseItinerary,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "category_name": categoryName,
    };
}
