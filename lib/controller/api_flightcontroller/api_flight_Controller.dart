import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../models/air_search_model.dart';
import '../../models/airport_search_model.dart';
import '../../models/flight_searchdatamodel.dart';
import '../../models/pasenger_mode.dart';
import '../../responsive/booking_view/flight/par_nyc_screen.dart';
import '../../services/networks/services/flight_api_searcive/airflight_api_searvice.dart';
import '../../services/networks/services/flight_api_searcive/airport_search_apiservice.dart';

class ApiflightsController extends GetxController {
  RxInt wayIndex = 0.obs;
  RxInt cabinClassIndex = 0.obs;

  RxInt adultsCount = 1.obs;
  RxInt childsCount = 0.obs;

  RxInt domesticORInternational = 0.obs;

  DateTime depatureDate = DateTime.now();
  RxBool isDepatureDateSelected = false.obs;

  DateTime returnDate = DateTime.now();
  RxBool isreturnDateDateSelected = false.obs;

  RxBool isLoading = false.obs;

  AirSearchApiServices airSearchApiServices = AirSearchApiServices();
  AirportSearchApiServices airportSearchApiServices =
      AirportSearchApiServices();
  List<Airport> airports = [];

  RxBool airPortFound = false.obs;

  RxString origin = "MAA".obs;
  RxString originFullName = "Choose".obs;
  RxString destination = "COK".obs;
  RxString destinationFullName = "Choose".obs;

  RxInt isMaleOrFemale = 2.obs;

  List<PassengerDetail> passengersDetailsList = [];


  

  seachAirport({required String keyWord}) async {
    dio.Response<dynamic> response = await airportSearchApiServices
        .airportSearchApiServices(keyWord: keyWord);

    if (jsonDecode(response.data)["status"] == 1) {
      print("---------on 1-----------");
      airPortFound(false);
      AirportSearchModel airportSearchModel =
          AirportSearchModel.fromJson(jsonDecode(response.data));

      airports = airportSearchModel.airports;
    } else {
      print("<<--------its here---------->>");
      airPortFound(true);
      airports.clear();
    }

    update();
  }

  //air search flight list
  List<Flight> flightList = [];

  airSearch({required FlightSearchDataModel flightSearchModel}) async {
    isLoading(true);
    flightList.clear();
    String seachKey = "";
    dio.Response<dynamic> response = await airSearchApiServices
        .airSearchApiServices(flightSearchModel: flightSearchModel);
    isLoading(false);
    if (response.data["Response_Header"]["Error_Code"] == "0000") {
      AirSearchModel airSearchModel = AirSearchModel.fromJson(response.data);
      flightList = airSearchModel.tripDetails.first.flights;
      seachKey = airSearchModel.searchKey;
    }

    Get.to(ParNycSCreen(
      flightSearchDataModel: flightSearchModel,
      searchKey: seachKey,
    ));

    update();
  }

  increaseAdultCount() {
    adultsCount(adultsCount.value + 1);
    update();
  }

  decreaseAdultCount() {
    if (adultsCount.value == 1) {
    } else {
      adultsCount(adultsCount.value - 1);
      update();
    }
  }

  increaseChildCount() {
    childsCount(childsCount.value + 1);
    update();
  }

  decreaseChildCount() {
    if (childsCount.value == 0) {
    } else {
      childsCount(childsCount.value - 1);
      update();
    }
  }
}
