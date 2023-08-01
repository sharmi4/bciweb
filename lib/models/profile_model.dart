// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    String message;
    bool subscription;
    int remainingDays;
    int percentage;
    dynamic planId;
    User user;

    ProfileModel({
        required this.message,
        required this.subscription,
        required this.remainingDays,
        required this.percentage,
        this.planId,
        required this.user,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json["message"]??'',
        subscription: json["subscription"]??"",
        remainingDays: json["remaining_days"]??0,
        percentage: json["percentage"]??"",
        planId: json["plan_id"]??"",
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "subscription": subscription,
        "remaining_days": remainingDays,
        "percentage": percentage,
        "plan_id": planId,
        "user": user.toJson(),
    };
}

class User {
    int id;
    dynamic roleId;
    dynamic name;
    dynamic email;
    dynamic mobile;
    dynamic isVerrifiedMobile;
    dynamic otp;
    dynamic category;
    dynamic subCategory;
    dynamic alternateMobile;
    dynamic gstNo;
    dynamic adharProof;
    dynamic panProof;
    dynamic profilePicture;
    dynamic clientSecret;
    dynamic clientId;
    dynamic keyName;
    String keyStatus;
    dynamic emailVerifiedAt;
    dynamic address;
    dynamic dob;
    dynamic occupation;
    dynamic fatherName;
    dynamic motherName;
    dynamic isMarried;
    dynamic residentialAddress;
    OfficialAddress officialAddress;
    dynamic panNo;
    dynamic aadharNo;
    dynamic bio;
    dynamic pincode;
    dynamic city;
    dynamic state;
    dynamic status;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.roleId,
        required this.name,
        required this.email,
        required this.mobile,
        required this.isVerrifiedMobile,
        required this.otp,
        this.category,
        this.subCategory,
        this.alternateMobile,
        this.gstNo,
        this.adharProof,
        this.panProof,
        this.profilePicture,
        this.clientSecret,
        this.clientId,
        this.keyName,
        required this.keyStatus,
        this.emailVerifiedAt,
        this.address,
        this.dob,
        this.occupation,
        this.fatherName,
        this.motherName,
        this.isMarried,
        this.residentialAddress,
        required this.officialAddress,
        required this.panNo,
        required this.aadharNo,
        this.bio,
        this.pincode,
        this.city,
        this.state,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"]?? 0,
        roleId: json["role_id"]??'',
        name: json["name"] ??'',
        email: json["email"]??'',
        mobile: json["mobile"]??'',
        isVerrifiedMobile: json["is_verrified_mobile"]??'',
        otp: json["otp"]??'',
        category: json["category"]??'',
        subCategory: json["sub_category"]??'',
        alternateMobile: json["alternate_mobile"]??'',
        gstNo: json["gst_no"]??'',
        adharProof: json["adhar_proof"]??"",
        panProof: json["pan_proof"]??"",
        profilePicture: json["profile_picture"]??"",
        clientSecret: json["client_secret"]??"",
        clientId: json["client_id"]??"",
        keyName: json["Key_name"]??"",
        keyStatus: json["Key_status"]??"",
        emailVerifiedAt: json["email_verified_at"]??"",
        address: json["address"]??"",
        dob: json["dob"]??"",
        occupation: json["occupation"]??"",
        fatherName: json["father_name"]??"",
        motherName: json["mother_name"]??"",
        isMarried: json["is_married"]??"",
        residentialAddress: json["residential_address"]??"",
        officialAddress: OfficialAddress.fromJson(json["official_address"]),
        panNo: json["pan_no"]??"",
        aadharNo: json["aadhar_no"]??"",
        bio: json["bio"]??"",
        pincode: json["pincode"]??"",
        city: json["city"]??"",
        state: json["state"]??"",
        status: json["status"]??"",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "email": email,
        "mobile": mobile,
        "is_verrified_mobile": isVerrifiedMobile,
        "otp": otp,
        "category": category,
        "sub_category": subCategory,
        "alternate_mobile": alternateMobile,
        "gst_no": gstNo,
        "adhar_proof": adharProof,
        "pan_proof": panProof,
        "profile_picture": profilePicture,
        "client_secret": clientSecret,
        "client_id": clientId,
        "Key_name": keyName,
        "Key_status": keyStatus,
        "email_verified_at": emailVerifiedAt,
        "address": address,
        "dob": dob,
        "occupation": occupation,
        "father_name": fatherName,
        "mother_name": motherName,
        "is_married": isMarried,
        "residential_address": residentialAddress,
        "official_address": officialAddress.toJson(),
        "pan_no": panNo,
        "aadhar_no": aadharNo,
        "bio": bio,
        "pincode": pincode,
        "city": city,
        "state": state,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class OfficialAddress {
    String doorNo;
    String address;
    String buildingName;
    String state;
    String city;

    OfficialAddress({
        required this.doorNo,
        required this.address,
        required this.buildingName,
        required this.state,
        required this.city,
    });

    factory OfficialAddress.fromJson(Map<String, dynamic> json) => OfficialAddress(
        doorNo: json["door_no"],
        address: json["address"],
        buildingName: json["building_name"],
        state: json["state"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "door_no": doorNo,
        "address": address,
        "building_name": buildingName,
        "state": state,
        "city": city,
    };
}
