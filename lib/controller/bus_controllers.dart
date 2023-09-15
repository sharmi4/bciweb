import 'dart:convert';
import 'dart:html';

import 'package:bciweb/models/busbookingmodels/bus_requery_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../constant/constans.dart';
import '../models/busbookingmodels/bus_booking_history_model.dart';
import '../models/busbookingmodels/bus_cityList_model.dart';
import '../models/busbookingmodels/bus_seat_map_model.dart';
import '../models/busbookingmodels/pax_list_model.dart';
import '../models/busbookingmodels/search_bus_model.dart';
import '../services/networks/bus_api_service/add_bus_booking_history.dart';
import '../services/networks/bus_api_service/bus_booking_add_payment_api_services.dart';
import '../services/networks/bus_api_service/bus_cityList_api_service.dart';
import '../services/networks/bus_api_service/bus_requiry_api_services.dart';
import '../services/networks/bus_api_service/bus_seatMap_api_service.dart';
import '../services/networks/bus_api_service/bus_temp_booking.dart';
import '../services/networks/bus_api_service/bus_ticketing_api_services.dart';
import '../services/networks/bus_api_service/get_bus_booking_history_api_services.dart';
import '../services/networks/bus_api_service/search_bus_api_service.dart';
import '../views/members/bookins/bus/buslist.dart';
import '../views/members/bookins/bus/paysuccesful_screen.dart';
import 'dart:html' as html;
import 'package:get/get_core/src/get_main.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class BusController extends GetxController {
  RxString fromCity = "Enter Boarding".obs;
  RxString toCity = "Enter Designation".obs;
  RxString boardingName = "Boarding name".obs;
  RxString droppingName = "Designation name".obs;
  RxInt fromcityId = 0.obs;
  RxInt tocityId = 0.obs;
  RxString date = "Select Date".obs;
  RxString day = "".obs;
  RxBool isLoading = false.obs;
  var travelDatess = DateTime.now();
  List<GetBusCityList> getBusCityList = [];

  BusRequieyApiServices busRequieyApiServices = BusRequieyApiServices();
  AddBusBookingHistoryAPIServices addBusBookingHistoryAPIServices =
      AddBusBookingHistoryAPIServices();

  BusTicketingApiServices busTicketingApiServices = BusTicketingApiServices();

  BusAddPaymentApiServices busAddPaymentApiServices =
      BusAddPaymentApiServices();
  BusTempTicketBookingApiService busTempTicketBookingApiService =
      BusTempTicketBookingApiService();

  GetBusBookingHistoyApiServices getBusBookingHistoyApiServices =
      GetBusBookingHistoyApiServices();

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
        ),
      );
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

  //bus seat map
  BusSeatMapApiService busSeatMapApiService = BusSeatMapApiService();
  List<SeatMap> seatMap = [];
  List<String> seatIds = [];
  List<List<SeatMap>> seatMapList = [];
  RxDouble totalAmount = 0.0.obs;

  RxString seatMapKey = "".obs;

  busSeat(
      {required String boardingId,
      required String droppingId,
      required String searchKey,
      required Bus busData}) async {
    dio.Response<dynamic> response =
        await busSeatMapApiService.busSeatMapApiService(
            boardingId: boardingId,
            droppingId: droppingId,
            busData: busData,
            searcKey: searchKey);
    if (response.statusCode == 200) {
      BusSeatMapList busSeatMapList = BusSeatMapList.fromJson(response.data);
      seatMap = busSeatMapList.seatMap;
      seatMapKey(busSeatMapList.seatMapKey);
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          "something went wrong ${response.statusCode}",
          style: primaryFont.copyWith(color: Colors.white),
        ),
      );
    }
    update();
  }


    generateBusSeats(List<SeatMap> seatMap) {
    List<int> rowList = [];

    for (int k = 0; k < seatMap.length; k++) {
      rowList.add(int.parse(seatMap[k].row));
    }

    List<int> uniqueList = rowList.toSet().toList();

    // Sort the unique list
    uniqueList.sort();

    for (int i = 0; i < uniqueList.length; i++) {
      int rowNumber = uniqueList[i];

      List<SeatMap> tempList = [];

      for (int j = 0; j < seatMap.length; j++) {
        int tempRowNum = int.parse(seatMap[j].row.toString());

        print(rowNumber == tempRowNum);

        if (rowNumber == tempRowNum) {
          tempList.add(seatMap[j]);
        }
      }
      print(tempList.length);
      seatMapList.add(tempList);
    }
    update();
  }

  tempBookBusTicket(
      {required String boardingId,
      required String droppingId,
      required Bus busData,
      required String searcKey,
      required String seatMapKey,
      required String mobileNumber,
      required String customerEmail,
      required List<PaxDetailslist> paxDetailslist,
      required String amount,
      required String customerName}) async {
    ;
    dio.Response<dynamic> response =
        await busTempTicketBookingApiService.busTempTicketBooking(
            boardingId: boardingId,
            droppingId: droppingId,
            busData: busData,
            searcKey: searcKey,
            seatMapKey: seatMapKey,
            mobileNumber: mobileNumber,
            customerEmail: customerEmail,
            paxDetailslist: paxDetailslist);

    if (response.statusCode == 200) {
      if (response.data["Response_Header"]["Error_Desc"] == "SUCCESS") {
        var bookingRefernceNo = response.data["Booking_RefNo"];

        busAddPayment(refernceNo: bookingRefernceNo);
        print('bus temp bookining 1');
        //booking api;
      } else {
        Get.rawSnackbar(
            message: response.data["Error_Desc"], backgroundColor: Colors.red);
      }
    }
  }

  busAddPayment({required String refernceNo}) async {
    print('bus add payment 2');
    dio.Response<dynamic> response =
        await busAddPaymentApiServices.addPaymentForBusApiServices(
            clientReferneNo: "Testing Team", refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      busTicketing(refernceNo: refernceNo);
      // Get.rawSnackbar(
      //     message: "Payment Added Success", backgroundColor: Colors.green);
    } else {}
  }

  void busTicketing({required String refernceNo}) async {
    print('Busticeting  3');
    dio.Response<dynamic> response =
        await busTicketingApiServices.busTicketingApi(refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      busRequery(refernceNo: refernceNo);
      // AirReprintModel airReprintModel = AirReprintModel.fromJson(response.data);

      // Get.off(() => FlightBookingSuccessPage(
      //       airReprintModel: airReprintModel,
      //       refNo: refernceNo,
      //     ));
    } else {}
  }

  busRequery({required String refernceNo}) async {
    dio.Response<dynamic> response =
        await busRequieyApiServices.busRequiryApi(refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      BusRequeryModel busRequeryModel = BusRequeryModel.fromJson(response.data);

      addBusBookingHistoy(
          bookingRefNo: refernceNo,
          busName: busRequeryModel.busDetail.busType,
          date: busRequeryModel.bookingDate,
          fromCityCode: busRequeryModel.busDetail.fromCity,
          fromCityName: busRequeryModel.busDetail.fromCity,
          toCityCode: busRequeryModel.busDetail.toCity,
          toCityName: busRequeryModel.busDetail.toCity,
          price: busRequeryModel.price);
      print('add booking history and avigation 4');

      Get.off(
        () => WebpdfCreationScreen(
          busRequeryModel: busRequeryModel,
        ),
      );
    } else {}
  }

  busTicketDownload({required String refernceNo}) async {
    dio.Response<dynamic> response =
        await busRequieyApiServices.busRequiryApi(refrenceNo: refernceNo);

    if (response.statusCode == 200) {
      BusRequeryModel busRequeryModel = BusRequeryModel.fromJson(response.data);

      createPDF(busRequeryModel);
    }
  }

  addBusBookingHistoy({
    required String fromCityCode,
    required String toCityCode,
    required String fromCityName,
    required String toCityName,
    required String bookingRefNo,
    required String busName,
    required String date,
    required String price,
  }) async {
    dio.Response<dynamic> response =
        await addBusBookingHistoryAPIServices.addBusBookingAPIServices(
      fromCityCode: fromCityCode,
      toCityCode: toCityCode,
      fromCityName: fromCityName,
      toCityName: toCityName,
      bookingRefNo: bookingRefNo,
      busName: busName,
      date: date,
      price: price,
    );

    if (response.statusCode == 201) {}
  }

  Future<html.Blob> createPDF(BusRequeryModel busRequeryModel) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.ListView(
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.only(left: 20, right: 20, top: 20),
                child: pw.Container(
                  height: 420,
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(
                        left: 1, right: 1, top: 1, bottom: 1),
                    child: pw.Container(
                      height: 420,
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      child: pw.Column(
                        children: [
                          pw.Padding(
                            padding: pw.EdgeInsets.only(top: 15, left: 20),
                            child: pw.Row(
                              children: [
                                pw.Text(
                                  'Itinerary',
                                  style: pw.TextStyle(color: PdfColors.grey400),
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(
                                left: 20, top: 20, right: 20),
                            child: pw.Container(
                              height: 50,
                              decoration: pw.BoxDecoration(
                                  color: PdfColors.yellow200,
                                  border: pw.Border(
                                      bottom: pw.BorderSide(
                                          color: PdfColors.orange),
                                      top: pw.BorderSide(
                                          color: PdfColors.orange))),
                              child: pw.Padding(
                                padding:
                                    pw.EdgeInsets.only(left: 10, right: 10),
                                child: pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text(
                                      '${busRequeryModel.busDetail.fromCity} to ${busRequeryModel.busDetail.toCity}',
                                      style: pw.TextStyle(
                                          //[] fontWeight: pw.FontWeight.bold
                                          ),
                                    ),
                                    pw.Text('Wednesday, June 05, 2013'),
                                    pw.Text(
                                      'Jabbar Travels',
                                      style: pw.TextStyle(
                                          //fontWeight: pw.FontWeight.bold
                                          ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(
                                top: 50, left: 20, right: 20),
                            child: pw.Container(
                              height: 1,
                              width: double.infinity,
                              color: PdfColors.black,
                            ),
                          ),
                          pw.Padding(
                            padding:
                                pw.EdgeInsets.only(top: 2, left: 20, right: 20),
                            child: pw.Container(
                              height: 1,
                              width: double.infinity,
                              color: PdfColors.black,
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(left: 20, right: 20),
                            child: pw.Container(
                              height: 100,
                              decoration:
                                  pw.BoxDecoration(color: PdfColors.grey100),
                              child: pw.Padding(
                                padding:
                                    pw.EdgeInsets.only(left: 12, right: 12),
                                child: pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceAround,
                                        children: [
                                          pw.Text(
                                            'Passenger name',
                                            style: pw.TextStyle(
                                              color: PdfColors.blueAccent,
                                              //fontWeight: pw.FontWeight.bold
                                            ),
                                          ),
                                          pw.Padding(
                                            padding: pw.EdgeInsets.only(top: 2),
                                            child: pw.Text(
                                              'Mr Devanshu \nTiwari',
                                              style: pw.TextStyle(
                                                fontSize: 11,
                                                //fontWeight: pw.FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          pw.Text(
                                            'redBus ticket #',
                                            style: pw.TextStyle(
                                              color: PdfColors.blueAccent,
                                              //fontWeight: pw.FontWeight.bold
                                            ),
                                          ),
                                          pw.Padding(
                                            padding: pw.EdgeInsets.only(top: 2),
                                            child: pw.Text(
                                              'TF6Z98757372',
                                              style: pw.TextStyle(
                                                fontSize: 11,
                                                //fontWeight: pw.FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ]),
                                    pw.Column(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text(
                                          'Seat number(s)',
                                          style: pw.TextStyle(
                                            color: PdfColors.blueAccent,
                                            // fontWeight: pw.FontWeight.bold
                                          ),
                                        ),
                                        pw.Padding(
                                          padding: pw.EdgeInsets.only(top: 2),
                                          child: pw.Text(
                                            'SU4',
                                            style: pw.TextStyle(
                                              fontSize: 11,
                                              //fontWeight: pw.FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        pw.Padding(
                                          padding: pw.EdgeInsets.only(top: 14),
                                          child: pw.Text(
                                            'PNR #',
                                            style: pw.TextStyle(
                                              color: PdfColors.blueAccent,
                                              //fontWeight: pw.FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        pw.Padding(
                                          padding: pw.EdgeInsets.only(top: 2),
                                          child: pw.Text(
                                            'JBR190223-\n(Luxura A/C Sleeper)',
                                            style: pw.TextStyle(
                                              fontSize: 11,
                                              //fontWeight: pw.FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text(
                                          'Trip #',
                                          style: pw.TextStyle(
                                            color: PdfColors.blueAccent,
                                            //fontWeight: pw.FontWeight.bold
                                          ),
                                        ),
                                        pw.Padding(
                                          padding: pw.EdgeInsets.only(top: 5.5),
                                          child: pw.Text(
                                            '24241791',
                                            style: pw.TextStyle(
                                              fontSize: 11,
                                              //fontWeight: pw.FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding:
                                pw.EdgeInsets.only(top: 0, left: 20, right: 20),
                            child: pw.Container(
                              height: 1,
                              color: PdfColors.black,
                            ),
                          ),
                          pw.Padding(
                            padding:
                                pw.EdgeInsets.only(top: 2, left: 20, right: 20),
                            child: pw.Container(
                              height: 1,
                              color: PdfColors.black,
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(
                                left: 30, right: 30, top: 30),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Row(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Text(
                                            'Bus type',
                                            style: pw.TextStyle(
                                              color: PdfColors.blueAccent,
                                              // fontWeight: pw.FontWeight.bold
                                            ),
                                          ),
                                          pw.Padding(
                                            padding: pw.EdgeInsets.only(top: 5),
                                            child: pw.Text(
                                              'A/C Sleeper (2+1)',
                                              style: pw.TextStyle(
                                                fontSize: 11,
                                                //fontWeight: pw.FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ]),
                                    pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Text(
                                            'Reporting time',
                                            style: pw.TextStyle(
                                              color: PdfColors.blueAccent,
                                              //fontWeight: pw.FontWeight.bold
                                            ),
                                          ),
                                          pw.Padding(
                                            padding: pw.EdgeInsets.only(top: 5),
                                            child: pw.Text(
                                              '08:15 PM',
                                              style: pw.TextStyle(
                                                fontSize: 11,
                                                //fontWeight: pw.FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ],
                                ),
                                pw.Padding(
                                    padding: pw.EdgeInsets.only(top: 15),
                                    child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Container(
                                          width: 150,
                                          child: pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              pw.Text(
                                                'Boarding point address',
                                                style: pw.TextStyle(
                                                    color: PdfColors.blueAccent,
                                                    fontWeight:
                                                        pw.FontWeight.bold),
                                              ),
                                              pw.Padding(
                                                padding:
                                                    pw.EdgeInsets.only(top: 5),
                                                child: pw.Row(
                                                  children: [
                                                    pw.Text(
                                                      'Location:',
                                                      style: pw.TextStyle(
                                                          fontWeight: pw
                                                              .FontWeight.bold),
                                                    ),
                                                    pw.Text(
                                                      '   Sholinganallur',
                                                      style: pw.TextStyle(
                                                        height: 2,
                                                        fontSize: 13,
                                                        // fontWeight: pw.FontWeight.bold
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              pw.Padding(
                                                padding: pw.EdgeInsets.only(
                                                    top: 5.5),
                                                child: pw.Row(
                                                  children: [
                                                    pw.Text(
                                                      'Landmark:',
                                                      style: pw.TextStyle(
                                                          fontWeight: pw
                                                              .FontWeight.bold),
                                                    ),
                                                    pw.Text(
                                                      ' Sholinganallur',
                                                      style: pw.TextStyle(
                                                        height: 2,
                                                        fontSize: 11,
                                                        //fontWeight: pw.FontWeight.bold
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              pw.Padding(
                                                padding:
                                                    pw.EdgeInsets.only(top: 5),
                                                child: pw.Text(
                                                  'Address:',
                                                  style: pw.TextStyle(
                                                      fontWeight:
                                                          pw.FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        pw.Padding(
                                            padding: pw.EdgeInsets.only(
                                              top: 0,
                                            ),
                                            child: pw.Container(
                                              width: 79,
                                              child: pw.Column(
                                                crossAxisAlignment:
                                                    pw.CrossAxisAlignment.start,
                                                children: [
                                                  pw.Text(
                                                    'Total fare',
                                                    style: pw.TextStyle(
                                                        color: PdfColors
                                                            .blueAccent,
                                                        fontWeight:
                                                            pw.FontWeight.bold),
                                                  ),
                                                  pw.Padding(
                                                    padding: pw.EdgeInsets.only(
                                                        top: 8),
                                                    child: pw.Text(
                                                      'Rs. 600',
                                                      style: pw.TextStyle(
                                                        fontSize: 11,
                                                        //fontWeight: pw.FontWeight.bold
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(left: 20, top: 10),
                child: pw.Row(
                  children: [
                    pw.Text(
                      'Terms and conditions',
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 10, left: 20),
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('1.'),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(left: 10),
                      child: pw.Text(
                        'redBus* is ONLY a bus ticket agent. It does not operate bus services of its \nown. In order to provide a comprehensive choice of bus operators, departure \ntimes and prices to customers, it has tied up with many bus operators. redBus" \nadvice to customers is to choose bus operators they are aware of and whose \nservice they are comfortable with.',
                      ),
                    )
                  ],
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 10, left: 20),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'redBus" responsibilities include: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top: 6, left: 45),
                      child: pw.Text(
                        '(1) Issuing a valid ticket (a ticket that will be accepted by the bus \noperator) for its" network of bus operators',
                        style: pw.TextStyle(height: 5),
                      ),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(left: 45),
                      child: pw.Text(
                          '(2) Providing refund and support in the event of cancellation'),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(left: 45),
                      child: pw.Text(
                          '(3) Providing customer support and information in case of any delays /\ninconvenience'),
                    ),
                  ],
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 10, left: 20),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'redBus" responsibilities do NOT include: ',
                      style: pw.TextStyle(
                          // fontWeight: pw.FontWeight.bold
                          ),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top: 6, left: 45),
                      child: pw.Text(
                        '(1) The bus operator"s bus not departing / reaching on time\n(2) The bus operator"s employees being rude\n(3) The bus operator"s bus seats etc not being up to the customer"s \nexpectation\n(4) The bus operator canceling the trip due to unavoidable reasons\n(5) The baggage of the customer getting lost / stolen / damaged\n(6) The bus operator changing a customer"s seat at the last minute to \naccommodate a lady / child\n(7) The customer waiting at the wrong boarding point (please call the \nbus operator to find out the exact boarding point if you are not a \nregular travele" on that particular bus)\n(8) The bus operator changing the boarding point and/or using a \npickup vehicle at the b',
                        style: pw.TextStyle(height: 2),
                      ),
                    ),
                    pw.Row(
                      children: [
                        pw.Text('2.'),
                        pw.Padding(
                          padding: pw.EdgeInsets.only(left: 20),
                          child: pw.Text(
                              'The departure time mentioned on the ticket are only tentative timings.\nHowever the bus will not leave the source before the time that is \nmentioned on the ticket.'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('3.'),
                  pw.Padding(
                    padding: pw.EdgeInsets.only(left: 10),
                    child: pw.Text(
                      ' Passengers are required to furnish the following at the time of boarding the bus:\n(1) A copy of the ticket (A print out of the ticket or the print out of the ticket e-mail).\n(2) A valid identity proof \nFailing to do so, they may not be allowed to board the bus',
                      style: pw.TextStyle(height: 1.8),
                    ),
                  )
                ],
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 5),
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('4.'),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(left: 10),
                      child: pw.Text(
                        'Change of bus: In case the bus operator changes the type of bus due to some reason, \nredBus will refund the differential amount to the customer upon being intimated by \nthe customers in 24 hours of the journey',
                        style: pw.TextStyle(height: 1.8),
                      ),
                    )
                  ],
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 5),
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('5.'),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(left: 10),
                      child: pw.Text(
                        'Amenities for this bus as shown on redBus have been configured and provided by \nthe bus provider (bus operator). These amenities will be provided unless there are \nsome exceptions on certain days. Please note that redBus provides this information \nin good faith to help passengers to make an informed decision. The liability of the amenity \nnot being made available lies with the operator and not with redBus',
                        style: pw.TextStyle(height: 1.8),
                      ),
                    )
                  ],
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 5),
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('6.'),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(left: 10),
                      child: pw.Text(
                        'nfigured and provided by \nthe bus provider (bus operator). These amenities will be provided unless there are \nsome exceptions on certain days. Please note that redBus provides this information \nin good faith to help passengers to make an informed decision. The liability of the amenity \nnot being made available lies with the operator and not with redBus',
                        style: pw.TextStyle(height: 1.8),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );

    // AnchorElement(
    //     href:
    //         "data:application/octet-stream;charset=utf-16le;base64,${html.Blob([bytes], 'application/pdf')}")
    //   ..setAttribute("download", "report.pdf")
    //   ..click();

    final bytes = await pdf.save();
    html.Blob blob = html.Blob([bytes], 'application/pdf');
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "report.pdf")
      ..click();
    return blob;
  }

  //bus booking list

  List<BookingHistoryData> bookingHistoryList = [];

  getBusBookingHistory() async {
    dio.Response<dynamic> response =
        await getBusBookingHistoyApiServices.getBusBookingApiServices();

    if (response.statusCode == 200) {
      BusHistoryModel busHistoryModel = BusHistoryModel.fromJson(response.data);
      bookingHistoryList = busHistoryModel.data;
      update();
    }
    update();
  }
}
