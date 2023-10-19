
import 'package:bciweb/models/member_profile.dart';
import 'package:bciweb/services/networks/business_service/business_withdraw_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../constant/constans.dart';
import '../models/business_model/business_profile_model.dart';
import '../models/business_model/business_update_model.dart';
import '../models/business_model/business_updatebank_details_model.dart';
import '../models/get_gallery_model.dart';
import '../services/networks/business_service/business_bankdetails_api_service.dart';
import '../services/networks/business_service/business_gallery_api_service.dart';
import '../services/networks/business_service/business_getprofile_api_service.dart';
import '../services/networks/business_service/business_profile_update.dart';
import '../services/networks/business_service/business_profilepicupdate_api_service.dart';
import '../services/networks/business_service/get_gallery_api_service.dart';
import '../views/business/business_profile/accout_profile.dart';



class ProfileController extends GetxController{
  RxInt profileindex =0.obs;
  RxBool isLogedin = false.obs;
  RxInt businessprofileindex =0.obs; 

  RxBool isLoading = false.obs;

  BusinessGetProfileApiServices getProfileApiServices = BusinessGetProfileApiServices();
    List<BusinessUser> profileData = [];
    //  List<MemberUser>memberprofiledata=[];

   getProfile() async {
    isLoading(true);
    profileData.clear();
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
        await addgalleryapi.addgalleryApiServices(gallery:imageprofiletemp );
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
  ProfileUpdateApiServices profileUpdateApiServices = ProfileUpdateApiServices();
  
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
  BusinessprofilepicUpdateApiService businessprofilepicupdateapiservice =BusinessprofilepicUpdateApiService();
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
        message:response.data["error"],
        backgroundColor: Colors.red,
      );
    }
  }


}