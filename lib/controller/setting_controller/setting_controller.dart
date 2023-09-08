import 'dart:convert';

import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/models/setting_model/getwallet_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:isgpayui_plugin/isgpayui_plugin.dart';
import '../../models/setting_model/ourpartnerlist_model.dart';
import '../../models/setting_model/transation_history_model.dart';
import '../../services/networks/setting_api_service.dart/addtransaction_api_service.dart';
import '../../services/networks/setting_api_service.dart/createsupport_api_service.dart';
import '../../services/networks/setting_api_service.dart/get_referalgenerate_api_service.dart';
import '../../services/networks/setting_api_service.dart/get_wallet_details_api_service.dart';
import '../../services/networks/setting_api_service.dart/ourpartner_api_service.dart';
import '../../services/networks/setting_api_service.dart/transactionhistory_api_service.dart';
import '../auth_controller/auth_controller.dart';
import '../auth_controller/auth_profile_controller.dart';

class ApiSettingController extends GetxController{

    RxString referralCode = "".obs; 
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

     //generate referral code api
   GenerateReferralCodeApiService generateReferralCodeApiService = 
   GenerateReferralCodeApiService();

   generateReferralCode()async{
         dio.Response<dynamic>response = await generateReferralCodeApiService.generateReferralCodeApiService();
         if(response.statusCode==200){
          referralCode(response.data['code']);
         }
         else{
          Get.rawSnackbar(
             backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          )
          );
         }
         update();
   }
   
OurPartnersApiService ourPartnersApiService = OurPartnersApiService();
   List<OurPartnersData> ourPartnersData = [];

   ourPartner() async {
     
     dio.Response<dynamic> response = await ourPartnersApiService.ourPartnersApiService();
     if(response.statusCode == 200){
       OurPartnersList ourPartnersList = OurPartnersList.fromJson(response.data);
       ourPartnersData = ourPartnersList.data;
     } else {
       Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
     }
     update();
   }
    //create support api
   CreateSupportApiService createSupportApiService = CreateSupportApiService();

   createSupport({
    required String  title,
    required String message,
   })
async{
   dio.Response<dynamic> response = await createSupportApiService.createSupportApiService(
    title: title, message: message);
    if(response.statusCode==201){
       Get.back();
       Get.rawSnackbar(
        backgroundColor: Colors.green,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          )
       );
      
    }else{
      Get.rawSnackbar(
         backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          )
      );
    }
}
  AddTransactionApiService addTransactionApiServices = AddTransactionApiService();

  addTransaction({required String amount}) async {
      
      dio.Response<dynamic> response = await addTransactionApiServices.
       addTransactionApi(amount: amount);
       print('add transaction');
       print(response.data);
       if(response.statusCode == 200){
                   
       } else {
          Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
          print('add transaction api');
          print(response.data);
       }
       update();
  }
    //transactionhistory api
    TransactionHistoryApiService transactionhistoryapiservice = TransactionHistoryApiService();

    List<TransactionHistory>transactionhistorydata=[];

    transactionHistoryDetails()async{
      dio.Response<dynamic> response = await transactionhistoryapiservice.transactionHistory();
      if(response.statusCode==200){
        TransactionHistoryModel transactionHistoryModel = TransactionHistoryModel.fromJson(response.data);
        transactionhistorydata=transactionHistoryModel.transactionHistory;
      }
      else{
        Get.rawSnackbar(
           backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          )
        );
      }
      update();
    
  }
   }
