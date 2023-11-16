import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/services/networks/services/catogory_api_service/unreddem_coupons_Api_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../models/member_profile.dart';

import '../../services/networks/services/catogory_api_service/redeem_coupons_api_services.dart';

//import '../services/network/profile_api_services/update_residencial_address_api_services.dart';

class RedeemController extends GetxController {
  // GetProfileApiServices getProfileApiServices = GetProfileApiServices();
  //ProfileUpdateApiServices profileUpdateApi = ProfileUpdateApiServices();
  // UpdateResidencialAddressApiServices updateResidencialAddressApiServices =
  //   UpdateResidencialAddressApiServices();
  // UpdateOfficialApiServices updateOfficialApiServices =
  //   UpdateOfficialApiServices();

  // ProfilePIcUpdateApiServices profilePIcUpdateApiServices =
  //   ProfilePIcUpdateApiServices();

  List<MemberUser> profileData = [];

  RxBool isSubscribed = false.obs;

  RxBool isLoading = false.obs;

  // getProfile() async {
  //   profileData.clear();
  //   dio.Response<dynamic> response = await getProfileApiServices.getProfile();
  //   if (response.statusCode == 200) {
  //     MemberProfileModel profileModel =
  //         MemberProfileModel.fromJson(response.data);
  //     isSubscribed(profileModel.subscription);
  //     profileData.add(profileModel.user);
  //     update();
  //   } else if (response.statusCode == 401) {
  //     Get.find<AuthController>().logout();
  //   }
  // }

