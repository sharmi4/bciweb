import 'dart:async';
import 'dart:js';

import 'package:bciweb/controller/home_controller.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/controller/service_controller/home_controller.dart';
import 'package:bciweb/models/get_plansmodel.dart';
import 'package:bciweb/models/initiate_payment_model.dart';
import 'package:bciweb/payment_gateway/payment_gateway_view/payment_view.dart';
import 'package:bciweb/services/networks/business_service/business_withdraw_api_service.dart';

import 'package:bciweb/services/networks/payment_api_services/payment_status_api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:dio/dio.dart' as dio;
import 'package:url_launcher/url_launcher.dart';

import '../services/networks/payment_api_services/intiate_payment_api_services.dart';

class PlanController extends GetxController {
  InitiatePaymentApiServices initiatePaymentApiServices =
      InitiatePaymentApiServices();

  PaymentResponseApiServices paymentResponseApiServices =
      PaymentResponseApiServices();
  RxInt isWalletOrNot = 0.obs;
  get getPlansApiServices => null;

  checkPhonePeStatus({
    required String refernceID,
    required double amount,
    required int id,
    required String gstPercentage,
    required String percentageAmount,
    required String totalAmount,
  }) async {
    int paymentId = 0;
    dio.Response<dynamic> response = await paymentResponseApiServices
        .paymentResponseApi(merchantId: refernceID);

    if (response.data["code"] == "PAYMENT_SUCCESS") {
      paymentId = 1;
      print("<<<<<<<<payment is Success>>>>>>>>");

      Get.find<HomeServiceController>().addSubscription(
         //   planId: planId,
          customerId: Get.find<ProfileController>().profileData.first.id,
          paymentMenthod: "5",
          utrNumber: "",
           gstPercentage: gstPercentage,
           percentageAmount: percentageAmount,
          amount: amount.toStringAsFixed(2),
          totalAmount: totalAmount
          );
    } else if (response.data["code"] == "PAYMENT_PENDING") {
      paymentId = 0;
      print("<<<<<<<<payment is Failed>>>>>>>>");

      //   Get.to(() => PaymentFailedScreen());
    } else {
      paymentId = 2;
    }

    return paymentId;
  }

  initiatePayment({
    required double amount,
    required int id,
    required String gstPercentage,
    required String percentageAmount,
    required String totalAmount,
  }) async {
    print('------------------------------------------------1111111');
    await Get.find<ProfileController>().getProfile();
    print('${Get.find<ProfileController>().profileData}');
    dio.Response<dynamic> response =
        await initiatePaymentApiServices.initiatePayment(
            userId: Get.find<ProfileController>().profileData.first.id,
            totalAmount: amount.toStringAsFixed(2),
            status: "subscription");
    print('---------------------------2222222222');
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
      print("Payment is over ------------>>");
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
    print(":::::::::_________________payment strated---------------");
    tempTimer = Timer.periodic(const Duration(seconds: 6), (timer) async {
      print("timer working ...");
      int status = await Get.find<PlanController>().checkPhonePeStatus(
        refernceID: referenceId,
        amount: amount,
        id: id,
        gstPercentage: gstpercentage,
        percentageAmount: persentageamount,
        totalAmount: totalamount,
      );

      print(
          "<<<>>><<<>>><<>>><>><><><><1><><1><------cccccc------><1><><><><><><><><><><><><><><>");
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

  calcGstAmount(String gstPercentage, String saleAmount) {
    print("<<--------on payment screen------->>");
    int tempGst = int.parse(gstPercentage);
    int tempSaleAmount = int.parse(saleAmount);
    var tempGstPercent = tempGst / 100;

    var gstAmount = tempSaleAmount * tempGstPercent;

    return gstAmount;
  }

  calcTotalAmountIncGst(String gstPercentage, String saleAmount) {
    int tempGst = int.parse(gstPercentage);
    int tempSaleAmount = int.parse(saleAmount);
    var tempGstPercent = tempGst / 100;

    var gstAmount = tempSaleAmount * tempGstPercent;
    var totalAmountincGst = tempSaleAmount + gstAmount;
    return totalAmountincGst;
  }

  List<PlansData> plansdataList = [];
  getplansList() async {
    dio.Response<dynamic> response = await getPlansApiServices.getPlans();
    if (response.statusCode == 200) {
      PlansModel plansModel = PlansModel.fromJson(response.data);
      plansdataList = plansModel.data;
    }
    update();
  }



    WithdrawWalletApiServices withdrawWalletApiServices =
      WithdrawWalletApiServices();

  payFromWallet({required String amount}) async {
    final homeController = Get.find<HomeServiceController>();

    dio.Response<dynamic> respone = await withdrawWalletApiServices
        .withdrawWalletApiServices(amount: amount);

    if (respone.statusCode == 200) {
  //    Get.to(() => const FlightLoadingPage());
      print(">>-------------->>---------->>");
      for (int i = 0; i < homeController.cartListData.length; i++) {
        if (homeController.cartListData[i].isSelected) {
          homeController.addBooking(
              serviceid: homeController.cartListData[i].serviceId.toString(),
              cartid: homeController.cartListData[i].id.toString(),
              qty: homeController.cartListData[i].quantity.toString(),
              offerOrCoupon: "",
              couponcode: "",
              amount: homeController.cartListData[i].price,
              bookDateTime: homeController.cartListData[i].bookDateTime);
        }
      }

      // Get.offAll(
      //   //() => LoadingWidgets(),
      // );

      // Get.find<HomeController>().addSubscription(
      //     planId: id,
      //     customerId: Get.find<ProfileController>().profileData.first.id);

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
      Get.rawSnackbar(
          message: respone.data["error"], backgroundColor: Colors.red);
    }

    // print(response);
  }

  
}
