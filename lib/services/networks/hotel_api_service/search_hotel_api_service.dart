import 'dart:io';

import 'package:bciweb/services/networks/services/catogory_api_service/service_list_apiservice.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHotelApiService extends ServiceApiService{

  Future searchhotelapiservice({
    required String checkindate,
    required String destination,
    required String countryCode,
    required String checkoutdate,
    required String adult,
    required String child,
    required String roomsno

  })async{
    dynamic responseJson;
    try{
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken= prefs.getString('auth_token');
      var data ={
             {
  "BookingMode": 5,
  "CheckInDate": checkindate,
  "CheckOutDate": checkoutdate,
  "NoOfNights": 1,
  "CountryCode": "US",
  "DestinationCityId":destination,
  "ResultCount": null,
  "Currency": "THB",
  "GuestNationality": "IN",
  "NoOfRooms": roomsno,
  "RoomGuests": [
    {
      "Adult": adult.toString(),
      "Child": child.toString(),
      "ChildAge": null
    }
  ],
  "MaxRating": 5,
  "MinRating": 0,
  "UserIp": "122.160.83.78"
}
   
      };
      var response = await dio.post(
        searchHotelApiUrl,
        options: Options(
          headers: {
            "Accept":"Application/json",
            "Authorization":"Bearer $authtoken"
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! <=500;
          },
          
        ),
        data: data,
      );
      print('::::::searchHotel-Api:::::::::::::<status code>');
      print(response.data);
      print(response.statusCode);
      responseJson = response;
  }
  on SocketException{
    print('no internet');
    return responseJson;
  }

}
dynamic returnResponse(Response<dynamic>response){
  switch (response.statusCode){
    case 200:
    dynamic responseJson= response.data;
    print('here.>>>>>>');
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