
import 'package:bciweb/models/holiday_packages_models/get_package_details_model.dart';
import 'package:bciweb/models/holiday_packages_models/get_package_list_model.dart';
import 'package:bciweb/services/networks/services/holiday_packages_api_services/create_enquiry_api_service.dart';
import 'package:bciweb/services/networks/services/holiday_packages_api_services/get_package_details_api_service.dart';
import 'package:bciweb/services/networks/services/holiday_packages_api_services/get_package_list_api_service.dart';
import 'package:bciweb/services/networks/services/holiday_packages_api_services/search_package_list_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/constans.dart';
import '../models/holiday_packages_models/get_package_category_model.dart';
import '../services/networks/services/holiday_packages_api_services/get_package_category_api_service.dart';
import 'package:dio/dio.dart' as dio;
class HolidayPackageController extends GetxController{
   
  RxInt child = 0.obs;
  RxInt adult = 0.obs;
  RxInt infant = 0.obs;
  RxInt index = 0.obs;
  RxInt tripindex = 0.obs;

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

  //get package list
  GetPackageListApiServices getPackageListApiServices = GetPackageListApiServices();
  List<PackageListData> packageListData = [];

  getPackage() async {

    dio.Response<dynamic> response = await getPackageListApiServices.getPackageListApiServices();
    if(response.statusCode == 200){

      GetPackageList getPackageList =  GetPackageList.fromJson(response.data);
      packageListData = getPackageList.data;

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

  //get package details api
  GetPackageDetailsApiServices getPackageDetailsApiServices = GetPackageDetailsApiServices();
  List<GetPackageDetailsData> getPackageDetailsData = [];

  packageDetails({required String packageid}) async {
    getPackageDetailsData.clear();

    dio.Response<dynamic> response = await getPackageDetailsApiServices.
    getPackageDetailsApiServices(packageid: packageid);
    if(response.statusCode == 200){
      GetPackageDetails getPackageDetails = GetPackageDetails.fromJson(response.data);
      getPackageDetailsData.add(getPackageDetails.data);
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

  //create enquiry
  CreateEnquiryApiService createEnquiryApiService = CreateEnquiryApiService();

  createEnquiry({
    required String packageid,
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
      vendorid:"",
      packageid: packageid, 
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

  //search package list api
  SearchPackageListApiService searchPackageListApiService = SearchPackageListApiService();

  searchPackageList({required String name}) async {

    dio.Response<dynamic> response = await searchPackageListApiService.
    searchPackageListApiService(name: name);
    if(response.statusCode == 200){

      GetPackageList getPackageList =  GetPackageList.fromJson(response.data);
      packageListData = getPackageList.data;

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