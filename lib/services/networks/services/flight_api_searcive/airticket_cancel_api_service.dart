import 'dart:io';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../base_url/base_url.dart';

class AirCancelApiServices extends BaseApiService {

  Future airCancelApiServices({
    required String  Airlinepnr,
    required String  Refno,
    required String Cancelcode,
    required String ReqRemarks,
    required String CancellationType,
    required String Imeinumber,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(airCancelApiURL,
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
            "CancellationType": '',
            "ReqRemarks": '',
            "Cancelcode":"",
            "Refno":"",
            "Airline_PNR":""

          });
      print(
          "::::::::<-- Air cancellation api -->::::::::status code::::::::::");
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
