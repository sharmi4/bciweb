import 'dart:io';

import 'package:bciweb/services/base_url/base_url.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SupportAdminDetailsApiService extends BaseApiService{

  Future supportAdminDetailsApiService()async{
    dynamic responsJson;
    try{
      var dio =Dio();
      final prefs = await SharedPreferences.getInstance();
      String?authtoken =prefs.getString('auth_token');

      var response = await dio.get(supportAdminDetailsApiUrl,
      options: Options(
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $authtoken'
        },
        followRedirects: false,
        validateStatus: (status) {
          return status! <=500;
        },
      ));
      print(':::::::::<get support admin details Api>:::::::::::<status code>:::::::::');
      print(response.data);
      print(response.statusCode);
      responsJson =response;
      
    }on SocketException{
      print('no Internet');

    }
    return responsJson;

  }
  dynamic returnResponse(Response<dynamic> response){
    switch (response.statusCode){
      case 200:
      dynamic responsJson = response.data;
      print('here.>>>>>>>>>');
      return responsJson;
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