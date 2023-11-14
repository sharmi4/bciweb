import 'dart:async';

import 'package:bciweb/controller/setting_controller/setting_controller.dart';
import 'package:bciweb/models/member_profile.dart';
import 'package:bciweb/services/networks/business_service/business_withdraw_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:url_launcher/url_launcher.dart';
import '../constant/constans.dart';
import '../models/business_model/business_profile_model.dart';
import '../models/business_model/business_update_model.dart';
import '../models/business_model/business_updatebank_details_model.dart';
import '../models/get_gallery_model.dart';
import '../models/initiate_payment_model copy.dart';
import '../payment_gateway/payment_gateway_services/initiate_payment_api_services.dart';
import '../services/networks/business_service/business_bankdetails_api_service.dart';
import '../services/networks/business_service/business_gallery_api_service.dart';
import '../services/networks/business_service/business_getprofile_api_service.dart';
import '../services/networks/business_service/business_profile_update.dart';
import '../services/networks/business_service/business_profilepicupdate_api_service.dart';
import '../services/networks/business_service/get_gallery_api_service.dart';
import '../services/networks/payment_api_services/payment_status_api_services.dart';
import '../views/business/business_profile/accout_profile.dart';

class ProfileController extends GetxController {
  RxInt profileindex = 0.obs;

  RxInt isWalletOrNot = 0.obs;

  RxBool isLogedin = false.obs;
  RxInt businessprofileindex = 0.obs;

  RxBool isLoading = false.obs;

  BusinessGetProfileApiServices getProfileApiServices =
      BusinessGetProfileApiServices();
  List<BusinessUser> profileData = [];
  //  List<MemberUser>memberprofiledata=[];

  getProfile() async {
    isLoading(true);
    //profileData.clear();
    print("-------------->>1");
    dio.Response<dynamic> response = await getProfileApiServices.getProfile();
    print("-------------->>2");
    isLoading(false);
    if (response.statusCode == 200) {
      BusinessProfileModel profileModel =
          BusinessProfileModel.fromJson(response.data);
      print("-------------->>3");
      profileData.add(profileModel.user);
      isLogedin(true);
    }
    //fcmtoken

    // } else if (response.statusCode == 401) {
    //   Get.snackbar("Please login again", "",
    //       colorText: Colors.white,
    //       backgroundColor: Colors.red,
    //       snackPosition: SnackPosition.BOTTOM);
    //   Get.find<AuthController>().logout();
    // }
  }

  UpdateBankApiServices updateBankApiServices = UpdateBankApiServices();

