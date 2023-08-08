import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/models/setting_model/getwallet_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../models/setting_model/ourpartnerlist_model.dart';
import '../../services/networks/setting_api_service.dart/createsupport_api_service.dart';
import '../../services/networks/setting_api_service.dart/get_referalgenerate_api_service.dart';
import '../../services/networks/setting_api_service.dart/get_wallet_details_api_service.dart';
import '../../services/networks/setting_api_service.dart/ourpartner_api_service.dart';

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
   }