  // updateProfile(
  //     {required MemberProfileUpdateModel memberProfileUpdateModel}) async {
  //   isLoading(true);
  //   dio.Response<dynamic> response = await profileUpdateApi.profileUpdate(
  //       memberProfileUpdateModel: memberProfileUpdateModel);
  //   isLoading(false);
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     Get.rawSnackbar(
  //         backgroundColor: Colors.green,
  //         messageText: Text(
  //           "profile updated",
  //           style: primaryFont.copyWith(color: Colors.white),
  //         ));
  //   }
  // }

  // updateRecidencyAddress({required AddressModel residentialAddress}) async {
  //   isLoading(true);
  //   dio.Response<dynamic> response = await updateResidencialAddressApiServices
  //       .updateResidencialAddressApi(residentialAddress: residentialAddress);
  //   isLoading(false);
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     Get.rawSnackbar(
  //         backgroundColor: Colors.green,
  //         messageText: Text(
  //           "Address updated",
  //           style: primaryFont.copyWith(color: Colors.white),
  //         ));
  //   }
  // }

  // updateOfficalAddress({required AddressModel officialAddress}) async {
  //   isLoading(true);
  //   dio.Response<dynamic> response = await updateOfficialApiServices
  //       .updateOfficialAddress(officialAddress: officialAddress);
  //   isLoading(false);
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     Get.rawSnackbar(
  //         backgroundColor: Colors.green,
  //         messageText: Text(
  //           "Address updated",
  //           style: primaryFont.copyWith(color: Colors.white),
  //         ));
  //   }
  // }

  // updateProfilePic(File image) async {
  //   dio.Response<dynamic> response =
  //       await profilePIcUpdateApiServices.profilepicUpdate(image: image);

  //   getProfile();
  // }

  //coupons list
  // OurCouponsApiServices ourCouponsApiServices = OurCouponsApiServices();
  // List<CouponsData> couponsData = [];

  // getCoupons() async {
  //   dio.Response<dynamic> response =
  //       await ourCouponsApiServices.ourCouponsApiServices();
  //   if (response.statusCode == 200) {
  //     GetCouponsList getCouponsList = GetCouponsList.fromJson(response.data);
  //     couponsData = getCouponsList.data;
  //   } else {
  //     Get.rawSnackbar(
  //         backgroundColor: Colors.red,
  //         messageText: Text(
  //           response.data["message"],
  //           style: primaryFont.copyWith(color: Colors.white),
  //         ));
  //   }
  //   update();
  // }

  // redeem coupon
  RedeemCouponApiServices redeemCouponApiServices = RedeemCouponApiServices();

  UnRedeemCouponApiServices unRedeemCouponApiServices =
      UnRedeemCouponApiServices();

  redeemCoupon(
      {required String couponcode,
      required String serviceId,
      required String requestAmount,
      required String vendorId}) async {
    dio.Response<dynamic> response =
        await redeemCouponApiServices.redeemCouponApiServices(
            couponcode: couponcode,
            planId: int.parse(Get.find<AuthProfileController>().planid.value),
            requestAmount: requestAmount,
            serviceId: serviceId,
            vendorId: vendorId);
    if (response.statusCode == 200) {
      Get.rawSnackbar(
          message: response.data["message"], backgroundColor: Colors.green);
    } else if (response.statusCode == 400) {
      Get.rawSnackbar(
          message: response.data["errors"]["coupon_code"].first,
          backgroundColor: Colors.red);
    } else {
      Get.rawSnackbar(
          message: response.data["error"], backgroundColor: Colors.red);
    }

    return response.data["amount"].toString();
  }

  unRedeemCoupon(
      {required String couponcode, required String serviceId}) async {
    dio.Response<dynamic> response = await unRedeemCouponApiServices
        .unRedeemCouponApiServices(couponcode: couponcode);
    if (response.statusCode == 200) {
      Get.rawSnackbar(
          message: response.data["message"], backgroundColor: Colors.green);
    } else if (response.statusCode == 400) {
      Get.rawSnackbar(
          message: response.data["errors"]["coupon_code"].first,
          backgroundColor: Colors.red);
    } else {
      Get.rawSnackbar(
          message: response.data["error"], backgroundColor: Colors.red);
    }

    return response.data["amount"].toString();
  }
  //easebuzz

  // static MethodChannel _channel = MethodChannel('easebuzz');
//  EaseBuzzTokenApiService easeBuzzApi = EaseBuzzTokenApiService();

  // payUseingEaseBuzz(
  //     {
  //     required int id,
  //     required String amount,
  //     required String customerName,
  //     required String email,
  //     required String phone,
  //     required dynamic status,

  //     }) async {
  //   Get.find<ProfileController>().getProfile();
  //   var response = await easeBuzzApi.getPaymentToken(
  //       amount: amount,
  //       customerName: customerName,
  //       email: email,
  //       id: "07889${DateTime.now().microsecond}${DateTime.now().second}",
  //       phone: phone);

  //   String access_key = response["data"];
  //   String pay_mode = "test";

  //   print("access_key >>$access_key");
  //   Object parameters = {"access_key": access_key, "pay_mode": pay_mode};
  //   // isPayLoading(false);
  //   isLoading(false);
  //   final payment_response =
  //       await _channel.invokeMethod("payWithEasebuzz", parameters);
  //   print(payment_response);
  //   isLoading(false);
  //   if (payment_response["result"] == "payment_successfull") {

  //       final homeController = Get.find<HomeController>();
  //        for(int i = 0; i < homeController.cartListData.length; i++){
  //               homeController.addBooking(
  //               serviceid: homeController.cartListData[i].serviceId,
  //               cartid: homeController.cartListData[i].id.toString(),
  //               qty: homeController.cartListData[i].quantity,
  //               offerOrCoupon: "",
  //               couponcode: "",
  //               amount: homeController.cartListData[i].price
  //               );
  //             }

  //     // Get.find<HomeController>().addSubscription(
  //     //     planId: id,
  //     //     customerId: Get.find<ProfileController>().profileData.first.id);

  //     //need to give id
  //     Get.snackbar(
  //       "Payment Successfully Paid",
  //       "",
  //       icon: const Icon(Icons.check_circle_outline_outlined,
  //           color: Colors.white),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green,
  //       borderRadius: 20,
  //       margin: const EdgeInsets.all(15),
  //       colorText: Colors.white,
  //       duration: const Duration(seconds: 3),
  //       isDismissible: true,
  //       dismissDirection: DismissDirection.horizontal,
  //       forwardAnimationCurve: Curves.easeOutBack,
  //     );

  //     print(response);
  //   } else {
  //     Get.closeAllSnackbars();
  //     Get.snackbar(
  //         "The last transaction has been cancelled!", "Please try again!",
  //         colorText: Colors.white,
  //         backgroundColor: Colors.red,
  //         snackPosition: SnackPosition.BOTTOM);
  //   }
  // }
}
