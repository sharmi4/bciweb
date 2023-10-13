import 'dart:io';
import 'package:bciweb/models/create_account_model.dart';
import 'package:dio/dio.dart';
import '../../../base_url/base_url.dart';

class MemberRegisterApiservices extends BaseApiService{
  
  Future memberRegister({
    required CreateAccountModel? memberRegisterModel,
    // required AddressModel? residentialAddress,
    //  required AddressModel? officialAddress,
  }) async {
    dynamic responseJson;
    try{
      var dio=Dio();
      var response=await dio.post(registerURl,
      options:Options(
        headers: {
          'Accept':'application/json',
        },
        followRedirects: false,
        validateStatus: (status){
          return status!<=500;
        },
      ),
      data: {
        'name':memberRegisterModel!.name,
        'mobile':memberRegisterModel.mobilenumber,
        'email':memberRegisterModel.email,
            // "official_address": jsonEncode({
            //   "door_no": officialAddress!.doorNo,
            //   "address": officialAddress.address,
            //   "building_name": officialAddress.buildingName,
            //   "state": officialAddress.state,
            //   "city": officialAddress.city,
            // }),
            // "pan_no": memberRegisterModel.panNo,
            // "aadhar_no": residentialAddress!.aadhrId,
             "role_id": "3",
            // "password": "1234567",
            // "password_confirmation": "1234567"
          });

          print("::::::::<Register URL>::::::::status code::::::::::${memberRegisterModel.mobilenumber} ${memberRegisterModel.email}");
          print(response.statusCode);
          print(response.data);
          responseJson = response;


      }on SocketException{
        print('no internet');
      }
          return responseJson; 
    }
  }
