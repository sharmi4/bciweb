import 'dart:io';
import 'package:bciweb/services/base_url/base_url.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddFlightBookingHistoryAPIServices extends BaseApiService {
  Future addFlightBookingAPIServices({
    required String invoiceNumber,
    required String remark,
    required String fromCityCode,
    required String toCityCode,
    required String fromCityName,
    required String toCityName,
    required String bookingRefNo,
    required String airlineCode,
    required String date,
    required String price,
    required String transactionId
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(addFlightBookingHistoryURL,
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
            "Invoice_Number": "54545",
            "Remark": remark,
            "FromCityCode": fromCityCode,
            "ToCityCode": toCityCode,
            "FromCityName": fromCityName,
            "ToCityName": toCityName,
            "Booking_RefNo": bookingRefNo,
            "AirLineCode": airlineCode,
            "Date": date,
            "price": price
          });
      print(
          "::::::::<--add flight History requiry-->::::::::status code:::::::::");
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
