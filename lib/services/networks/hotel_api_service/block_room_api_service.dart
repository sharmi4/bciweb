import 'dart:developer' as developer;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../models/hotel_model/get_hotel_room_model.dart';
import '../../base_url/base_url.dart';



class BlockRoomApiService extends BaseApiService {
  Future blockRoomApiService(
      {required String userIp,
      required String resultIndex,
      required String hotelCode,
      required String hotelName,
      required String searchToken,
      required HotelRoomsDetail hotelRoomsDetail}) async {
    dynamic responseJson;
    try {
      print('api call');
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

  

      var data2 = {
    "ResultIndex": resultIndex,
    "HotelCode": hotelCode,
    "HotelName": hotelName,
    "GuestNationality": "IN",
    "NoOfRooms": "1",
    "HotelRoomsDetails": [hotelRoomsDetail.toJson()],
     "UserIp": "122.160.83.78",
     "Search_Token": searchToken
};
      print("//--//--/--/body of the blocl api/--//--/--/--//");
      developer.log("----------------------------------------------------",name: "block data");
      developer.log(data2.toString(),name: "block data");

      var response = await dio.post(blockRoomApiUrl,
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
      print(
          "::::::::<block room api service>:hotelroomdatails${hotelRoomsDetail}:::hotel name${hotelName}::::status code::::::::::");
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
