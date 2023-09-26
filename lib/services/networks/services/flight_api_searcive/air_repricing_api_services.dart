import 'dart:io';
import 'package:bciweb/models/air_search_model.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/flight_searchdatamodel.dart';
import '../../../base_url/base_url.dart';

class AirRepriceApiServices extends BaseApiService {
  Future airRepriceApiServices({
    required FlightSearchDataModel flightSearchModel,
    required Flight flight,
    required String searchKey,
    required String mobileNumber,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      print("<<---------------here-------------->>");
      print("------------->> search key");
      print(searchKey);
      print("------------->> flight key");
      print( flight.flightKey);
      print("------------->> fare id");
      print(flight.fares.last.fareId);

      var response = await dio.post(airRepricingUrl,
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
            "imei_number": "646545465465461",
            "search_key": searchKey,
            "flight_key": flight.flightKey,
            "fare_id": flight.fares.last.fareId,
            "customer_mobile": mobileNumber
          });
      print("::::::::<--Air Repricing-->::::::::status code::::::::::");
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
