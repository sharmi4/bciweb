// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    String message;
    List<CategoryData> data;

    CategoryModel({
        required this.message,
        required this.data,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        message: json["message"],
        data: List<CategoryData>.from(json["data"].map((x) => CategoryData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CategoryData {
    int id;
    String title;
    String description;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    CategoryData({
        required this.id,
        required this.title,
        required this.description,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["id"]??"0",
        title: json["title"]??"",
        description: json["description"]??"",
        status: json["status"]??"",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
