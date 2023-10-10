import 'package:bciweb/models/getCartlistmodel.dart';
import 'package:bciweb/models/business_model/get_vendor_service_list_model.dart';
import 'package:bciweb/models/vendor_list_model.dart';
import 'package:bciweb/services/networks/vendor_list_api_services/get_vendor_service_api.dart';
import 'package:bciweb/services/networks/vendor_list_api_services/vendor_list_api_service.dart';
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
  RxBool isSubscribed = false.obs;

  RxBool isLoading = false.obs;
  GetCartListApiServices getCartListApiServices = GetCartListApiServices();

  List<Datum> cartListData = [];
  List<OffersListModel> todayofferslist = [];

  double getGrandTotal({required List<Datum> tcartListData}) {
    double grandTotal = 0.0;

    print(
        "--------------${tcartListData.length}<<-----Riyas ikka------->>${tcartListData.length}-----------");
    print(grandTotal);

    for (var i = 0; i < tcartListData.length; i++) {
      double amount = double.parse(tcartListData[i].amount);
      int qty = int.parse(tcartListData[i].quantity);
      double tempTotalAmount = amount * qty;

      grandTotal = grandTotal + tempTotalAmount;
      print("--------------<<-----wasim------->>-----------");
      print(grandTotal);
    }

    return grandTotal;
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
      required String amount}) async {
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

  //   double getGrandTotal() {
  //   double grandTotal = 0.0;

  //   for (var i = 0; i < cartListData.length; i++) {
  //     double amount = double.parse(cartListData[i].amount);
  //     int qty = int.parse(cartListData[i].quantity.toString());
  //     double tempTotalAmount = amount * qty;

  //     grandTotal = grandTotal + tempTotalAmount;
  //   }

  //   return grandTotal;
  // }
}
