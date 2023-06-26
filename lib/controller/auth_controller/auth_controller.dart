import 'package:bciweb/services/networks/services/authapi_service/auth_api_service.dart';
import 'package:bciweb/services/networks/services/authapi_service/get_otp_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/constans.dart';
import '../../models/create_account_model.dart';
import '../../models/service_model.dart';
import '../../responsive/authentications/generate_otp/generate_otp.dart';
import '../../responsive/authentications/otp_verification/otp_verification.dart';
import '../../responsive/authentications/verified_screen/verified_screen.dart';
import '../../services/networks/services/authapi_service/login_api_service.dart';
import '../../services/networks/services/catogory_api_service/service_list_apiservice.dart';
import '../../views/authentication/Verification_done.dart';
import '../../views/authentication/otp_verification.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLogedin = false.obs;

  MemberRegisterApiservices memberRegisterApiservices =
      MemberRegisterApiservices();
//this api calling

  GetOtpApiService getOTPApiServices = GetOtpApiService();

  LoginApiServices loginApiServices = LoginApiServices();
  ServiceApiService serviceApiServices = ServiceApiService();

  memberRegister({
    required CreateAccountModel? memberRegisterModel,
    required AddressModel? residentialAddress,
    required AddressModel? officialAddress,
    required bool isMobile,
  }) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await memberRegisterApiservices.memberRegister(
            memberRegisterModel: memberRegisterModel,
            residentialAddress: residentialAddress,
            officialAddress: officialAddress);
    isLoading(false);
    if (response.statusCode == 201) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", response.data["token"]);
      if (isMobile == true) {
        Get.to(otp_varification(
          phoneNumber: memberRegisterModel!.mobilenumber,
          otp: response.data["user"]["otp"].toString(),
        ));
      } else {
        Get.to(OtpVerification(
          phoneNumber: memberRegisterModel!.mobilenumber,
          otp: response.data["user"]["otp"].toString(),
        ));
      }
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["errors"].first,
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  getOtpFunction({required String mobileNumber, required bool isMobile}) async {
    isLoading(true);

    dio.Response<dynamic> response =
        await getOTPApiServices.getOtpApi(mobileNumber: mobileNumber);
    isLoading(false);

    if (response.statusCode == 200) {
      if (isMobile == true) {
        Get.to(otp_varification(
          phoneNumber: mobileNumber,
          otp: response.data["otp"].toString(),
        ));
      } else {
        Get.to(OtpVerification(
          phoneNumber: mobileNumber,
          otp: response.data["otp"].toString(),
        ));
      }
    } else if (response.statusCode == 404) {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "User not found",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  loginUsers(
      {required String mobile,
      required String otp,
      required bool screen}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await loginApiServices.loginApi(mobile: mobile, otp: otp);
    isLoading(false);
    if (response.statusCode == 200) {
      if (response.data["user"]["role_id"] == "3") {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("auth_token", response.data["token"]);
        if (screen == true) {
          Get.offAll(verified_Screen());
        } else {
          Get.offAll(const Verification_Done());
        }
      } else {
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            messageText: Text(
              "Invalid Login",
              style: primaryFont.copyWith(color: Colors.white),
            ));
      }
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Invalid OTP",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("auth_token", "null");
    Get.to(const MemberLoginScreenrespo());
  }

  checkAuthendication() async {
    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString("auth_token");

    print("Token is here");
    print(authtoken);
    if (authtoken == "null" || authtoken == null) {
      isLogedin(false);
    } else {
      isLogedin(true);
    }
    update();
  }

  List<ServiceData> dataList = [];

  getservice() async {
    isLoading(true);

    dio.Response<dynamic> response = await serviceApiServices.getServiceApi();
    isLoading(false);

    if (response.statusCode == 200) {
      ServiceModel serviceModel = ServiceModel.fromJson(response.data);
      dataList = serviceModel.data;
      update();
    } else if (response.statusCode == 404) {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "User not found",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }
}
