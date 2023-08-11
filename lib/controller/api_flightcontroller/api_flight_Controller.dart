import 'dart:convert';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../models/air_search_model.dart';
import '../../models/airport_search_model.dart';
import '../../models/flight_searchdatamodel.dart';
import '../../models/get_flight_booking_history.dart';
import '../../models/pasenger_mode.dart';
import '../../responsive/booking_view/flight/par_nyc_screen.dart';
import '../../services/networks/services/flight_api_searcive/airflight_api_searvice.dart';
import '../../services/networks/services/flight_api_searcive/airport_search_apiservice.dart';
import '../../services/networks/services/flight_api_searcive/get_flight_booking_list.dart';

class ApiflightsController extends GetxController {


GetFlightBookingHistoryAPIServices getFlightBookingHistoryAPIServices =
      GetFlightBookingHistoryAPIServices();

  RxInt wayIndex = 0.obs;
  RxInt cabinClassIndex = 0.obs;
   RxInt flighttypeindex=0.obs;

  RxInt adultsCount = 1.obs;
  RxInt childsCount = 0.obs;
  RxInt onwayOrTwoWay=0.obs;

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

  airSearch({required FlightSearchDataModel flightSearchModel, required bool ismobilorweb }) async {
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


if(ismobilorweb){
    Get.to(ParNycSCreen(
      flightSearchDataModel: flightSearchModel,
      searchKey: seachKey,
    ));
}else{
  
}
   

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

  splitdate(String tempDate){
    //  String tempDate = "07/22/2023";
  
  var splittedString = tempDate.split("/");
  
  print(splittedString);
  
  int tempYear = int.parse(splittedString.last);
  int tempDay = int.parse(splittedString[1]);
  int monthTemp = int.parse(splittedString.first);
  
  DateTime parsedDate = DateTime(tempYear,monthTemp,tempDay);
  
  return parsedDate;
  }




    //flights booking list

  List<FlightBookedData> flightBookingHistoyrList = [];

  getFlightBookingHistory() async {
    dio.Response<dynamic> response =
        await getFlightBookingHistoryAPIServices.getFlightBookingAPIServices();

    if (response.statusCode == 200) {
      GetFlightsModel flightsModel = GetFlightsModel.fromJson(response.data);
      flightBookingHistoyrList = flightsModel.data;
      update();
    }
  }
}
