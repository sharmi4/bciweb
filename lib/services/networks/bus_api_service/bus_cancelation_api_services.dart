import 'dart:io';
import 'package:bciweb/models/bus_cancel_seats_details_model.dart';
import 'package:bciweb/services/base_url/base_url.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusCancelationApiServices extends BaseApiService {
  Future busCancel({
    required String bookingNumber,
    required String cancelationChargeString,
    required List<BusCancelSeatDetailsModel> busBookingdetails,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var data2 = {
        "Auth_Header": {
          "UserId": "benze",
          "Password": "9B1AD178625CE0BCA5BC8E5FD616B06E0BE760FD",
          "IP_Address": "101.188.67.134",
          "Request_Id": "5500g887959052",
          "IMEI_Number": "2232323232323"
        },
        "Booking_RefNo": bookingNumber,
        "BusTicketstoCancel": [
          for (var details in busBookingdetails)
            {
              "Seat_Number": details.seatNumber,
              "Ticket_Number": details.ticketNumber,
              "Transport_PNR": details.pnrNumber
            }
        ],
        "CancellationCharge_Key": cancelationChargeString
      };

      var response = await dio.post(busBookingCancelationURL,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: data2);
      print("::::::::<--Bus Cancelation-->::::::::status code::::::::::");
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
