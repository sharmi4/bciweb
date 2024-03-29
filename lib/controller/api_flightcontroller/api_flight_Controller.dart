import 'dart:convert';
import 'dart:html';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/models/flight_passenger_model.dart';
import 'package:bciweb/models/flight_pax_model.dart';
import 'package:bciweb/models/initiate_payment_model.dart';
import 'package:bciweb/services/networks/add_flight_booking_history.dart';
import 'package:bciweb/services/networks/air_add_payment_api_services.dart';
import 'package:bciweb/services/networks/air_ticket_booking_api_services.dart';
import 'package:bciweb/services/networks/payment_api_services/intiate_payment_api_services.dart';
import 'package:bciweb/services/networks/payment_api_services/payment_status_api_services.dart';
import 'package:bciweb/views/payment_views/payment_processing_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:pdf/pdf.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/air_get_ssr_model.dart';
import '../../models/air_repricing_model.dart';
import '../../models/air_reprint_model.dart';
import '../../models/air_search_model.dart';
import '../../models/air_seat_map_model.dart';
import '../../models/airport_search_model.dart';
import '../../models/flight_searchdatamodel.dart';
import '../../models/get_flight_booking_history.dart';
import '../../models/pasenger_mode.dart';
import '../../models/seach_flight_model.dart';
import '../../services/networks/services/flight_api_searcive/search_flight_api_services.dart';
import '../../views/responsive------------------------------------/booking_view/flight/par_nyc_screen.dart';
import '../../services/networks/services/flight_api_searcive/air_add_ssr_api_services.dart';
import '../../services/networks/services/flight_api_searcive/air_printing_api_services.dart';
import '../../services/networks/services/flight_api_searcive/air_repricing_api_services.dart';
import '../../services/networks/services/flight_api_searcive/airflight_api_searvice.dart';
import '../../services/networks/services/flight_api_searcive/airport_search_apiservice.dart';
import '../../services/networks/services/flight_api_searcive/airticket_cancel_api_service.dart';
import '../../services/networks/services/flight_api_searcive/get_flight_booking_list.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../services/networks/services/flight_api_searcive/get_seat_map_api_services.dart';

class ApiflightsController extends GetxController {
  GetFlightBookingHistoryAPIServices getFlightBookingHistoryAPIServices =
      GetFlightBookingHistoryAPIServices();

  RxInt wayIndex = 0.obs;
  RxInt cabinClassIndex = 0.obs;
  RxInt flighttypeindex = 0.obs;

  RxInt adultsCount = 1.obs;
  RxInt showdetails = 0.obs;
  RxInt childsCount = 0.obs;
  RxInt onwayOrTwoWay = 0.obs;
  RxInt domesticORInternational = 0.obs;

  DateTime depatureDate = DateTime.now();
  RxBool isDepatureDateSelected = false.obs;

  DateTime returnDate = DateTime.now();
  RxBool isreturnDateDateSelected = false.obs;

  RxBool isLoading = false.obs;

  List<FlightPassengerModel> flightPassengerList = [];

  AirSearchApiServices airSearchApiServices = AirSearchApiServices();
  AirportSearchApiServices airportSearchApiServices =
      AirportSearchApiServices();
  List<Map<String, String?>> airports = [];

  RxBool airPortFound = false.obs;
  RxString origin = "Choose".obs;
  RxString originCountry = "Choose".obs;
  RxString originFullName = "Choose".obs;
  RxString destination = "Choose".obs;
  RxString destinationCountry = "Choose".obs;
  RxString destinationFullName = "Choose".obs;

  RxInt isMaleOrFemale = 2.obs;

  List<PassengerDetail> passengersDetailsList = [];

