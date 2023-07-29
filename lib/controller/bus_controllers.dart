import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../constant/constans.dart';
import '../models/busbookingmodels/bus_cityList_model.dart';
import '../models/busbookingmodels/search_bus_model.dart';
import '../services/networks/profile_api_service/bus_api_service/bus_cityList_api_service.dart';
import '../services/networks/profile_api_service/bus_api_service/search_bus_api_service.dart';
import '../views/members/bookins/bus/buslist.dart';
import '../views/members/bookins/bus/wigets/seats.dart';

class BusController extends GetxController {
  RxString fromCity = "Enter Boarding".obs;
  RxString toCity = "Enter Designation".obs;
  RxInt fromcityId = 0.obs;
  RxInt tocityId = 0.obs;
  RxString date = "Select Date".obs;
  RxString day = "".obs;
  RxBool isLoading = false.obs;
  var travelDatess = DateTime.now();
  List<GetBusCityList> getBusCityList = [];

//buss city list
  GetBusCityListApiService getBusCityListApiService =
      GetBusCityListApiService();

  busCityList({required String searchCity}) async {
    dio.Response<dynamic> response = await getBusCityListApiService
        .getBusCityListApiService(searchCity: searchCity);
    if (response.statusCode == 200) {
      getBusCityList = List<GetBusCityList>.from(
          response.data.map((x) => GetBusCityList.fromJson(x)));
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong ${response.statusCode}",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }

  //search bus
  SearchBusListApiService searchBusListApiService = SearchBusListApiService();
  List<Bus> busData = [];
  RxString busSearchKey = "".obs;

  searchBus(
      {required String fromCityId,
      required String toCityId,
      required String travelDate}) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await searchBusListApiService.searchBusListApiService(
            fromCityId: fromCityId, toCityId: toCityId, travelDate: travelDate);
    isLoading(false);
    if (response.statusCode == 200) { 
      SearchBusList searchBusList = SearchBusList.fromJson(response.data);
      busData = searchBusList.buses;
      busSearchKey(searchBusList.searchKey);
      Get.to(BusList(
        fromCityName: fromCity.value,
        toCityName: toCity.value,
        tdate: date.value,
        searchKey: searchBusList.searchKey,
      ));
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong ${response.statusCode}",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }
}
