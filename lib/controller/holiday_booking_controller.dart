
import 'package:bciweb/models/holiday_packages_models/get_package_category_model.dart';
import 'package:bciweb/services/networks/services/holiday_packages_api_services/create_enquiry_api_service.dart';
import 'package:bciweb/services/networks/services/holiday_packages_api_services/get_package_category_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../constant/constans.dart';
import '../models/getCartlistmodel.dart';


import 'package:dio/dio.dart' as dio;
class HolidayPackageController extends GetxController{
   RxInt child = 0.obs;
  RxInt adult = 0.obs;
  RxInt infant = 0.obs;
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
  CreateEnquiryApiService createEnquiryApiService = CreateEnquiryApiService();

  createEnquiry({
    required String packageid,
    required String vendorid,
    required String cityofdeparture,
    required String dateofdeparture,
    required String adultcount,
    required String childcount,
    required String infantcount,
    required String name,
    required String email,
    required String mobile,
    required String status,
  }) async {
     dio.Response<dynamic> response = await createEnquiryApiService.createEnquiryApiService(
      packageid: packageid, 
      vendorid: vendorid,
      cityofdeparture: cityofdeparture, 
      dateofdeparture: dateofdeparture, 
      adultcount: adultcount, 
      childcount: childcount, 
      infantcount: infantcount, 
      name: name, email: email, 
      mobile: mobile, 
      status: status
      );
      if(response.statusCode == 200){
          Get.back();
          Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            "Enquiry created successfull",
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }else{
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }
  }
  
  
  }