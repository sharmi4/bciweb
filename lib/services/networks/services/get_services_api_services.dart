import 'dart:io';

import 'package:bciweb/services/base_url/base_url.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetServicesApiServices extends BaseApiService {
  Future getServicesByVendor({required String vendorId}) async {
    dynamic responseJson;
    try {
      var dio = Dio();

      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      // String? vendorId = prefs.getString("vendor_id");

      var response = await dio.post(getServicesURL,
          options: Options(
              headers: {'Authorization': 'Bearer $authtoken'},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {"vendor": vendorId});
      print("::::::::<get services URL>::::::::status code::::::::$vendorId::");
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
