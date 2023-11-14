import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/models/business_model/business_getbooking_list_model.dart';
import 'package:bciweb/models/business_model/createservice_model.dart';
import 'package:bciweb/models/getCartlistmodel.dart';
import 'package:bciweb/models/business_model/get_vendor_service_list_model.dart';
import 'package:bciweb/models/setting_model/service_list_model.dart';
import 'package:bciweb/models/time_slot_models.dart';
import 'package:bciweb/models/vendor_category_list_model.dart';
import 'package:bciweb/models/vendor_list_model.dart';
import 'package:bciweb/services/networks/business_service/business_addcoupon_api_service.dart';
import 'package:bciweb/services/networks/business_service/business_addservice_api_service.dart';
import 'package:bciweb/services/networks/business_service/business_bookingdatefilter_api_service.dart';
import 'package:bciweb/services/networks/business_service/business_getbookinglist_api_service.dart';
import 'package:bciweb/services/networks/business_service/business_todayoffers_api_service.dart';
import 'package:bciweb/services/networks/business_service/getservice_bycategory_api_service.dart';
import 'package:bciweb/services/networks/services/get_services_api_services.dart';
import 'package:bciweb/services/networks/services/update_quantity_api_service.dart';
import 'package:bciweb/services/networks/subscription/add_subscription_api_services.dart';
import 'package:bciweb/services/networks/vendor_list_api_services/get_vendor_service_api.dart';
import 'package:bciweb/services/networks/vendor_list_api_services/vendor_category_list_api_service.dart';
import 'package:bciweb/services/networks/vendor_list_api_services/vendor_list_api_service.dart';
import 'package:bciweb/views/business-------------------------------------/sucssesful.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../constant/constans.dart';
import '../../models/get_gallery_model.dart';
import '../../models/todayoffers_model.dart';
import '../../views/responsive------------------------------------/mobile_body/cart_divertion.dart';
import '../../services/networks/services/add_to_cart_api_service.dart';
import '../../services/networks/services/catogory_api_service/add_booking_api_services.dart';
import '../../services/networks/services/catogory_api_service/delete_cart_api_services.dart';
import 'package:dio/dio.dart' as dio;
import '../../services/networks/services/get_cart_service.dart';
import '../../services/networks/services/get_gallery_apiservice.dart';
import '../../services/networks/services/today_offers_apiservice.dart';





class HomeServiceController extends GetxController {


 RxInt isExpand = 999.obs;

  List<TimeSlotModels> sunTimeSlot = [];
  List<TimeSlotModels> monTimeSlot = [];
  List<TimeSlotModels> tueTimeSlot = [];
  List<TimeSlotModels> wedTimeSlot = [];
  List<TimeSlotModels> thuTimeSlot = [];
  List<TimeSlotModels> friTimeSlot = [];
  List<TimeSlotModels> satTimeSlot = [];


setDefaultSlots() {
    isExpand(999);
    sunTimeSlot.clear();
    monTimeSlot.clear();
    tueTimeSlot.clear();
    wedTimeSlot.clear();
    thuTimeSlot.clear();
    friTimeSlot.clear();
    satTimeSlot.clear();
    update();
  }






  RxBool isSubscribed = false.obs;
  RxBool isLoading = false.obs;
  GetCartListApiServices getCartListApiServices = GetCartListApiServices();
  List<CartListData> cartListData = [];
  List<OffersListModel> todayofferslist = [];
    //service data list
  List<ServiceData> serviceDataList = [];
  

  double getGrandTotal() {
    double grandTotal = 0.0;

    print(
        "--------------${cartListData.length}<<-----Riyas ikka------->>${cartListData.length}-----------");
    print(grandTotal);

    for (var i = 0; i < cartListData.length; i++) {
      double amount = double.parse(cartListData[i].amount);
      int qty = int.parse(cartListData[i].quantity);
      double tempTotalAmount = amount * qty;

      grandTotal = grandTotal + tempTotalAmount;
      print("--------------<<-----wasim------->>-----------");
      print(grandTotal);
    }

    return grandTotal;
  }