  seachAirport({required String keyWord}) async {
    dio.Response<dynamic> response = await airportSearchApiServices
        .airportSearchApiServices(keyWord: keyWord);

    if (response.data["status"] == 1) {
      print("---------on 1-----------");
      airPortFound(false);
      AirportsearchModel airportSearchModel =
          AirportsearchModel.fromJson(response.data);

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

  RxString tempSearchKey = "".obs;

  airSearch(
      {required FlightSearchDataModel flightSearchModel,
      String airlineCode = '',
      required bool ismobilorweb}) async {
    isLoading(true);
    flightList.clear();
    String seachKey = "";
    dio.Response<dynamic> response =
        await airSearchApiServices.airSearchApiServices(
            flightSearchModel: flightSearchModel, airlineCode: airlineCode);
    isLoading(false);
    if (response.data["Response_Header"]["Error_Code"] == "0000") {
      AirSearchModel airSearchModel = AirSearchModel.fromJson(response.data);
      flightList = airSearchModel.tripDetails.first.flights;
      seachKey = airSearchModel.searchKey;
      tempSearchKey(seachKey);
      update();
    }

    if (ismobilorweb) {
      Get.to(ParNycSCreen(
        flightSearchDataModel: flightSearchModel,
        searchKey: seachKey,
      ));
    } else {}

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

  splitdate(String tempDate) {
    //  String tempDate = "07/22/2023";

    var splittedString = tempDate.split("/");

    print(splittedString);

    int tempYear = int.parse(splittedString.last);
    int tempDay = int.parse(splittedString[1]);
    int monthTemp = int.parse(splittedString.first);

    DateTime parsedDate = DateTime(tempYear, monthTemp, tempDay);

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

  AirRePrintingServices airRePrintingServices = AirRePrintingServices();

  downloadTicketHistory({required String refernceNo}) async {
    dio.Response<dynamic> response = await airRePrintingServices
        .airRePrintingApi(clientReferneNo: "", refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      AirReprintModel airReprintModel = AirReprintModel.fromJson(response.data);

      downloadFlightTicketInvoice(airReprintModel);
    } else {}
  }

  //flight ticket pdf
  Future<void> downloadFlightTicketInvoice(
      AirReprintModel airReprintModel) async {
    final pdf = pw.Document();

    print("------------------------------>>starting to generate PDF");
    print(
        "------------------------------>>${airReprintModel.airPnrDetails.first.flights.first.origin}");
    print(
        "------------------------------>>${airReprintModel.airPnrDetails.first.flights.first.destination}");

    pdf.addPage(pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Column(children: [
          pw.Center(
              child: pw.Text(
            "Flight Ticket",
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
          )),
          pw.SizedBox(
            height: 10,
          ),
          pw.Divider(
            thickness: 1.2,
          ),
          pw.Text(
            "Booking Date",
            style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(
            height: 5,
          ),
          pw.Text(
            "${airReprintModel.bookingDateTime}",
            style: pw.TextStyle(
              fontSize: 11,
              color: PdfColors.grey,
            ),
          ),
          pw.SizedBox(
            height: 10,
          ),
          pw.Text(
            "Guest Name",
            style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(
            height: 5,
          ),
          pw.Text(
            "${airReprintModel.customerDetail.customerName}",
            style: pw.TextStyle(
              fontSize: 11,
              color: PdfColors.grey,
            ),
          ),
          pw.Divider(
            thickness: 1.2,
          ),
          pw.SizedBox(
            height: 10,
          ),
          pw.Text(
            "Flight Details",
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          // pw.SizedBox(
          //   height: 5,
          // ),
          // pw.Text(
          //   "Route",
          //   style: pw.TextStyle(
          //     fontSize: 12,
          //     color: PdfColors.grey,
          //   ),
          // ),
          // pw.SizedBox(
          //   height: 5,
          // ),
          // pw.Text(
          //   "${airReprintModel.airPnrDetails.first.flights.first.origin} - ${airReprintModel.airPnrDetails.first.flights.first.destination}",
          //   style: const pw.TextStyle(
          //     fontSize: 12,
          //     color: PdfColors.grey,
          //   ),
          // ),
          // pw.SizedBox(
          //   height: 5,
          // ),
          pw.Divider(
            thickness: 1.2,
          ),
          //from
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "From",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    airReprintModel.airPnrDetails.first.flights.first.origin,
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Airline",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    "${airReprintModel.airPnrDetails.first.flights.first.airlineCode}",
                    style: pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Departure Date",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    airReprintModel
                        .airPnrDetails.first.flights.first.travelDate,
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Arrival Date",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    "",
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          //to
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 30, right: 30, top: 10),
            child: pw.Divider(
              thickness: 1.2,
            ),
          ),
          pw.SizedBox(
            height: 10,
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "To",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    airReprintModel
                        .airPnrDetails.first.flights.first.destination,
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Flight Number",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    "${airReprintModel.airPnrDetails.first.flights.first.flightNumbers ?? ""}",
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Departure Terminal",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    airReprintModel.airPnrDetails.first.flights.first.segments
                        .first.originTerminal,
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Arrival Terminal",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    airReprintModel.airPnrDetails.first.flights.first.segments
                        .first.destinationTerminal,
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 30, right: 30, top: 10),
            child: pw.Divider(
              thickness: 1.2,
            ),
          ),
          //class
          pw.SizedBox(
            height: 10,
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Seat Class",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Container(
                    height: 20,
                    width: 80,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.blueAccent100,
                      borderRadius: pw.BorderRadius.circular(3),
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        "",
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Checkin Baggage Allowance",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Container(
                    height: 20,
                    width: 70,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.blueAccent100,
                      borderRadius: pw.BorderRadius.circular(3),
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        airReprintModel.airPnrDetails.first.flights.first.fares
                            .first.fareDetails.first.freeBaggage.checkInBaggage,
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Hand Baggage Allowance",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Container(
                    height: 20,
                    width: 70,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.blueAccent100,
                      borderRadius: pw.BorderRadius.circular(3),
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        airReprintModel.airPnrDetails.first.flights.first.fares
                            .first.fareDetails.first.freeBaggage.handBaggage,
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Seat Number",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 4,
                  ),
                  pw.Text(
                    "",
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 10, bottom: 10),
            child: pw.Divider(
              thickness: 1.2,
            ),
          ),
          //fare breakdown
          pw.Text(
            "Fare  Breakdown",
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 0, top: 10),
            child: pw.Row(
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Base Fare",
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Text(
                      "Passenger Service Charge",
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Text(
                      "Airport tax",
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    // pw.Text(
                    //   "Fuel/Insurance Surcharge",
                    //   style: pw.TextStyle(
                    //       fontSize: 11, fontWeight: pw.FontWeight.bold),
                    // ),
                    // pw.SizedBox(
                    //   height: 10,
                    // ),
                    // pw.Text(
                    //   "Ticketing Service Charge",
                    //   style: pw.TextStyle(
                    //       fontSize: 11, fontWeight: pw.FontWeight.bold),
                    // ),
                  ],
                ),
                //
                pw.SizedBox(
                  height: 30,
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      ":     Rs. ${airReprintModel.airPnrDetails.first.flights.first.fares.first.fareDetails.first.basicAmount}",
                      style: pw.TextStyle(
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.grey,
                      ),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Text(
                      ":     Rs. ${airReprintModel.airPnrDetails.first.flights.first.fares.first.fareDetails.first.serviceFeeAmount}",
                      style: pw.TextStyle(
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.grey,
                      ),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Text(
                      ":     Rs. ${airReprintModel.airPnrDetails.first.flights.first.fares.first.fareDetails.first.airportTaxAmount}",
                      style: pw.TextStyle(
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.grey,
                      ),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    // pw.Text(
                    //   ":     ₹ 30.00",
                    //   style: pw.TextStyle(
                    //     fontSize: 11,
                    //     fontWeight: pw.FontWeight.bold,
                    //     color: PdfColors.grey,
                    //   ),
                    // ),
                    // pw.SizedBox(
                    //   height: 10,
                    // ),
                    // pw.Text(
                    //   ":     ₹ 5.00",
                    //   style: pw.TextStyle(
                    //     fontSize: 11,
                    //     fontWeight: pw.FontWeight.bold,
                    //     color: PdfColors.grey,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(
                left: 0, right: 50, top: 5, bottom: 10),
            child: pw.Divider(
              thickness: 1.2,
            ),
          ),
          pw.Row(
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Total Amount",
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(left: 93),
                child: pw.Column(
                  children: [
                    pw.Text(
                      ":     Rs. ${airReprintModel.airPnrDetails.first.flights.first.fares.first.fareDetails.first.totalAmount}",
                      style: pw.TextStyle(
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          pw.Padding(
            padding:
                pw.EdgeInsets.only(left: 0, right: 50, top: 10, bottom: 10),
            child: pw.Divider(
              thickness: 1.2,
            ),
          ),
          //last
          pw.Text(
            "Important Information",
            style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(
            height: 10,
          ),
          pw.Text(
            "The Indian rupee is the official currency in the Republic of India. The rupee is subdivided into 100 paise. The issuance of the currency is controlled by the Reserve Bank of India.",
            style: pw.TextStyle(
              fontSize: 11,
              color: PdfColors.grey,
            ),
          ),
        ]),
      ),
    ));

    var bytes = await pdf.save();

    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "report.pdf")
      ..click();

    //downloadFile(bytes, airReprintModel.airPnrDetails.first.airlinePnr);
  }

  //void destinationCountry(String country) {}

  //   downloadFile(var bytes, String txId) async {
  //   await Permission.storage.request();
  //   if (await Permission.storage.request().isGranted) {
  //     // Either the permission was already granted before or the user just granted it.

  //     // Directory generalDownloadDir = Directory(
  //     //     '/storage/emulated/0/Download'); //! THIS WORKS for android only !!!!!!

  //     try {
  //       // var path = "/storage/emulated/0/Download";
  //       var dir = await getExternalStorageDirectory();

  //       //qr image file saved to general downloads folder
  //       File file = await File('${dir!.path}/$txId-air_ticket.pdf').create();

  //       await file.writeAsBytes(bytes);
  //       Get.closeAllSnackbars();
  //       OpenFile.open(file.path);
  //       Get.snackbar("Invoice Downloaded to ", "${file.path}",
  //           colorText: Colors.white,
  //           backgroundColor: Colors.green,
  //           snackPosition: SnackPosition.TOP);
  //     } on Exception catch (e) {
  //       // TODO
  //       var dir = await getApplicationDocumentsDirectory();

  //       File file = await File('${dir.path}/$txId-air_ticket.pdf').create();

  //       await file.writeAsBytes(bytes);
  //       OpenFile.open(file.path);
  //       print(e);
  //     }
  //   } else {
  //     var dir = await getApplicationDocumentsDirectory();

  //     File file = await File('${dir.path}/$txId-air_ticket.pdf').create();

  //     await file.writeAsBytes(bytes);
  //     OpenFile.open(file.path);
  //   }
  // }

  // List<FlightBookedData> flightBookingHistoyrList = [];

  // getFlightBookingHistory() async {
  //   dio.Response<dynamic> response =
  //       await getFlightBookingHistoryAPIServices.getFlightBookingAPIServices();

  //   if (response.statusCode == 200) {
  //     GetFlightsModel flightsModel = GetFlightsModel.fromJson(response.data);
  //     flightBookingHistoyrList = flightsModel.data;
  //     update();
  //   }
  // }
  AirRepriceApiServices airRepriceApiServices = AirRepriceApiServices();
  getFlightRepricing({
    required FlightSearchDataModel flightSearchModel,
    required Flight flight,
    required String searchKey,
    required String mobileNumber,
  }) async {
    String flightKey = "";
    dio.Response<dynamic> response =
        await airRepriceApiServices.airRepriceApiServices(
      flightSearchModel: flightSearchModel,
      flight: flight,
      searchKey: searchKey,
      mobileNumber: mobileNumber,
    );

    if (response.statusCode == 200) {
      AirRepriceModel airReprintModel = AirRepriceModel.fromJson(response.data);
      flightKey = airReprintModel.airRepriceResponses.first.flight.flightKey;
    }
    return flightKey;
  }

  AirAddSsrApiServices airAddSsrApiServices = AirAddSsrApiServices();
  List<SsrDetail> ssrDetailsList = [];

  getFightSSRDetails({
    required String flightKey,
    required String searchKey,
    required String fairId,
  }) async {
    dio.Response<dynamic> response =
        await airAddSsrApiServices.airGetSsrDetails(
      flightKey: flightKey,
      searchKey: searchKey,
    );

    if (response.statusCode == 200) {
      GetSsrModel airReprintModel = GetSsrModel.fromJson(response.data);
      ssrDetailsList = airReprintModel.ssrFlightDetails.first.ssrDetails;
    }
    update();
  }

  AirGetSeatMapApiServices airGetSeatMapApiServices =
      AirGetSeatMapApiServices();
  List<SeatRow> airSeatMapsList = [];
  Future<bool> getSeatMapApiServises({
    required String searchKey,
    required String flightKey,
    required dynamic paxDetails,
  }) async {
    isLoading(true);
    bool isSeatMapAvailable = false;
    dio.Response<dynamic> response =
        await airGetSeatMapApiServices.airGetSeatMapApiServices(
            searchKey: searchKey, flightKey: flightKey, paxDetails: paxDetails);
    isLoading(false);
    if (response.data["Response_Header"]["Error_Code"] == "0000") {
      isSeatMapAvailable = true;
      AirSeatMapModel airSeatMapModel = AirSeatMapModel.fromJson(response.data);
      airSeatMapsList =
          airSeatMapModel.airSeatMaps.first.seatSegments.first.seatRow;
      update();
    }

    return isSeatMapAvailable;
  }

  AirCancelApiServices airCancelApiServices = AirCancelApiServices();

  airCancelTicket({required String refernceNo}) async {
    dio.Response<dynamic> response = await airRePrintingServices
        .airRePrintingApi(clientReferneNo: "", refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      AirReprintModel airReprintModel = AirReprintModel.fromJson(response.data);

      dio.Response<dynamic> cancelresponse =
          await airCancelApiServices.airCancelApiServices(
              Airlinepnr: airReprintModel.airPnrDetails.first.airlinePnr,
              Refno: refernceNo,
              Cancelcode: airReprintModel.airPnrDetails.first.crsCode,
              ReqRemarks: airReprintModel.remark,
              CancellationType: airReprintModel.airPnrDetails.first.crsPnr,
              Imeinumber: '64654546546546');
      if (cancelresponse.statusCode == 200) {
        Get.rawSnackbar(
            message: "Cancellation sucessfully ",
            backgroundColor: Colors.green);
      }
    } else {}
  }

  SearchFlightApiServices searchFlightApiServices = SearchFlightApiServices();

  List<FlightSearchModel> searchlistsearchList = [];
  Future flighsearch({required String city}) async {
    dio.Response<dynamic> response =
        await searchFlightApiServices.searchflightapi(city: city);
    if (response.statusCode == 200) {
      List<FlightSearchModel> flightSearchModel = List<FlightSearchModel>.from(
          response.data.map((x) => FlightSearchModel.fromJson(x)));
      searchlistsearchList = flightSearchModel;
      
      update();
    }
    update();
  }

  InitiatePaymentApiServices initiatePaymentApiServices =
      InitiatePaymentApiServices();

  PaymentResponseApiServices paymentResponseApiServices =
      PaymentResponseApiServices();

  initiatePayment(
      {required double amount, required BookingModel bookingModel,required String refernceId}) async {
        await  Get.find<AuthProfileController>().getProfile();
    dio.Response<dynamic> response =
        await initiatePaymentApiServices.initiatePayment(
            userId: Get.find<AuthProfileController>().profileData.first.id,
            totalAmount: amount.toStringAsFixed(2),
            status: "flight");

    if (response.statusCode == 200) {
      IninitiatePaymentModel ininitiatePaymentModel =
          IninitiatePaymentModel.fromJson(response.data);

      launchUrl(Uri.parse(
          ininitiatePaymentModel.data.instrumentResponse.redirectInfo.url));

      Get.to(() => PaymentProcessingView(
            amount: amount,
            bookingModel: bookingModel,
            referenceId: ininitiatePaymentModel.data.merchantTransactionId,
            bookingId: refernceId,
          ));
    }
  }

  checkPhonePeStatus(
      {required String refernceID,
      required double amount,
      required String bookingId,
      required BookingModel bookingModel}) async {
    dio.Response<dynamic> response = await paymentResponseApiServices
        .paymentResponseApi(merchantId: refernceID);

    int status = 0;

    if (response.data["code"] == "PAYMENT_SUCCESS") {
      status = 1;
      print("<<<<<<<<payment is Success>>>>>>>>");
      //need to give id
      String transactionId = "";
      // Get.to(() => const FlightLoadingPage());

      // bookAirTicket(bookingModel: bookingModel, transactionId: transactionId);

      airAddPayment(refernceNo: bookingId, transactionId: transactionId);
    } else {
      print("<<<<<<<<payment is Failed>>>>>>>>");

      // Get.to(() => PaymentFailedScreen());
    }

    return status;
  }

  AirTicketBookingApiServices airTicketBookingApiServices =
      AirTicketBookingApiServices();

  AirAddPaymentApiServices airAddPaymentApiServices =
      AirAddPaymentApiServices();

  // AirRePrintingServices airRePrintingServices = AirRePrintingServices();

  bookAirTicket(
      {required BookingModel bookingModel,
      required double amount,
      required String transactionId}) async {
    dio.Response<dynamic> response = await airTicketBookingApiServices
        .airTicketBookingApiServices(bookingModel: bookingModel);

    print(
        "<<<..........------------ Booking response ----------.........>>>> ");

    print(response.statusCode);
    print(response.data);

    if (response.statusCode == 200) {
      print(
          "<<<..........------------Air ticket booked ----------.........>>>> ");

      print(response.data["Booking_RefNo"]);

      // airAddPayment(
      //     refernceNo: response.data["Booking_RefNo"],
      //     transactionId: transactionId);
      isLoading(false);

      initiatePayment(amount: amount, bookingModel: bookingModel,refernceId: response.data["Booking_RefNo"]);
    }
  }

  airAddPayment(
      {required String refernceNo, required String transactionId}) async {
    dio.Response<dynamic> response =
        await airAddPaymentApiServices.addPaymentApiServices(
            clientReferneNo: "Testing Team", refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      airReprint(refernceNo: refernceNo, transactionId: transactionId);
      Get.rawSnackbar(
          message: "Payment Added Success", backgroundColor: Colors.green);
    } else {}
  }

  AddFlightBookingHistoryAPIServices addFlightBookingHistoryAPIServices =
      AddFlightBookingHistoryAPIServices();

  addFlightBookingHistoy(
      {required String invoiceNumber,
      required String remark,
      required String fromCityCode,
      required String toCityCode,
      required String fromCityName,
      required String toCityName,
      required String bookingRefNo,
      required String airlineCode,
      required String date,
      required String price,
      required String transactionId}) async {
    dio.Response<dynamic> response =
        await addFlightBookingHistoryAPIServices.addFlightBookingAPIServices(
            airlineCode: airlineCode,
            bookingRefNo: bookingRefNo,
            date: date,
            fromCityCode: fromCityCode,
            fromCityName: fromCityName,
            invoiceNumber: invoiceNumber,
            remark: remark,
            toCityCode: toCityCode,
            price: price,
            transactionId: price,
            toCityName: toCityName);

    if (response.statusCode == 201) {}
  }

  airReprint(
      {required String refernceNo, required String transactionId}) async {
    dio.Response<dynamic> response = await airRePrintingServices
        .airRePrintingApi(clientReferneNo: "", refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      AirReprintModel airReprintModel = AirReprintModel.fromJson(response.data);
      addFlightBookingHistoy(
          invoiceNumber: airReprintModel.invoiceNumber,
          remark: airReprintModel.remark,
          fromCityCode:
              airReprintModel.airPnrDetails.first.flights.first.origin,
          toCityCode:
              airReprintModel.airPnrDetails.first.flights.first.destination,
          fromCityName:
              airReprintModel.airPnrDetails.first.flights.first.origin,
          toCityName:
              airReprintModel.airPnrDetails.first.flights.first.destination,
          bookingRefNo: airReprintModel.bookingRefNo,
          price: airReprintModel.airPnrDetails.first.flights.first.fares.first
              .fareDetails.first.totalAmount
              .toString(),
          transactionId: transactionId,
          airlineCode:
              airReprintModel.airPnrDetails.first.flights.first.airlineCode,
          date: airReprintModel.bookingDateTime);
      // Get.off(() => (
      //       airReprintModel: airReprintModel,
      //       refNo: refernceNo,
      //     ));
    } else {}
  }

  createBooking({required double amount, required BookingModel bookingModel}) {
    print("<<<<<<<<payment is Success>>>>>>>>");
    //need to give id
    String transactionId = "";
    // Get.to(() => const FlightLoadingPage());
    isLoading(true);

    bookAirTicket(
        bookingModel: bookingModel,
        transactionId: transactionId,
        amount: amount);
  }

  Map<String, String> getArguments(var amount) {
    var randomStr = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, String> map = {
      "version": "1",
      "txnRefNo": "ORD$randomStr", // Should change on every request
      "amount": "$amount",
      "passCode": "KHKZ7396",
      "bankId": "000004",
      "terminalId": "10043345",
      "merchantId": "120000000043345",
      "mcc": "4722",
      "paymentType": "Pay",
      "currency": "356",
      // 'email': "manu@gmail.com",
      // 'phone': '+918157868855',
      "hashKey": "3EB5718FB544D878AFEF33F28D2ABB79",
      "aesKey": "DA4247F2A35302A10CE1933FCBDFFA48",
      "payOpt": "",
      "orderInfo": "NARUTO00001",
      "returnURL": "https://www.portal.bcipvtltd.com/api/auth/add_transaction",
      "env": "PROD", //UAT PROD
      "url": "https://isgpay.com/ISGPay-Genius/request.action",
    };
    return map;
  }
}
