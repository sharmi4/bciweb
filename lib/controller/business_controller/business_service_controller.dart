import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/constans.dart';
import '../../models/busbookingmodels/redeemption_Coupons_model.dart';
import '../../models/business_model/business_getbooking_list_model.dart';
import '../../models/business_model/createservice_model.dart';
import '../../models/business_model/get_vendor_offerslist_model.dart';
import '../../models/business_model/get_vendor_service_list_model.dart';
import '../../models/business_model/getcouponlist_model.dart';
import '../../models/service_model.dart';
import '../../services/networks/business_service/businees_getvendor_offerslist_api_service.dart';
import '../../services/networks/business_service/business_addcoupon_api_service.dart';
import '../../services/networks/business_service/business_addservice_api_service.dart';
import '../../services/networks/business_service/business_bookingdatefilter_api_service.dart';
import '../../services/networks/business_service/business_couponredemtion_api_service.dart';
import '../../services/networks/business_service/business_deleteaccount_api_service.dart';
import '../../services/networks/business_service/business_get_updateservice_api_service.dart';
import '../../services/networks/business_service/business_getbookinglist_api_service.dart';
import '../../services/networks/business_service/business_todayoffers_api_service.dart';
import '../../services/networks/business_service/getservice_bycategory_api_service.dart';
import '../../services/networks/business_service/lastadd_couponlist_api_service.dart';
import '../../services/networks/vendor_list_api_services/get_vendor_service_api.dart';
import '../../views/authentication/business_authentication/business_generate_otp_screen.dart';
import '../auth_controller/auth_profile_controller.dart';

class BusinessServiceController extends GetxController{
  RxInt Containerindex =0.obs;

   //coupon redeemption api
  BusinessCouponsRedeemptionApiService couponsRedeemptionApiService =
      BusinessCouponsRedeemptionApiService();
  List<CouponRedeemptionData> couponRedeemptionData = [];
  
