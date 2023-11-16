import 'package:bciweb/models/business_model/merchant_coupon_list_model.dart';
import 'package:bciweb/models/get_coupons_model.dart';
import 'package:bciweb/services/networks/business_service/merchant_coupon_list_api_service.dart';
import 'package:bciweb/services/networks/our_coupons_api_service.dart';
import 'package:bciweb/services/networks/services/catogory_api_service/redeem_coupons_api_services.dart';
import 'package:bciweb/services/networks/services/catogory_api_service/redeemed_coupons_api_services.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/resmembership/mobile_paymentsucess.dart';
import 'package:bciweb/services/networks/get_coupons_api_service.dart';
import 'package:bciweb/services/networks/subscription/get_payment_apiservice.dart';
import 'package:bciweb/views/members/subscribe/views/payment_sucess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../constant/constans.dart';
import '../../models/get_plansdetails_model.dart';
import '../../models/get_plansmodel.dart';
import '../../models/other_bookingmodel.dart';
import '../../models/redeemed_coupons_model.dart';
import '../../services/networks/othersbooking_api_service.dart';
import '../../services/networks/subscription/get_plan_details_apiservice.dart';
import '../../services/networks/subscription/get_planlist_api_service.dart';
import '../auth_controller/auth_profile_controller.dart';

class SubscriptionApiController extends GetxController {
  GetPlansApiServices getPlansApiServices = GetPlansApiServices();
  AddPaymentApiServices addpaymentApiService = AddPaymentApiServices();
  GetCouponsApiService getcouponesAPiService = GetCouponsApiService();
  GetOthersBookingApiService getOthersbookingApiService =
      GetOthersBookingApiService();
  GetPlansDetailsApiServices getPlansdetailsApiService =
      GetPlansDetailsApiServices();
  RxInt couponindex = 0.obs;
  RxInt index = 0.obs;
  final authprofileController = Get.find<AuthProfileController>();
  List<PlansData> plansdataList = [];
  List<CouponsData> couponsdatalist = [];

  List<Datum> othersbookinglist = [];
  List<Plan> subscriptionplan = [];

  getplansList() async {
    dio.Response<dynamic> response = await getPlansApiServices.getPlans();
    if (response.statusCode == 200) {
      PlansModel plansModel = PlansModel.fromJson(response.data);
      plansdataList = plansModel.data;
    }
    print(response.data);
    print(response.statusMessage);
    update();
  }

  addPaymentSubscription({
    required dynamic id,
    required bool showpayment,
  }) async {
    await authprofileController.getProfile();
    print(showpayment);
    dio.Response<dynamic> response =
        await addpaymentApiService.addPaymentFuction(
            userid: authprofileController.profileData.first.id.toString(),
            planid: id);
    if (response.statusCode == 200) {
      if (showpayment == true) {
        Get.to(PaymentSucess());
      } else {
        Get.to(MobilePaymentSuccess());
      }

      // showpayment == true ? Get.to(PaymentSucess()) :Get.to(MobilePaymentSuccess());
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Invalid Payment",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  getcouponsList() async {
    dio.Response<dynamic> response = await getcouponesAPiService.getcoupons();
    if (response.statusCode == 200) {
      GetCouponsList couponsModel = GetCouponsList.fromJson(response.data);
      couponsdatalist = couponsModel.data;
    }
    update();
  }

  getothersBookingList() async {
    dio.Response<dynamic> response =
        await getOthersbookingApiService.getOthersBooking();
    if (response.statusCode == 200) {
      OtherbookingModel otherbookingModel =
          OtherbookingModel.fromJson(response.data);
      othersbookinglist = otherbookingModel.data;
    }
    update();
  }

  getPlanDetails({required dynamic id}) async {
    subscriptionplan.clear();
    dio.Response<dynamic> response =
        await getPlansdetailsApiService.getPlansDetails(planId: id);

    if (response.statusCode == 200) {
      PlandetailsModel planDetailsModel =
          PlandetailsModel.fromJson(response.data);

      subscriptionplan.add(planDetailsModel.plan);
    }
    update();
  }

  //coupons list
  OurCouponsApiServices ourCouponsApiServices = OurCouponsApiServices();
  RedeemCouponApiServices redeemCouponApiServices = RedeemCouponApiServices();
  List<CouponsData> couponsData = [];
  List<CouponsData> tempcouponsData = [];
  List<CouponsData> categorycouponsData = [];
  List<CouponsRedeemedData> redeemcouponsData = [];

  getCoupons() async {
    dio.Response<dynamic> response =
        await ourCouponsApiServices.ourCouponsApiServices();
    if (response.statusCode == 200) {
      GetCouponsList getCouponsList = GetCouponsList.fromJson(response.data);
      couponsData = getCouponsList.data;
      tempcouponsData = getCouponsList.data;
      List<String> categoyNames = [];
      categorycouponsData = [];
      getCouponsList.data.forEach((element) {
        if (categoyNames.contains(element.name) == false) {
          categorycouponsData.add(element);
          categoyNames.add(element.name);
        }
      });

      couponsData.shuffle();
      update();
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  //merchant coupon list
  MerchantCouponListAPIServices merchantCouponListAPIServices =
      MerchantCouponListAPIServices();
  List<MerchantCouponData> merchantCouponData = [];

  merchantCoupon() async {
    dio.Response<dynamic> response =
        await merchantCouponListAPIServices.merchantCouponList();
    if (response.statusCode == 200) {
      MerchantCouponList merchantCouponList =
          MerchantCouponList.fromJson(response.data);
      merchantCouponData = merchantCouponList.data;
    }
    update();
  }

  // service coupons list
  RedeemCouponApiServices userredeemCouponApiServices =
      RedeemCouponApiServices();
  List<CouponsData> servicecouponsData = [];

  getuserCoupones(
      {required String couponcode,
      required String serviceId,
      required String amount,
      required String vendorId}) async {
    dio.Response<dynamic> response =
        await redeemCouponApiServices.redeemCouponApiServices(
            couponcode: couponcode,
            planId: int.parse(Get.find<AuthProfileController>().planid.value),
            requestAmount: amount,
            serviceId: serviceId,
            vendorId: vendorId);
    if (response.statusCode == 200) {
      GetCouponsList getCouponsList = GetCouponsList.fromJson(response.data);
      couponsData = getCouponsList.data;
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          response.data["message"],
          style: primaryFont.copyWith(color: Colors.white),
        ),
      );
    }
    update();
  }

  RedeemedCouponsCouponApiServices redeemedCouponsCouponApiServices =
      RedeemedCouponsCouponApiServices();

  redeemgetCoupons() async {
    dio.Response<dynamic> response =
        await redeemedCouponsCouponApiServices.redeemedCouponApiServices();
    if (response.statusCode == 200) {
      RedeemedCouponsModel getCouponsList =
          RedeemedCouponsModel.fromJson(response.data);
      redeemcouponsData = getCouponsList.data;
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }
}
