import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../base_url/base_url.dart';

class AddCouponsApiServices extends BaseApiService {
  
  Future addCouponsApiServices({
    required dynamic image,
    required String title,
    required String category,
    required String startsat,
    required String endsat,
    required dynamic discountValue,
    required String description,
    required String merchantId,
    required String buyAmt,
  }) async {
    dynamic responseJson;
     
    try {
      var dio = Dio();

      print(image.runtimeType);

      FormData formData = FormData.fromMap({
        "image":  MultipartFile.fromBytes(image, filename: "image"),
        "title": title,
        "category": category.toString(),
        "starts_at": startsat,
        "ends_at": endsat,
        "coupon_amount": discountValue,
        "description": description,
        "merchant": merchantId,
        "buy_amount": buyAmt
        
      });

      print(formData.fields);

      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(addCouponsURL,
          options: Options(
              headers: {'Authorization': 'Bearer $authtoken'},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      print("::::::::<Add Coupons api services>::::::::status code::::::::::");
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
