import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:isgpayui_plugin/isgpayui_plugin.dart';

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
import '../../views/members/homescreens/reg_profile.dart';
import 
'../home_controller.dart';
import '../setting_controller/setting_controller.dart';
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

   RxString planid = "".obs;

  getProfile() async {
    profileData.clear();
    isLoading(true);
    dio.Response<dynamic> response = await getProfileApiServices.getProfile();
    isLoading(false);
    if (response.statusCode == 200) {
      MemberProfileModel profileModel =
          MemberProfileModel.fromJson(response.data);
      isSubscribed(profileModel.subscription);
      planid(profileModel.planId.toString());
      profileData.add(profileModel.user);
      update();
  } else if (response.statusCode == 401) {
      Get.find<AuthController>().logout();
  }
  update();
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



  //payment gateway isgPay

  // String responseData = "Nothing";
  final _isgpayuiPlugin = IsgpayuiPlugin();

  void payFromCart(double amount) async {
    String? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _isgpayuiPlugin.initiateISGPayUI(getArguments(amount * 100)) ??
          'Unknown platform version';
    } on PlatformException catch (e) {
      result = e.message;
    }
    debugPrint('Result ::: $result');

    // var responseData = jsonDecode(result!);
    // var data = jsonDecode(responseData);
    // print("<<----response-data---->>${data.runtimeType}");
    // print(data);
    // if(data["ResponseCode"] == "00"){
    //   final homeController = Get.find<HomeController>();
    //   print(">>-------------->>---------->>");
    //   for (int i = 0; i < homeController.cartListData.length; i++) {
    //     homeController.addBooking(
    //         serviceid: homeController.cartListData[i].serviceId.toString(),
    //         cartid: homeController.cartListData[i].id.toString(),
    //         qty: homeController.cartListData[i].quantity.toString(),
    //         offerOrCoupon: "",
    //         couponcode: "",
    //         amount: homeController.cartListData[i].price);
    //   }

    //   // Get.offAll(
    //   //   () => LoadingWidgets(),
    //   // );

    //   // Get.find<HomeController>().addSubscription(
    //   //     planId: id,
    //   //     customerId: Get.find<ProfileController>().profileData.first.id);

    //   //need to give id
    //   Get.snackbar(
    //     "Payment Successfully Paid",
    //     "",
    //     icon: const Icon(Icons.check_circle_outline_outlined,
    //         color: Colors.white),
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.green,
    //     borderRadius: 20,
    //     margin: const EdgeInsets.all(15),
    //     colorText: Colors.white,
    //     duration: const Duration(seconds: 3),
    //     isDismissible: true,
    //     dismissDirection: DismissDirection.horizontal,
    //     forwardAnimationCurve: Curves.easeOutBack,
    //   );

    //   // print(response);
    // } else {
    //   Get.closeAllSnackbars();
    //   Get.snackbar(
    //       "The last transaction has been cancelled!", "Please try again!",
    //       colorText: Colors.white,
    //       backgroundColor: Colors.red,
    //       snackPosition: SnackPosition.BOTTOM);
    // }
  }

       Map<String, String> getArguments(var amount) {
    var randomStr = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, String> map = {
      'version': "1",
      'txnRefNo': "ORD$randomStr", // Should change on every request
      'amount': "$amount",
      'passCode': 'SVPL4257',
      'bankId': '000004',
      'terminalId': '10100781',
      'merchantId': '101000000000781',
      'mcc': "4112",
      'paymentType': 'Pay',
      'currency': "356",
      'email': 'manu@gmail.com',
      'phone': '+917907886767',
      'hashKey': 'E59CD2BF6F4D86B5FB3897A680E0DD3E',
      'aesKey': '5EC4A697141C8CE45509EF485EE7D4B1',
      'payOpt': 'cc',
      'orderInfo': 'NARUTO00001',
      'env': 'UAT', //UAT PROD
      'url': 'https://sandbox.isgpay.com/ISGPay-Genius/request.action',
    };
    return map;
  }
     void payforWallet(
      {required double amount}) async {
    String? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result =
          await _isgpayuiPlugin.initiateISGPayUI(getArguments(amount * 100)) ??
              'Unknown platform version';
    } on PlatformException catch (e) {
      result = e.message;
    }
    debugPrint('Result ::: $result');

    var responseData = jsonDecode(result!);
    var data = jsonDecode(responseData);
    print("<<----response-data---->>${data.runtimeType}");
    print(responseData);
    print(data);
    if (data["ResponseCode"] == "00") {
      Get.find<ApiSettingController>().addTransaction(amount: amount.toStringAsFixed(2));

      Get.to(RegisterProfileScreen());

      //need to give id
      Get.snackbar(
        "Payment Successfully Paid",
        "",
        icon: const Icon(Icons.check_circle_outline_outlined,
            color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );

    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
          "The last transaction has been cancelled!", "Please try again!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
}
}