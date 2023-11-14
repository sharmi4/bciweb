import 'dart:async';

import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/models/initiate_payment_model.dart';
import 'package:bciweb/models/partial_booking_data_model.dart';
// import 'package:bciweb/models/setting_model/credit_partial_model.dart';
import 'package:bciweb/models/setting_model/credit_profile_model.dart';
import 'package:bciweb/models/setting_model/credit_statement_model.dart';
import 'package:bciweb/models/setting_model/get_wallet_details.model.dart';
import 'package:bciweb/models/setting_model/getwallet_details_model.dart';
import 'package:bciweb/models/setting_model/partail_booking_history_model.dart';
import 'package:bciweb/models/support_admin_details_model.dart';
import 'package:bciweb/payment_gateway/payment_gateway_services/initiate_payment_api_services.dart';
import 'package:bciweb/services/networks/creditcard_api_service.dart/get_credit_profile_api_services.dart';
import 'package:bciweb/services/networks/creditcard_api_service.dart/get_partialbooking_api_service.dart';
import 'package:bciweb/services/networks/creditcard_api_service.dart/partial_booking_history_api_service.dart';
import 'package:bciweb/services/networks/creditcard_api_service.dart/pay_credit_api_services.dart';
import 'package:bciweb/services/networks/creditcard_api_service.dart/user_credit_points_api_dart.dart';
import 'package:bciweb/services/networks/creditcard_api_service.dart/view_credit_statement.dart';
import 'package:bciweb/services/networks/partial_payment_api_services/collect_partial_payment.dart';
import 'package:bciweb/services/networks/partial_payment_api_services/partial_payment_api_services.dart';
import 'package:bciweb/services/networks/partial_payment_api_services/partial_payment_history_api_services.dart';
import 'package:bciweb/services/networks/payment_api_services/payment_status_api_services.dart';
import 'package:bciweb/services/networks/setting_api_service.dart/support_admin_details_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:url_launcher/url_launcher.dart';
import '../../models/partial_payment_history_model.dart';
import '../../models/setting_model/ourpartnerlist_model.dart';
import '../../models/setting_model/transation_history_model.dart';
import '../../services/networks/setting_api_service.dart/addtransaction_api_service.dart';
import '../../services/networks/setting_api_service.dart/createsupport_api_service.dart';
import '../../services/networks/setting_api_service.dart/get_referalgenerate_api_service.dart';
import '../../services/networks/setting_api_service.dart/get_wallet_details_api_service.dart';
import '../../services/networks/setting_api_service.dart/ourpartner_api_service.dart';
import '../../services/networks/setting_api_service.dart/transactionhistory_api_service.dart';

class ApiSettingController extends GetxController {
  RxString referralCode = "".obs;
  GetWalletDetailsApiServices getWalletDetailsApiServices =
      GetWalletDetailsApiServices();

  List<GetwalletDetails> getWalletData = [];

  RxInt index = 0.obs;

  getwalletList() async {
    getWalletData.clear();
    dio.Response<dynamic> response =
        await getWalletDetailsApiServices.getWalletDetailsApiServices();
    if (response.statusCode == 200) {
      GetwalletDetails getwalletDetails =
          GetwalletDetails.fromJson(response.data);
      getWalletData.add(getwalletDetails);
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       'Something Went Wrong',
      //       style: primaryFont.copyWith(color: kwhite),
      //     ));
    }
  }

  //generate referral code api
  GenerateReferralCodeApiService generateReferralCodeApiService =
      GenerateReferralCodeApiService();

