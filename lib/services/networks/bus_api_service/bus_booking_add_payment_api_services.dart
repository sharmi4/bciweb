import 'dart:io';


import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../base_url/base_url.dart';

class BusAddPaymentApiServices extends BaseApiService {
  Future addPaymentForBusApiServices({
    required String refrenceNo,
    required String clientReferneNo,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(airAddPayment,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "IMEI_Number": "64654546546546",
            "RefNo": refrenceNo,
            "ClientRefNo": clientReferneNo,
            "TransactionType": 0,
            "ProductId": "2",
          });
      print(
          "::::::::<--Air add payment-->::::::::status code::::::$refrenceNo::::");
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