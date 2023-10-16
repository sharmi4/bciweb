import 'dart:io';

import 'package:bciweb/services/base_url/base_url.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CouponsRedeemptionApiService extends BaseApiService{

Future couponsRedeemptionApiService()async{
  dynamic responseJson;

  try{
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
     String? authtoken = prefs.getString("auth_token");
    var response = await dio.get(
      redeemprtionCouponsApiUrl,
      options: Options(
        headers: {
          "Accept":"Application/json",
          "Authorization":"Bearer $authtoken" 
        },
        followRedirects: false,
        validateStatus: (status) {
          return status!<=500;
        },
      )      
    );
    print('::::::::::::<Coupons Redeemption  ApiService>:::::::::<status code>::::::::');
    print(response.data);
    print(response.statusCode);
    responseJson = response;

  }on SocketException{
    print('no internet');
  }
  return responseJson;
}
   dynamic returnResponse (Response<dynamic>response){
    switch(response.statusCode){
      case 200:
      dynamic  responseJson =  response.data;
      print('here.>>>>>>>');
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