  //add today offers
  AddTodayOffersApiServices addTodayOffersApiServices = AddTodayOffersApiServices();
AddCouponsApiServices addCouponsApiServices = AddCouponsApiServices();
  addTodayOffers({
    required String image,
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

  GetServicesByCategoryApiServices getServicesByCategoryApiServices =
      GetServicesByCategoryApiServices();


  getServicesByCategory({required String categoryId}) async {
    dio.Response<dynamic> response = await getServicesByCategoryApiServices
        .getServicesByCategory(categoryId: categoryId,vendorId: Get.find<ProfileController>().profileData.first.id.toString());

    if (response.statusCode == 200) {
      ServiceListModel serviceListModel =
          ServiceListModel.fromJson(response.data);

      serviceDataList = serviceListModel.data;
    }
    update();
  }

 GetServicesApiServices getServicesApiServices = GetServicesApiServices();
  getServicesByVendor() async {
    dio.Response<dynamic> response =
        await getServicesApiServices.getServicesByVendor(
            vendorId:
                Get.find<AuthProfileController>().profileData.first.id.toString());

    if (response.statusCode == 200) {
      ServiceListModel serviceListModel =
          ServiceListModel.fromJson(response.data);

      serviceDataList = serviceListModel.data;
    }
    update();
  }
 

//list cart
  getCartdetails() async {
    cartListData.clear();
    dio.Response<dynamic> response =
        await getCartListApiServices.getCartListApiServices();

    if (response.statusCode == 201) {
      GetCartList getCartList = GetCartList.fromJson(response.data);
      cartListData = getCartList.data;
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.black,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  //add cart
  AddToCartApiServices addToCartApiServices = AddToCartApiServices();

  addToCart({required String serviceid, required String amount}) async {
    dio.Response<dynamic> response = await addToCartApiServices
        .addToCartApiServices(serviceid: serviceid, amount: amount);
    if (response.statusCode == 201) {
      Get.to(const MobilecartDivertion());
      Get.rawSnackbar(
          message: response.data["message"], backgroundColor: Colors.green);
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

//delete cart
  DeleteCartApiServices deleteCartApiServices = DeleteCartApiServices();

  deleteToCart({required String serviceid}) async {
    dio.Response<dynamic> response =
        await deleteCartApiServices.deleteCartApiServices(serviceid: serviceid);
    if (response.statusCode == 200) {
      getCartdetails();
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  //add booking api
  AddBookingApiServices addBookingApiServices = AddBookingApiServices();

  addBooking(
      {required String serviceid,
      required String cartid,
      required String qty,
      required String offerOrCoupon,
      required String couponcode,
      required String amount,
       required String bookDateTime}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await addBookingApiServices.addBookingApiServices(
            serviceid: serviceid,
            cartid: cartid,
            qty: qty,
            offerOrCoupon: offerOrCoupon,
            couponcode: couponcode,
            amount: amount);
    isLoading(false);
    if (response.statusCode == 200) {
      deleteToCart(serviceid: serviceid);

      Get.rawSnackbar(
          message: response.data["message"], backgroundColor: Colors.green);
    } else if (response.statusCode == 400) {
      Get.rawSnackbar(
          backgroundColor: Colors.black,
          messageText: Text(
            response.data["error"],
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

  //get today offer

  GetTodayOffersApiService getTodayOffersApiService =
      GetTodayOffersApiService();
  List<OffersListModel> todayOfferListData = [];
  gettodayoffersList() async {
    dio.Response<dynamic> response =
        await getTodayOffersApiService.getTodayoffers();
    if (response.statusCode == 200) {
      List<OffersListModel> getTodayOffersList = List<OffersListModel>.from(
          response.data.map((x) => OffersListModel.fromJson(x)));
      todayOfferListData = getTodayOffersList;
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       response.data["message"],
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
    update();
  }
  //get GALLERY

  GetGalleryApiServices getgalleryApiService = GetGalleryApiServices();
  List<GalleryListModel> galleryListData = [];
  getInstance({required String userid}) async {
    dio.Response<dynamic> response =
        await getgalleryApiService.getgalleryApiServices(userid: userid);
    if (response.statusCode == 200) {
    GetGalleryModel getGalleryList = GetGalleryModel.fromJson(response.data);
      galleryListData = getGalleryList.data;
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       response.data["message"],
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
    update();
  }

  //vendor list

  VendorListApiServices vendorListApiServices = VendorListApiServices();
  List<VendorListModelData> vendorList = [];
  getVendorsList() async {
    dio.Response<dynamic> response =
        await vendorListApiServices.vendorListApiServices();

    if (response.statusCode == 200) {
      VendorListModel vendorListModel = VendorListModel.fromJson(response.data);
      vendorList = vendorListModel.data;
    }
    update();
  }

 VendorServiceListApiServices vendorServiceListApiServices =
      VendorServiceListApiServices();
  List<GetServiceListData> vendorServiceListData = [];

  vendorServiceList(String vendorId) async {
    dio.Response<dynamic> response = await vendorServiceListApiServices
        .vendorServiceListApiServices(vendorId: vendorId);

    if (response.statusCode == 200) {
      GetServiceList getServiceList = GetServiceList.fromJson(response.data);
      vendorServiceListData = getServiceList.data;
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

  //vendor category service
  VendorCategoryListAPIServices vendorCategoryListAPIServices = VendorCategoryListAPIServices();
  List<MerchatCategoryData> merchatCategoryList = [];

  getVendorCategory(String vendorId) async {
    merchatCategoryList.clear();
    update();
    dio.Response<dynamic> response =
        await vendorCategoryListAPIServices.vendorCategory(vendorId: vendorId);

    if (response.statusCode == 200) {
      MerhantCategory merhantCategory = MerhantCategory.fromJson(response.data);
      merchatCategoryList = merhantCategory.data;
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



    addCoupons({
    required String image,
    required String title,
    required String category,
    required String startsat,
    required String endsat,
    required String discountValue,
    required String claimUser,
    required String buyAmt,
  }) async {
    dio.Response<dynamic> response = await addCouponsApiServices.addCouponsApiServices(
      image: image, 
      title: title, 
      category: category, 
      startsat: startsat, 
      endsat: endsat, 
      discountValue: discountValue, 
      merchantId: Get.find<ProfileController>().profileData.first.id.toString(),
      description: claimUser, buyAmt: buyAmt,);
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

 AddServicesApiServices addServicesApiServices = AddServicesApiServices();
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
  



  
  AddSubscriptionApiServices addSubscriptionApiServices =
      AddSubscriptionApiServices();


    addSubscription(
      {
      required int customerId,
      required String paymentMenthod,
      required String gstPercentage,
      required String percentageAmount,
      required String totalAmount,
      required String amount,
      required String utrNumber}) async {
    dio.Response<dynamic> response =
        await addSubscriptionApiServices.addSubscription(
       
            customerId: customerId,
            paymentMenthod: paymentMenthod,
            gstPercentage: gstPercentage,
            percentageAmount: percentageAmount,
            totalAmount: totalAmount,
            amount: amount,
            status: "Success",
            utrNumber: utrNumber);

    if (response.statusCode == 200) {
      Get.to(Sucessful_screen());
     //success screen
      Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Plan Activated Successfully",
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





  //update quantity
  UpdateQuantityAPIServices updateQuantityAPIServices = UpdateQuantityAPIServices();

  updateQuantity({required String cartid,required String quantity}) async {
     dio.Response<dynamic> response = await updateQuantityAPIServices.updateQuantityData(
      cartid: cartid, quantity: quantity);
      if(response.statusCode == 200){

      }
      update();
  }
}
