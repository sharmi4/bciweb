import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../base_url/base_url.dart';

class RecommentedListApiService extends BaseApiService{

   Future recommentedListApiService()async{
    dynamic responseJson;
      
     try{
      var dio=Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');

      var response = await dio.post(
         recomendedListApiUrl,
         options: Options(
          headers: {
             'Authorization': 'Bearer $authtoken'
          },
          followRedirects:false,
          validateStatus: (status) {
             return status! <= 500;
          },
         )
      ); 
       print("::::::::<recomende list Api>::::::::status code::::::::::");
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
      
     
   }
}