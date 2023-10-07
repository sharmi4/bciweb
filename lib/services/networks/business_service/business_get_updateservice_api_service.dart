import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/business_model/createservice_model.dart';
import '../../base_url/base_url.dart';

class UpdateServicesApiServices extends BaseApiService {
  Future updateServices(
      {required CreateServiceModel createServiceModel, required int id}) async {
    dynamic responseJson;
    try {
      var dio = Dio();

      var ameneity = List<dynamic>.from(
          createServiceModel.amenities.map((element) => element.toJson()));
      print(createServiceModel.image);
      FormData formData = FormData.fromMap({
        if (createServiceModel.image != "null")
          "image": await MultipartFile.fromFile(createServiceModel.image,
              filename: createServiceModel.image.split("/").last),
        "title": createServiceModel.title,
        if (createServiceModel.category != "null")
          "category": createServiceModel.category.toString(),
        "sale_amount": createServiceModel.saleAmount,
        "actual_amount": createServiceModel.actualAmount,
        // "share": createServiceModel.share,
        // "bvc_amount": createServiceModel.bvcAmount,
        "booking": createServiceModel.booking,
        "amenties": ameneity.toString(),
        "editor-value": createServiceModel.description,
        "isOffer": createServiceModel.isOfferAvailable,
        "isCoupon": createServiceModel.isCouponsAvailable,
        if (createServiceModel.offerPercentage != null)
          "offerPercentage": "${createServiceModel.offerPercentage}%",
        if (createServiceModel.offerAmount != null)
          "offerUpto_amount": createServiceModel.offerAmount,
        if (createServiceModel.couponAmount != null)
          "coupon_amount": createServiceModel.couponAmount,
        "id": id,
        "cgst": createServiceModel.cgst,
        "sgst": createServiceModel.sgst,
      });

      print(formData.fields);

      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(addServicesURL,
          options: Options(
              headers: {'Authorization': 'Bearer $authtoken'},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      print("::::::::<update services URL>::::::::status code::::::::::");
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

  dynamic returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        print("here.>>>>>>>>>>>>");
        return responseJson;
      case 400:
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 404:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      //     'Error occured while communication with server' +
      //         ' with status code : ${response.statusCode}');
    }
  }
}
