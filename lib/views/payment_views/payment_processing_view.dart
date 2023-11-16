import 'dart:async';
import 'dart:convert';

import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/api_flightcontroller/api_flight_Controller.dart';
import 'package:bciweb/models/flight_pax_model.dart';
import 'package:bciweb/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentProcessingView extends StatefulWidget {
  double amount;
  BookingModel bookingModel;
  String referenceId;
  String bookingId;

  PaymentProcessingView({
    required this.amount,
    required this.bookingModel,
    required this.referenceId,
    required this.bookingId,
  });

  @override
  State<PaymentProcessingView> createState() => _PaymentProcessingViewState();
}

class _PaymentProcessingViewState extends State<PaymentProcessingView> {
  final airFlightController = Get.find<ApiflightsController>();

  Timer? tempTimer;

  @override
  void initState() {
    super.initState();
    startTimer();
    // getBackToPaymentProcessing();
  }

  startTimer() async {
    print(":::::::::_________________payment strated---------------");
    print("::::We are on processing page----------->>");
    final prefs = await SharedPreferences.getInstance();
    // var bookingDatas = {
    //   "orderId": orderId.toString(),
    //   "memeberList": widget.memeberList,
    //   "offerAmount": widget.offerAmount,
    //   "poojaDate": widget.poojaDate,
    //   "poojaName": widget.poojaName,
    //   "preiestAmount": widget.preiestAmount,
    //   "session": widget.session,
    //   "templeId": widget.templeId,
    //   "time": widget.time,
    //   "totalAmount": widget.totalAmount,
    // };

    // String bookingDataJson = jsonEncode(bookingDatas);

    // String? bookingDataEncoded = prefs.getString(tempBookingDetails);

    // if (bookingDataEncoded == null || bookingDataEncoded == "null") {
    //   Get.offAllNamed(RoutesName.HOME_PAGE);
    // }

    int timerSeconds = 0;

    tempTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      print("timer working ... processing page");
      timerSeconds = timerSeconds + 5;
      int status = await airFlightController.checkPhonePeStatus(
          refernceID: widget.referenceId,
          amount: widget.amount,
          bookingId: widget.bookingId,
          bookingModel: widget.bookingModel);

      print(
          "<<<>>><<<>>><<>>><>><><><><><><><------cccccc------><><><><><><><><><><><><><><><>");
      print(status);

      if (status == 1) {
        timer.cancel();
        successCallback();
      }
      //  else if (status == 400) {
      //   print("calceld:::::::::::");
      //   timer.cancel();
      //   Get.back();
      // } else if (timerSeconds < 35) {
      //   timer.cancel();
      //   getBackToPaymentProcessing();
      // }
    });
  }

  successCallback() {
    Get.snackbar(
      "Booking Successfull",
      "",
      maxWidth: 400,
      icon:
          const Icon(Icons.check_circle_outline_outlined, color: Colors.white),
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

    // Navigator.pushNamed(context, RoutesName.POOJA_BOOKING__SUCCESS_PAGE);

    Get.offAllNamed(Routes.MEMBHOME);

    //Need to Go to Home Page
    // Get.offAll(() => (
    //       index: 0,
    //     ));
  }

  getBackToPaymentProcessing() async {
    // await Future.delayed(const Duration(seconds: 30));
    // tempTimer!.cancel();
    Get.offAllNamed(Routes.MEMBHOME);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your Payment is Being Processed",
              style: primaryFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Container(
              height: size.height * 0.5,
              width: size.height * 0.4,
              child: Lottie.asset('assets/images/loading_widget.json'),
            ),
            Text(
              "Do not close or refresh this page.",
              style: primaryFont.copyWith(
                  fontSize: 15, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
