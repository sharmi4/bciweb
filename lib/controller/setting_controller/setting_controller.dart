import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/models/setting_model/getwallet_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../services/networks/setting_api_service.dart/get_wallet_details_api_service.dart';

class ApiSettingController extends GetxController{
  GetWalletDetailsApiServices getWalletDetailsApiServices = GetWalletDetailsApiServices();

  List<GetwalletDetails> getWalletData = [];
    
    getwalletList()async{
      getWalletData.clear();
      dio.Response<dynamic>response=await getWalletDetailsApiServices.getWalletDetailsApiServices();
      if(response.statusCode==200){
        GetwalletDetails getwalletDetails=GetwalletDetails.fromJson(response.data);
        getWalletData.add(getwalletDetails);

      }
      else{
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text('Something Went Wrong',
          style: primaryFont.copyWith(color: kwhite),)
        );
      }
    }
}