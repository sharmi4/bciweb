import 'dart:convert';


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

  RxString origin = "Choose".obs;
  RxString originFullName = "Choose".obs;
  RxString destination = "Choose".obs;
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
    dio.Response<dynamic> response = await airSearchApiServices
        .airSearchApiServices(flightSearchModel: flightSearchModel);
    isLoading(false);
    if (response.statusCode == 200) {
      AirSearchModel airSearchModel = AirSearchModel.fromJson(response.data);
      flightList = airSearchModel.tripDetails.first.flights;
    }
    Get.to(ParNycSCreen(
      flightSearchDataModel: flightSearchModel,
    ));

    update();
  }
}
