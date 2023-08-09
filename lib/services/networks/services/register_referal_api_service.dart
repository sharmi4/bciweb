import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../base_url/base_url.dart';

class RegisterReferalCodeApiService extends BaseApiService{

 Future registerreferalcodeApiservice({required String referalcode}) async{

  dynamic responseJson;
   try{
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString('auth_token');

    var response = await dio.post(
      registerreferalURL,
       options: Options(
        headers: {
          'Authorization':'Bearer $authtoken',
          'Accept':'Application/json'
        },
        followRedirects: false,
          validateStatus: (status) {
            return status! <=500;
          },
       ),
       data:  {
        "referral_code":referalcode
       }
       
    );
    print('::::::::::<Register referal code>:::::::::::::<status code>');
    print(response.statusCode);
    print(response.data);
    responseJson = response;
   }
   on SocketException{
    print('no internet');
   }
   return responseJson;
 }
 dynamic returnResponse(Response<dynamic>response){
  switch (response.statusCode){
    case 200:
    dynamic responseJson = response.data;
    print('here.>>>>>');
    return responseJson;
  }
 }
}