





import 'package:bciweb/models/category_model.dart';
import 'package:bciweb/models/setting_model/transation_history_model.dart';
import 'package:bciweb/services/networks/services/authapi_service/delete_user_api_services.dart';
import 'package:bciweb/services/networks/transaction_history_api_service.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/authentication/respo_business_otpverification.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/home_respo/busimess_home_respo.dart';
import 'package:bciweb/services/networks/services/authapi_service/auth_api_service.dart';
import 'package:bciweb/services/networks/services/authapi_service/get_otp_api_service.dart';
import 'package:bciweb/services/networks/services/catogory_api_service/category_api_service.dart';
import 'package:bciweb/views/authentication/business_authentication/business_otp_verification_done.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/constans.dart';
import '../../models/busbookingmodels/category_model.dart';
import '../../models/business_model/merchants_register_model.dart';
import '../../models/create_account_model.dart';
import '../../models/service_model.dart';
import '../../models/sub_category_model.dart';
import '../../views/responsive------------------------------------/authentications/otp_verification/otp_verification.dart';
import '../../views/responsive------------------------------------/authentications/verified_screen/verified_screen.dart';
import '../../services/networks/business_service/business_login_api_service.dart';
import '../../services/networks/business_service/merchant_api_services.dart';
import '../../services/networks/services/authapi_service/login_api_service.dart';
import '../../services/networks/services/catogory_api_service/service_list_apiservice.dart';
import '../../services/networks/services/catogory_api_service/sub_category_api_services.dart';
import '../../services/networks/services/register_referal_api_service.dart';
import '../../services/networks/setting_api_service.dart/get_referalgenerate_api_service.dart';
import '../../views/authentication/Verification_done.dart';
import '../../views/authentication/business_authentication/business_generate_otp_screen.dart';
import '../../views/authentication/business_authentication/business_otp_verification.dart';
import '../../views/authentication/generate_otp_screen.dart';
import '../../views/authentication/otp_verification.dart';








class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLogedin = false.obs;
  List<CategoryData> categoryList = [];

  MemberRegisterApiservices memberRegisterApiservices =
      MemberRegisterApiservices();

  MerchantRegisterApiServices merchantRegisterApiServices =
      MerchantRegisterApiServices();

  GenerateReferralCodeApiService generateReferralCodeApiService =
      GenerateReferralCodeApiService();
