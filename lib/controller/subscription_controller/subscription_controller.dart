import 'package:bciweb/models/get_coupons_model.dart';
import 'package:bciweb/responsive/mobile_wdgets/resmembership/mobile_paymentsucess.dart';
import 'package:bciweb/services/networks/get_coupons_api_service.dart';
import 'package:bciweb/services/networks/profile_api_service/profile_api_service.dart';
import 'package:bciweb/services/networks/subscription/get_payment_apiservice.dart';
import 'package:bciweb/views/business/subscribe/views/payment_sucess.dart';
import 'package:bciweb/views/members/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../constant/constans.dart';
import '../../models/get_payment_model.dart';
import '../../models/get_plansdetails_model.dart';
import '../../models/get_plansmodel.dart';
import '../../models/other_bookingmodel.dart';
import '../../services/networks/othersbooking_api_service.dart';
import '../../services/networks/subscription/get_plan_details_apiservice.dart';
import '../../services/networks/subscription/get_planlist_api_service.dart';
import '../auth_controller/auth_profile_controller.dart';

class SubscriptionApiController extends GetxController{
   GetPlansApiServices getPlansApiServices = GetPlansApiServices();
   AddPaymentApiServices addpaymentApiService = AddPaymentApiServices();
   GetCouponsApiService getcouponesAPiService = GetCouponsApiService();
   GetOthersBookingApiService getOthersbookingApiService = GetOthersBookingApiService();
   GetPlansDetailsApiServices getPlansdetailsApiService=GetPlansDetailsApiServices();
  
  
  final authprofileController=Get.find<AuthProfileController>();
    List<PlansData> plansdataList = [];
    List<CouponsData> couponsdatalist=[];

    List<Datum>othersbookinglist=[];
     List<Plan> subscriptionplan=[];

     getplansList() async {
    dio.Response<dynamic> response = await getPlansApiServices.getPlans();
    if (response.statusCode == 200) {
      PlansModel plansModel = PlansModel.fromJson(response.data); 
      plansdataList = plansModel.data;
    }
   
    update();
  }

  addPaymentSubscription({required dynamic id,required bool showpayment,})async{
    await authprofileController.getProfile();
    print(showpayment);
    dio.Response<dynamic>response=await addpaymentApiService.addPaymentFuction(
      userid:authprofileController.profileData.first.id.toString(),
      planid:id
    );
    if(response.statusCode==200){
      if(showpayment==true){
           Get.to(PaymentSucess());
      } else{
        Get.to(MobilePaymentSuccess());
      }

      // showpayment == true ? Get.to(PaymentSucess()) :Get.to(MobilePaymentSuccess()); 
     
    }  else{
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
      GetCouponsModel couponsModel = GetCouponsModel.fromJson(response.data); 
      couponsdatalist=couponsModel.data;
    }
    update();
  }

  getothersBookingList() async {
    dio.Response<dynamic> response = await getOthersbookingApiService.getOthersBooking();
    if (response.statusCode == 200) {
    OtherbookingModel   otherbookingModel = OtherbookingModel.fromJson(response.data); 
      othersbookinglist=otherbookingModel.data;
    }
    update();
  }
   getPlanDetails({required int id}) async {
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
}