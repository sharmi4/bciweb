import 'package:bciweb/models/getCartlistmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../constant/constans.dart';
import '../../services/networks/services/add_to_cart_api_service.dart';
import '../../services/networks/services/get_cart_service.dart';
import 'package:dio/dio.dart' as dio;

import '../../views/business/services/views/servicescart/servicescart.dart';

class HomeServiceController extends GetxController {
  GetCartListApiServices getCartListApiServices = GetCartListApiServices();
  List<Datum> cartListData = [];
//list cart
  getCartdetails() async {
    dio.Response<dynamic> response =
        await getCartListApiServices.getCartListApiServices();

    if (response.statusCode == 201) {
      GetCartList getCartList = GetCartList.fromJson(response.data);
      cartListData = getCartList.data;
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

  //add cart
  AddToCartApiServices addToCartApiServices = AddToCartApiServices();

  addToCart({required String serviceid}) async {
    dio.Response<dynamic> response =
        await addToCartApiServices.addToCartApiServices(serviceid: serviceid);
    if (response.statusCode == 201) {
      Get.to(const ServicesCart());
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
}
