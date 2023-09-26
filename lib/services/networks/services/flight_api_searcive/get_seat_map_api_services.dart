import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../base_url/base_url.dart';

class AirGetSeatMapApiServices extends BaseApiService {
  Future airGetSeatMapApiServices({
    required String searchKey,
    required String flightKey,
    required var paxDetails,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(airGetSeatMap,
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
            "Auth_Header": {
              "UserId": "benzclub",
              "Password": "B39F285E37EDCE355386E79CFD8A979ACE740A1E",
              "IP_Address": "101.188.67.134",
              "Request_Id": "5500g8545687959052",
              "IMEI_Number": "2232323232323"
            },
            "Search_Key":
                searchKey,
            "Flight_Keys": [
              flightKey
            ], 
            "PAX_Details": paxDetails
          });
      print(
          "::::::::< -- <--> Air Seat Map <--> -- >::::::::status code::::::::::");
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