//this api calling

  GetOtpApiService getOTPApiServices = GetOtpApiService();

  LoginApiServices loginApiServices = LoginApiServices();
  ServiceApiService serviceApiServices = ServiceApiService();
  RxBool isGstAvailable = true.obs;
  // RxBool isLoading = false.obs;
  RxBool isOTPLoading = false.obs;
  RxInt imageIndex = 0.obs;
  

  Future<String> rendOtpFunction({required String mobileNumber}) async {
    String otpCode = "null";
    isOTPLoading(true);

    dio.Response<dynamic> response =
        await getOTPApiServices.getOtpApi(mobileNumber: mobileNumber);
    isOTPLoading(false);

    if (response.statusCode == 200) {
      otpCode = response.data["otp"].toString();
    }
    return otpCode;
  }

  memberRegister({
    required CreateAccountModel? memberRegisterModel,
    // required AddressModel? residentialAddress,
    // required AddressModel? officialAddress,
    required bool isMobile,
    required String referalcode,
  }) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await memberRegisterApiservices.memberRegister(
      memberRegisterModel: memberRegisterModel,
      // residentialAddress: residentialAddress,
      // officialAddress: officialAddress
    );
    isLoading(false);
    if (response.statusCode == 201) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", response.data["token"]);
      registerReferalcode(referalcode: referalcode);
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
    } 
  }

  //api callings
  registerMerchants(
      {required MerchantRegisterModel merchantRegisterModel,
      required String referralCode}) async {
    isLoading(true);
    dio.Response<dynamic> response = await merchantRegisterApiServices
        .merchantRegister(merchantRegisterModel: merchantRegisterModel);
    isLoading(false);
    if (response.statusCode == 201) {
      registerReferalcode(referalcode: referralCode);
      Get.to(BusinessOtpVerification(
        phoneNumber: merchantRegisterModel.mobile,
        otp: response.data["user"]["otp"].toString(),
      ));
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["errors"].first,
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  getbusinessOtpFunction(
      {required String mobileNumber, required bool isMobile}) async {
    isLoading(true);

    dio.Response<dynamic> response =
        await getOTPApiServices.getOtpApi(mobileNumber: mobileNumber);
    isLoading(false);

    if (response.statusCode == 200) {
      if (isMobile == true) {
           Get.to(
          RespoBusinessOtpVerification(
            phoneNumber: mobileNumber,
            otp: response.data["otp"].toString(),
          ),
        );
      
      } else {
         Get.to(BusinessOtpVerification(
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
        ),
      );
    }
  }

  getOtpFunction({
    required String mobileNumber,
    required bool isMobile,
  }) async {
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

  BusinessLoginApiServices businessLoginApiServices =
      BusinessLoginApiServices();
  businessloginUsers(
      {required String mobile,
      required String otp,
      required bool screen}) async {
    isLoading(true);
    dio.Response<dynamic> response = await businessLoginApiServices
        .businessloginApi(mobile: mobile, otp: otp);

    print("login data");
    print(response.data);
    isLoading(false);
    if (response.statusCode == 200) {
      print(
          '------------------------------${response.data["user"]["role_id"].toString()}----------VENDOR------------roll id-----------');
      print(
          '--------------------------${screen}-------------------screen--------');
      if (response.data["user"]["role_id"].toString() == "5") {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("auth_token", response.data["token"]);
        await prefs.setString("id", response.data["user"]["id"].toString());
        if (screen == true) {
          Get.offAll(BusinesHomeRespo());
        } else {
          Get.offAll(const BusinessVerificationDone());
        }
      }
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          "Invalid OTP",
          style: primaryFont.copyWith(color: Colors.white),
        ),
      );
    }
  }

  loginUsers(
      {required String mobile,
      required String otp,
      required bool screen}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await loginApiServices.loginApi(mobile: mobile, otp: otp);

    print("login data");
    print(response.data);
    isLoading(false);
    if (response.statusCode == 200) {
      //

      if (response.data["user"]["role_id"].toString() == "3") {
        print(
            '------------------------------${response.data["user"]["role_id"].toString()}---------------MEMBER-------roll id-----------');
        print(
            '--------------------------${screen}-------------------screen--------');
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("auth_token", response.data["token"]);
        await prefs.setString("id", response.data["user"]["id"].toString());
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

  //   //verify otp
  // VerifyOtpApiServices verifyOtpApiServices = VerifyOtpApiServices();

  // verifyOtp(
  //     {required String mobile,
  //     required String otp,
  //     required bool isFromRegister}) async {
  //   dio.Response<dynamic> response = await verifyOtpApiServices
  //       .verifyOtpApiServices(mobile: mobile, otp: otp);
  //   if (response.statusCode == 200) {
  //     if (isFromRegister) {
  //       Get.offAll(() => const WaitingForApprovalScreen());
  //       Get.rawSnackbar(
  //           backgroundColor: Colors.blue,
  //           messageText: Text(
  //             "Thank you for registering! Your account is pending approval.",
  //             style: primaryFont.copyWith(color: Colors.white),
  //           ));
  //     } else {
  //       Get.offAll(const BusinessverifiedScreen());
  //     }
  //   } else {
  //     Get.rawSnackbar(
  //         backgroundColor: Colors.red,
  //         messageText: Text(
  //           "something went wrong",
  //           style: primaryFont.copyWith(color: Colors.white),
  //         ));
  //   }
  // }
  logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("auth_token", "null");
    // Get.to(const MemberLoginScreenrespo());
  }

  logoutWeb() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("auth_token", "null");
    Get.to(MobileVerification());
    // Get.to(const MemberLoginScreenrespo());
  }

  businesslogoutWeb() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("auth_token", "null");
    Get.to(BusinessMobileVerification());
    // Get.to(const MemberLoginScreenrespo());
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

  RegisterReferalCodeApiService registerReferalCodeApiService =
      RegisterReferalCodeApiService();
  registerReferalcode({required String referalcode}) async {
    print('Register referal code');
    dio.Response<dynamic> response = await registerReferalCodeApiService
        .registerreferalcodeApiservice(referalcode: referalcode);
    if (response.data['success'] == true) {
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data['message'],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  GetCategoryApiServices getCategoryApiServices = GetCategoryApiServices();
  List<CategoryData> categoryData = [];

  getCategoryList() async {
    dio.Response<dynamic> response = await getCategoryApiServices.getCategory();

    if (response.statusCode == 201) {
      CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      categoryData = categoryModel.data;
    }
    update();
  }

  GetSubCategoryApiServices getSubCategoryApiServices =
      GetSubCategoryApiServices();
  List<SubCategoryModelList> subCategoryList = [];

  getSubCategoryList() async {
    dio.Response<dynamic> response =
        await getSubCategoryApiServices.getSubCategory();

    if (response.statusCode == 201) {
      SubCategoryModel subCategoryModel =
          SubCategoryModel.fromJson(response.data);
      subCategoryList = subCategoryModel.data;
    }
    update();
  }


DeleteUserAccountApi deleteUserAccountApi = DeleteUserAccountApi();

deleteUser() async {
    isLoading(true);
    dio.Response<dynamic> response = await deleteUserAccountApi
        .deleteUserAccountApi();
    isLoading(false);
    if (response.statusCode == 200) {
     Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }









    //transaction history
  TransactionHistoryApiServices transactionHistoryApiServices =
      TransactionHistoryApiServices();
  List<TransactionHistory> transactionHistorydata = [];

  transactionHistoryDetails() async {
    dio.Response<dynamic> response =
        await transactionHistoryApiServices.transactionHistoryApi();
    if (response.statusCode == 200) {
      TransactionHistoryModel transactionHistoryModel =
          TransactionHistoryModel.fromJson(response.data);
      transactionHistorydata = transactionHistoryModel.transactionHistory;
      print('transaction data');
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }


}
