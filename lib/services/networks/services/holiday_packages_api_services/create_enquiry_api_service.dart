import 'dart:io';
import 'package:bciweb/services/base_url/base_url.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateEnquiryApiService extends BaseApiService {
  Future createEnquiryApiService({
    required String packageid,
    required String cityofdeparture,
    required String dateofdeparture,
    required String adultcount,
    required String childcount,
    required String infantcount,
    required String name,
    required String email,
    required String mobile,
    required String status,
    }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      String? vendorid = prefs.getString('id');

      var response = await dio.post(
        createEnquiryApiUrl,
        options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $authtoken'
              
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            }),
            data: {
              "package_id": packageid,
              "vendor_id": vendorid,
              "city_of_departure": cityofdeparture,
              "date_of_departure": dateofdeparture,
              "adult_count": adultcount,
              "child_count": childcount,
              "infant_count": infantcount,
              "name": name,
              "email": email,
              "mobile": mobile,
              "status": status
            }
      );
      print("::::::::<create enquiry Api>::::::::status code:::<$vendorid>:::::::");
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
