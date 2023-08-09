import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../constant/constans.dart';
import '../../models/create_account_model.dart';
import '../../models/member profileupdate.dart';
import '../../models/member_profile.dart';
import '../../services/networks/profile_api_service/profile_api_service.dart';
import '../../services/networks/profile_api_service/profile_pick.dart';
import '../../services/networks/profile_api_service/profile_update.dart';
import '../../services/networks/profile_api_service/update_officialaddress.dart';
import '../../services/networks/profile_api_service/update_residentialaddressapi.dart';
import '../../services/networks/setting_api_service.dart/get_referalgenerate_api_service.dart';
import 'auth_controller.dart';



class AuthProfileController extends GetxController {
  GetProfileApiServices getProfileApiServices = GetProfileApiServices();
    GenerateReferralCodeApiService generateReferralCodeApiService = GenerateReferralCodeApiService();
  ProfileUpdateApiServices profileUpdateApi = ProfileUpdateApiServices();

  UpdateResidencialAddressApiServices updateResidencialAddressApiServices =
      UpdateResidencialAddressApiServices();

  UpdateOfficialApiServices updateOfficialApiServices =
      UpdateOfficialApiServices();

  ProfilePIcUpdateApiServices profilePIcUpdateApiServices =
      ProfilePIcUpdateApiServices();

  List<MemberUser> profileData = [];

  RxBool isLoading = false.obs;
  
  RxBool isSubscribed = false.obs;

  RxString planId = "".obs;

  getProfile() async {
    profileData.clear();
    isLoading(true);
    dio.Response<dynamic> response = await getProfileApiServices.getProfile();
    isLoading(false);
    if (response.statusCode == 200) {
      MemberProfileModel profileModel =
          MemberProfileModel.fromJson(response.data);
      isSubscribed(profileModel.subscription);
      
      profileData.add(profileModel.user);
      planId(profileModel.planId.toString());
      update();
} else if (response.statusCode == 401) {
      Get.find<AuthController>().logout();
  }

  return planId.value;

  }

  updateProfile(
      {required MemberProfileUpdateModel memberProfileUpdateModel}) async {
    isLoading(true);
    dio.Response<dynamic> response = await profileUpdateApi.profileUpdate(
        memberProfileUpdateModel: memberProfileUpdateModel);
    isLoading(false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "profile updated",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  updateRecidencyAddress({required AddressModel residentialAddress}) async {
    isLoading(true);
    dio.Response<dynamic> response = await updateResidencialAddressApiServices
        .updateResidencialAddressApi(residentialAddress: residentialAddress);
    isLoading(false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Address updated",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  updateOfficalAddress({required AddressModel officialAddress}) async {
    isLoading(true);
    dio.Response<dynamic> response = await updateOfficialApiServices
        .updateOfficialAddress(officialAddress: officialAddress);
    isLoading(false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Address updated",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  updateProfilePic(dynamic image) async {
    dio.Response<dynamic> response =
        await profilePIcUpdateApiServices.profilepicUpdate(image: image);

    getProfile();
  }
}