  updateBankAccount({required UpdateBankModel merchantUpdateModel}) async {
    isLoading(true);
    dio.Response<dynamic> response = await updateBankApiServices.updateBank(
      merchantUpdateModel: merchantUpdateModel,
    );
    isLoading(false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      //Get.off(() => HomeBottomnavigationBar());
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Bank Account updated",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  AddGalleryApiServices addgalleryapi = AddGalleryApiServices();

  addgalleryApiServices({required dynamic imageprofiletemp}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await addgalleryapi.addgalleryApiServices(gallery: imageprofiletemp);
    isLoading(false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.rawSnackbar(
        backgroundColor: Colors.green,
        messageText: Text(
          "Gallery updated",
          style: primaryFont.copyWith(color: Colors.white),
        ),
      );
    }
  }

  ProfileUpdateApiServices profileUpdateApiServices =
      ProfileUpdateApiServices();

  updateProfile({required MerchantUpdateModel merchantUpdateModel}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await profileUpdateApiServices.profileUpdate(
      merchantUpdateModel: merchantUpdateModel,
    );
    isLoading(false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.off(() => const BusinessProfileSettings());
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "profile updated",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  BusinessprofilepicUpdateApiService businessprofilepicupdateapiservice =
      BusinessprofilepicUpdateApiService();
  updateProfilePic(dynamic image) async {
    dio.Response<dynamic> response =
        await businessprofilepicupdateapiservice.profilepicUpdate(image: image);

    getProfile();
  }

  //get GALLERY

  GetGalleryApiServices getgalleryApiService = GetGalleryApiServices();
  List<GalleryListModel> galleryListData = [];
  getInstance({required String userid}) async {
    isLoading(true);
    print("---------------------------------->>> user id = ${userid}");
    dio.Response<dynamic> response =
        await getgalleryApiService.getgalleryApiServices(userid: userid);
    isLoading(false);
    if (response.statusCode == 200) {
      GetGalleryModel getGalleryList = GetGalleryModel.fromJson(response.data);
      galleryListData = getGalleryList.data;
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       response.data["message"],
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
    update();
  }

  WithdrawWalletApiServices withdrawWalletApiServices =
      WithdrawWalletApiServices();

  withdrawAmountFromWallet({required String amount}) async {
    isLoading(true);
    dio.Response<dynamic> response = await withdrawWalletApiServices
        .withdrawWalletApiServices(amount: amount);
    isLoading(false);
    print(response.data);

    if (response.statusCode == 200) {
      Get.rawSnackbar(
        message: "Withrawal submitted successfully",
        backgroundColor: Colors.green,
      );
      // Get.offAll(() => HomeBottomnavigationBar(
      //       index: 2,
      //     ));
    } else {
      Get.rawSnackbar(
        message: response.data["error"],
        backgroundColor: Colors.red,
      );
    }
  }

  // partial payment

   InitiatePaymentApiServices initiatePaymentApiServices = InitiatePaymentApiServices();

   PaymentResponseApiServices paymentResponseApiServices = PaymentResponseApiServices();

   initiatePartialPayment({
    required double amount,
    required int id,
    required String gstPercentage,
    required String percentageAmount,
    required String totalAmount,
  }) async {
    print('->1');
    await Get.find<ProfileController>().getProfile();
    print('${Get.find<ProfileController>().profileData}');
    dio.Response<dynamic> response =
        await initiatePaymentApiServices.initiatePayment(
            userId: Get.find<ProfileController>().profileData.first.id,
            totalAmount: amount.toStringAsFixed(2),
            status: "Partial Payment");
    print('->2');
    if (response.statusCode == 200) {
      IninitiatePaymentModel ininitiatePaymentModel =
          IninitiatePaymentModel.fromJson(response.data);

      await launchUrl(Uri.parse(
          ininitiatePaymentModel.data.instrumentResponse.redirectInfo.url));
      //st
      startTimer(ininitiatePaymentModel.data.merchantTransactionId, amount,
          id,
          gstPercentage,
          percentageAmount,
          totalAmount

          );
      print("....|||||||||||>>>>...Partial Payment is over ------------>>");
    }
  }

  Timer? tempTimer;
  startTimer(
    var referenceId,
    var amount,
    var id,
    var gstpercentage,
    var persentageamount,
    var totalamount,
  ) {
    print("::payment started-.............");
    tempTimer = Timer.periodic(const Duration(seconds: 6), (timer) async {
      print("timer working ..>>>>>>>>>>>>.");
      int status = await Get.find<ProfileController>().checkPhonePeStatus(
        refernceID: referenceId,
        amount: amount,
        id: id,
        gstPercentage: gstpercentage,
        percentageAmount: persentageamount,
        totalAmount: totalamount,
      );

      print( "........>");
      print(status);

      if (status == 1) {
        print("calceld:::::::::::");
        timer.cancel();
      } else if (status == 2) {
        print("calceld:::::::::::");
        timer.cancel();
      }
    });
  }

  checkPhonePeStatus({
    required int refernceID,
    required double amount,
    required int id,
    required String gstPercentage,
    required String percentageAmount,
    required String totalAmount,
  }) async {
    int paymentId = 0;
    dio.Response<dynamic> response = await paymentResponseApiServices
        .paymentResponseApi(merchantId: refernceID.toString());

    if (response.data["code"] == "PAYMENT_SUCCESS") {
      paymentId = 1;
      print("<<<<<<<<payment is Success>>>>>>>>");
      
      Get.find<ApiSettingController>().collectPartialAmount(
        customerId: refernceID, 
        saleAmount: amount.toString(), 
        planId: id.toString(), 
        collectedDate: "", 
        collectedAmount: "", 
        status: "success"
        );
    } else if (response.data["code"] == "PAYMENT_PENDING") {
      paymentId = 0;
      print("<.....Partial payment is Failed>>>>>>>>");

      //   Get.to(() => PaymentFailedScreen());
    } else {
      paymentId = 2;
    }

    return paymentId;
  }

}
