import 'dart:io';

import 'package:bciweb/services/base_url/base_url.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddSubscriptionApiServices extends BaseApiService {
  Future addSubscription(
      {required int planId,
      required int customerId,
      required String paymentMenthod,
      required String gstPercentage,
      required String percentageAmount,
      required String totalAmount,
      required String amount,
      required String status,
      required String utrNumber}) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(
        addPlanUrl,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $authtoken'
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
        data: {
          "plan_id": planId,
          "user_id": customerId,
          "payment_method": paymentMenthod,
          "utr_number": utrNumber,
          "gst_percentage": gstPercentage,
          "gst_amount": percentageAmount,
          "total_amount": totalAmount,
          "amount": amount,
          "status": status
        },
      );
      print(
          "::::::::< Subscribe plan details Api >:::$customerId:::: : status code ::::::$planId:::$utrNumber::::$paymentMenthod");
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
