import 'dart:async';

import 'package:bciweb/controller/plans_controller.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/controller/service_controller/home_controller.dart';
import 'package:bciweb/models/initiate_payment_model.dart';
import 'package:bciweb/services/networks/payment_api_services/intiate_payment_api_services.dart';
import 'package:bciweb/services/networks/payment_api_services/payment_status_api_services.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentController extends GetxController{
  
  RxInt paymentindex=0.obs;

  InitiatePaymentApiServices initiatePaymentApiServices = InitiatePaymentApiServices();

  PaymentResponseApiServices paymentResponseApiServices = PaymentResponseApiServices();

  flightInitiatePayment(
      {required double amount,
      required int id,
      required String gstPercentage,
      required String percentageAmount,
      required String totalAmount,
  }) async {
    print('------------------------------------------------11');
    await Get.find<ProfileController>().getProfile();
    print('${Get.find<ProfileController>().profileData}');
    dio.Response<dynamic> response =
        await initiatePaymentApiServices.initiatePayment(
            userId: Get.find<ProfileController>().profileData.first.id,
            totalAmount: totalAmount,
            status: "flight");
    print('---------------------------22');
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
        totalAmount
     
      );
      print("Payment is over ------------>>");
    }
  }

  checkPhonePeStatus(
      {required String refernceID,
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
        //  planId: planId,
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

  Timer? tempTimer;
  startTimer(var referenceId, var amount, var id, var gstpercentage,
      var persentageamount, var totalamount, ) {
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
          "<............<<<......timer.........>>>>>>");
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