    redeemptionCoupon() async {
    dio.Response<dynamic> response =
        await couponsRedeemptionApiService.couponsRedeemptionApiService();
    if (response.statusCode == 200) {
      RedeemtioncouponsListModel redeemtioncouponsListModel =
          RedeemtioncouponsListModel.fromJson(response.data);
      couponRedeemptionData = redeemtioncouponsListModel.data;
    } else {
      Get.snackbar("Something went wrong", "",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
    update();
  }
   //vendor service
    updateServices(
      {required CreateServiceModel createServiceModel, required int id}) async {
    isLoading(true);
    dio.Response<dynamic> response = await updateServicesApiServices
        .updateServices(createServiceModel: createServiceModel, id: id);
    isLoading(false);
    if (response.statusCode == 200) {
      getServicesByVendor();
      Get.back();
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Service Updated Successfully",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else if (response.statusCode == 500) {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong, Please check all the fields",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else {}
  }
     getServicesByVendor() async {
      await  Get.find<AuthProfileController>().getProfile();
      if(Get.find<AuthProfileController>().profileData.isNotEmpty){
        dio.Response<dynamic> response =
        await getServicesApiServices.vendorServiceListApiServices(
            vendorId:
                Get.find<AuthProfileController>().profileData.first.id.toString());

    if (response.statusCode == 200) {
      ServiceModel serviceListModel =
          ServiceModel.fromJson(response.data);

      serviceDataList = serviceListModel.data;
    }

      }
     
    update();
  }

  getServicesByCategory({required String categoryId}) async {
    dio.Response<dynamic> response = await getServicesByCategoryApiServices
        .getServicesByCategory(categoryId: categoryId,vendorId: Get.find<AuthProfileController>().profileData.first.id.toString());

    if (response.statusCode == 200) {
      ServiceModel serviceListModel =
          ServiceModel.fromJson(response.data);

      serviceDataList = serviceListModel.data;
    }
    update();
  }
    AddServicesApiServices addServicesApiServices = AddServicesApiServices();
  VendorServiceListApiServices getServicesApiServices = VendorServiceListApiServices();
  GetServicesByCategoryApiServices getServicesByCategoryApiServices =
      GetServicesByCategoryApiServices();
  UpdateServicesApiServices updateServicesApiServices =
      UpdateServicesApiServices();
  RxBool isLoading = false.obs;

  //service data list
  List<ServiceData> serviceDataList = [];

  addServices({required CreateServiceModel createServiceModel}) async {
    isLoading(true);
    dio.Response<dynamic> response = await addServicesApiServices.addServices(
        createServiceModel: createServiceModel);
    isLoading(false);
    if (response.statusCode == 200) {
      getServicesByVendor();
      Get.back();
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Service Created Successfully",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else if (response.statusCode == 500) {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong, Please check all the fields",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    } else {}
  }
  AddCouponsApiServices addCouponsApiServices = AddCouponsApiServices();
     addCoupons({
    required dynamic image,
    required String title,
    required String category,
    required String startsat,
    required String endsat,
    required dynamic discountValue,
    required String claimUser,
  }) async {
    dio.Response<dynamic> response = await addCouponsApiServices.addCouponsApiServices(
      image: image, 
      title: title, 
      category: category, 
      startsat: startsat, 
      endsat: endsat, 
      discountValue: discountValue, 
      merchantId: Get.find<AuthProfileController>().profileData.first.id.toString(),
      description: claimUser,);
      if(response.statusCode == 201){
         Get.back();
         Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Coupon created successfully",
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
   List<CouponsListData> addedCouponList = [];

  AdeedCouponListApiService addedCouponsServices = AdeedCouponListApiService();
   addedCouponsList() async {
    dio.Response<dynamic> response =
        await addedCouponsServices.addedCouponListApiservices();
    if (response.statusCode == 200) {
      GetCouponListModel redeemtioncouponsListModel =
          GetCouponListModel.fromJson(response.data);
      addedCouponList = redeemtioncouponsListModel.posts;
    }
    update();
  }
    //add today offers
  AddTodayOffersApiServices addTodayOffersApiServices = AddTodayOffersApiServices();
  addTodayOffers({
    required dynamic image,
    required String title,
    required String category,
    required String startsat,
    required String endsat,
    required String discountValue,
    required String claimUser,
  }) async {
    dio.Response<dynamic> response = await addTodayOffersApiServices.addTodayOffersApiServices(
      image: image, 
      title: title, 
      category: category, 
      startsat: startsat, 
      endsat: endsat, 
      discountValue: discountValue, 
      claimUser: claimUser,);
      if(response.statusCode == 200){
         Get.back();
         Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Offer created successfully",
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

    //vendor offer list
  GetVendorOfferListApiServices getVendorOfferListApiServices = GetVendorOfferListApiServices();
  List<VendorOfferList> offerListData = [];

  offerList() async {
    dio.Response<dynamic> response = await getVendorOfferListApiServices.getVendorOfferListApiServices();
    if(response.statusCode == 200){
        offerListData = List<VendorOfferList>.from(
          response.data.map((x) => VendorOfferList.fromJson(x)));
    } 
    update();
  }

   //get booking list api
  GetBookingListApiServices getBookingListApiServices = GetBookingListApiServices();
  List<BookingListData> bookingListData = [];

  getBooking() async {
    dio.Response<dynamic> response = await getBookingListApiServices.getBookingListApiServices();
    if(response.statusCode == 200){

      GetBookingList getBookingList = GetBookingList.fromJson(response.data);
      bookingListData = getBookingList.data;

    } else {
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }
  //get date filter booking list
  GetDateFilterBookingListApiServices 
  getDateFilterBookingListApiServices = GetDateFilterBookingListApiServices();

  List<BookingListData> dateFilterBookingListData = [];

  dateFilterBooking({
    required String fromdate,
    required String todate
  }) async {

    dio.Response<dynamic> response = await 
    getDateFilterBookingListApiServices.getDateFilterBookingListApiServices(
      fromdate: fromdate, todate: todate);
      if(response.statusCode == 200){

        GetBookingList getDateFBookingList = GetBookingList.fromJson(response.data);
        bookingListData = getDateFBookingList.data;

      } else {
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }
    
  logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("auth_token", "null");
    Get.to(const BusinessMobileVerification());
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
  
}