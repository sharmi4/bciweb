
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../constant/constans.dart';
import '../models/getCartlistmodel.dart';
import '../models/holidaypackagesmodels/get_package_category_model.dart';
import '../services/networks/services/catogory_api_service/get_category_api_service.dart';
import 'package:dio/dio.dart' as dio;
class HolidayPackageController extends GetxController{
    //get package category
  GetPackageCategoryApiServices getPackageCategoryApiServices = GetPackageCategoryApiServices();
    List<PackageCategoryData> packageCategoryData = [];

  getPackageCategory() async {

    dio.Response<dynamic> response = await getPackageCategoryApiServices.getPackageCategoryApiServices();
    if(response.statusCode == 200){

      GetPackageCategoryList getPackageCategoryList = GetPackageCategoryList.fromJson(response.data);
      packageCategoryData = getPackageCategoryList.data;

    }else{
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }
  
  
  }