  generateReferralCode() async {
    dio.Response<dynamic> response =
        await generateReferralCodeApiService.generateReferralCodeApiService();
    if (response.statusCode == 200) {
      referralCode(response.data['code']);
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       "Something went wrong",
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
    update();
  }

  //our partners api
  OurPartnersApiService ourPartnersApiService = OurPartnersApiService();
  List<OurPartnerData> ourPartnersData = [];

  ourPartner() async {
    dio.Response<dynamic> response =
        await ourPartnersApiService.ourPartnersApiService();
    if (response.statusCode == 200) {
      OurPartnersList ourPartnersList = OurPartnersList.fromJson(response.data);
      ourPartnersData = ourPartnersList.data;
    }
    update();
  }

  //create support api
  CreateSupportApiService createSupportApiService = CreateSupportApiService();

  createSupport({
    required String title,
    required String message,
  }) async {
    dio.Response<dynamic> response = await createSupportApiService
        .createSupportApiService(title: title, message: message);
    if (response.statusCode == 201) {
      Get.back();
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data["message"],
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

  //support admin details
  SupportAdminDetailsApiServices supportAdminDetailsApiServices =
      SupportAdminDetailsApiServices();
  ContactDetailsData? contactDetailsData;

  supportAdminDetail() async {
    dio.Response<dynamic> response =
        await supportAdminDetailsApiServices.supportAdminDetailsApiServices();
    if (response.statusCode == 200) {
      SupportAdminModel supportAdminModel =
          SupportAdminModel.fromJson(response.data);
      contactDetailsData = supportAdminModel.data;
    }
    update();
  }

  AddTransactionApiService addTransactionApiServices =
      AddTransactionApiService();

  addTransaction({required String amount}) async {
    dio.Response<dynamic> response =
        await addTransactionApiServices.addTransactionApi(amount: amount);
    print('add transaction');
    print(response.data);
    if (response.statusCode == 200) {
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
      print('add transaction api');
      print(response.data);
    }
    update();
  }

  //transactionhistory api
  TransactionHistoryApiService transactionhistoryapiservice =
      TransactionHistoryApiService();

  List<TransactionHistory> transactionhistorydata = [];

  transactionHistoryDetails() async {
    dio.Response<dynamic> response =
        await transactionhistoryapiservice.transactionHistory();
    if (response.statusCode == 200) {
      TransactionHistoryModel transactionHistoryModel =
          TransactionHistoryModel.fromJson(response.data);
      transactionhistorydata = transactionHistoryModel.transactionHistory;
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       "something went wrong",
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
    update();
  }

  //credit api functions
  GetCreditProfileApiServices getCreditProfileApiServices =
      GetCreditProfileApiServices();

  PayCreditApiServices payCreditApiServices = PayCreditApiServices();

  UseCreditPointsApiServices useCreditPointsApiServices =
      UseCreditPointsApiServices();

  ViewCreditStatementApiServices viewCreditStatementApiServices =
      ViewCreditStatementApiServices();

  RxString creditLimit = "0.00".obs;
  RxString usedLimit = "0.00".obs;
  RxString pendingLimit = "0.00".obs;
  RxString totalPaidAmountCurrentMonth = "0.00".obs;
  RxString totalUnpaidAmountCurrentMonth = "0.00".obs;

  getCreditProfile() async {
    dio.Response<dynamic> response =
        await getCreditProfileApiServices.getCreditProfile();

    if (response.statusCode == 200) {
      CreditProfileModel creditProfileModel =
          CreditProfileModel.fromJson(response.data);

      creditLimit(creditProfileModel.creditLimit.toString());
      usedLimit(creditProfileModel.pendingLimit);
      pendingLimit(creditProfileModel.pendingLimit);
      totalPaidAmountCurrentMonth(
          creditProfileModel.totalPaidAmountCurrentMonth);
      totalUnpaidAmountCurrentMonth(
          creditProfileModel.totalUnpaidAmountCurrentMonth);
    }
  }

  useCredit({
    required String creditAmount,
    required String creditFor,
    required String creditForId,
  }) async {
    dio.Response<dynamic> response =
        await useCreditPointsApiServices.useCreditPointsApi(
            creditAmount: creditAmount,
            creditFor: creditFor,
            creditForId: creditForId);

    if (response.statusCode == 200) {}
  }

  payCreditBill({required String creditAmount}) async {
    dio.Response<dynamic> response = await payCreditApiServices.payCreditApi(
      creditAmount: creditAmount,
    );

    if (response.statusCode == 200) {
      Get.rawSnackbar(
          message: response.data["message"], backgroundColor: Colors.green);
    } else {
      Get.rawSnackbar(
          message: response.data["message"], backgroundColor: Colors.red);
    }
  }

  List<CreditTransaction> creditTransactionsList = [];
  getCreditStatement() async {
    dio.Response<dynamic> response =
        await viewCreditStatementApiServices.viewCreditStatement();

    if (response.statusCode == 200) {
      CreditStatementModel creditStatementModel =
          CreditStatementModel.fromJson(response.data);

      creditTransactionsList = creditStatementModel.creditTransactions;
      update();
    }
  }

  InitiatePaymentApiServices initiatePaymentApiServices =
      InitiatePaymentApiServices();
  initiatePayment({
    required double amount,
  }) async {
    print('------------------------------------------------1111111');
    var userId = 0;
    //   print(Get.find<ProfileController>().profileData);
    //   if (Get.find<ProfileController>().profileData.isNotEmpty) {
    //     userId = Get.find<ProfileController>().profileData.first.id;
    //   } else {
    //     await Get.find<ProfileController>().getProfile();
    //     userId = Get.find<ProfileController>().profileData.first.id;
    //   }
    await Get.find<AuthProfileController>().getProfile();
    print('${Get.find<AuthProfileController>().profileData}');
    dio.Response<dynamic> response =
        await initiatePaymentApiServices.initiatePayment(
            userId: Get.find<AuthProfileController>().profileData.first.id,
            totalAmount: amount.toStringAsFixed(2),
            status: "Pay bill");
    print('---------------------------2222222222');
    if (response.statusCode == 200) {
      IninitiatePaymentModel ininitiatePaymentModel =
          IninitiatePaymentModel.fromJson(response.data);

      await launchUrl(Uri.parse(
          ininitiatePaymentModel.data.instrumentResponse.redirectInfo.url));
      //st
      // startTimer(
      //   ininitiatePaymentModel.data.merchantTransactionId,
      //   amount,

      // );
      print("Payment is over ------------>>");
    }
  }
//  Timer? tempTimer;
//   startTimer( var amount, ) {
//     print(":::::::::_________________payment strated---------------");
//     tempTimer = Timer.periodic(const Duration(seconds: 6), (timer) async {
//       print("timer working ...");
//       int status = await Get.find<ApiSettingController>().checkPhonePeStatus(
//           amount: amount, refernceID: ,

//           );

  //     print(
  //         "<<<>>><<<>>><<>>><>><><><><1><><1><------cccccc------><1><><><><><><><><><><><><><><>");
  //     print(status);

  //     if (status == 1) {
  //       print("calceld:::::::::::");
  //       timer.cancel();
  //     } else if (status == 2) {
  //       print("calceld:::::::::::");
  //       timer.cancel();
  //     }
  //   });
  // }
  PaymentResponseApiServices paymentResponseApiServices =
      PaymentResponseApiServices();

  checkPhonePeStatus({
    required String refernceID,
    required double amount,
    required int id,
  }) async {
    int paymentId = 0;
    dio.Response<dynamic> response = await paymentResponseApiServices
        .paymentResponseApi(merchantId: refernceID);

    if (response.data["code"] == "PAYMENT_SUCCESS") {
      paymentId = 1;
      print("<<<<<<<<payment is Success>>>>>>>>");
    } else if (response.data["code"] == "PAYMENT_PENDING") {
      paymentId = 0;
      print("<<<<<<<<payment is Failed>>>>>>>>");

      //   Get.to(() => PaymentFailedScreen());
    } else {
      paymentId = 2;
    }

    return paymentId;
  }

  GetPartialBookingApiService getPartialBookingApiService =
      GetPartialBookingApiService();

  PartialPaymentHistoryApiServices partialPaymentHistoryApiServices =
      PartialPaymentHistoryApiServices();

  PartialPaymentApiServices partialPaymentApiServices =
      PartialPaymentApiServices();

  CollectPartialPaymentyApiServices collectPartialPaymentyApiServices =
      CollectPartialPaymentyApiServices();

  List<PartialAmount> partialAmountdataList = [];
  List<PartialPaymentHistoryData> partialAmountHistoryList = [];
  RxBool isLoading = false.obs;

  getPartialPaymentDatas() async {
    isLoading(true);
    dio.Response<dynamic> response =
        await partialPaymentApiServices.partialPayment();
    isLoading(false);
    if (response.statusCode == 200) {
      if (response.data["message"] == "No records found for the user") {
        // Get.off(() => QucikPaymentScreen());
      } else {
        PartialAmountModel partialAmountModel =
            PartialAmountModel.fromJson(response.data);
        partialAmountdataList.clear();
        partialAmountdataList.add(partialAmountModel.partialAmount);
        getPartialPaymentDataHistory(
            partialID: partialAmountModel.partialAmount.id.toString());
        update();
      }
    }
  }

  getPartialPaymentDataHistory({required String partialID}) async {
    dio.Response<dynamic> response = await partialPaymentHistoryApiServices
        .partialPaymentHistory(partialID: partialID);

    if (response.statusCode == 200) {
      PartialPaymentHistoryModel partialPaymentHistoryModel =
          PartialPaymentHistoryModel.fromJson(response.data);
      partialAmountHistoryList = partialPaymentHistoryModel.data;
      update();
    }
  }

  collectPartialAmount({
    required int customerId,
    required String saleAmount,
    required String planId,
    required String collectedDate,
    required String collectedAmount,
    required String status,
  }) async {
    dio.Response<dynamic> response =
        await collectPartialPaymentyApiServices.collectPartialPayment(
            collectedAmount: collectedAmount,
            collectedDate: collectedDate,
            customerId: customerId,
            planId: planId,
            saleAmount: saleAmount,
            status: "Pending");

    if (response.statusCode == 200) {
      // Get.rawSnackbar(
      //     message: response.data["message"], backgroundColor: Colors.green);
    }
  }

  List<PartialAmount> partialbookinglist = [];

  PartialBookingHistoryApiService getPartialBookingHistoryApiService =
      PartialBookingHistoryApiService();
  List<PartialData> partialbookinghistorylist = [];
  partialBookingHistory({
    required String partialamountid,
  }) async {
    dio.Response<dynamic> response =
        await getPartialBookingHistoryApiService.PartialBookingHistory(
            partial_id: partialamountid);

    if (response.statusCode == 200) {
      PartialBookingHistoryModel partialBookingHistoryModel =
          PartialBookingHistoryModel.fromJson(response.data);
      partialbookinghistorylist = partialBookingHistoryModel.data;
    }
    update();
  }

  calculateUnPaid(double planAmount, double paidAmount) {
    double remainingAmount = planAmount - paidAmount;

    return remainingAmount.toStringAsFixed(0);
  }
}
