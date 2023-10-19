import 'dart:async';
import 'dart:js';

import 'package:bciweb/controller/home_controller.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/controller/service_controller/home_controller.dart';
import 'package:bciweb/models/initiate_payment_model.dart';
import 'package:bciweb/payment_gateway/payment_gateway_view/payment_view.dart';

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

  checkPhonePeStatus(
      {required String refernceID,
      required double amount,
      required int id,
      required String gstPercentage,
      required String percentageAmount,
      required String totalAmount,
      required int planId}) async {

        int paymentId = 0;
    dio.Response<dynamic> response = await paymentResponseApiServices
        .paymentResponseApi(merchantId: refernceID);

    if (response.data["code"] == "PAYMENT_SUCCESS") {
      paymentId = 1;
      print("<<<<<<<<payment is Success>>>>>>>>");
      Get.find<HomeServiceController>().addSubscription(
          planId: planId,
          customerId: Get.find<ProfileController>().profileData.first.id,
          paymentMenthod: "5",
          utrNumber: "",
          gstPercentage: gstPercentage,
          percentageAmount: percentageAmount,
          amount: amount.toStringAsFixed(2),
          totalAmount: totalAmount);
    } 
    else if (response.data["code"] == "PAYMENT_PENDING")
     {
       paymentId = 0; 
      print("<<<<<<<<payment is Failed>>>>>>>>");

      //   Get.to(() => PaymentFailedScreen());
    }
    else
    {
       paymentId = 2; 
    }

    return paymentId;
  }

  initiatePayment(
      {required double amount,
      required int id,
      required String gstPercentage,
      required String percentageAmount,
      required String totalAmount,
      required int planId}) async {
    print('------------------------------------------------1111111');
    await Get.find<ProfileController>().getProfile();
    print('${Get.find<ProfileController>().profileData}');
    dio.Response<dynamic> response =
        await initiatePaymentApiServices.initiatePayment(
            userId: Get.find<ProfileController>().profileData.first.id,
            totalAmount: totalAmount,
            status: "subscription");
    print('---------------------------2222222222');
    if (response.statusCode == 200) {
      IninitiatePaymentModel ininitiatePaymentModel =
          IninitiatePaymentModel.fromJson(response.data);

      await launchUrl(Uri.parse(
          ininitiatePaymentModel.data.instrumentResponse.redirectInfo.url));
      //st
      startTimer(
        ininitiatePaymentModel.data.merchantTransactionId,
        amount,
        id,
        gstPercentage,
        percentageAmount,
        totalAmount,
        planId,
      );
      print("Payment is over ------------>>");
    }
  }

  Timer? tempTimer;
  startTimer(var referenceId, var amount, var id, var gstpercentage,
      var persentageamount, var totalamount, var planid) {
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
          planId: planid);

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
}
