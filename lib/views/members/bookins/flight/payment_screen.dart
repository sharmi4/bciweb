import 'package:bciweb/controller/api_flightcontroller/api_flight_Controller.dart';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/controller/flaight_payment_controller.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/models/air_search_model.dart';
import 'package:bciweb/models/flight_pax_model.dart';
import 'package:bciweb/models/flight_searchdatamodel.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constans.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';

class FlaightPaymentScreen extends StatefulWidget {
  String searchKey;
  String flightKey;
  dynamic paxDetails;
  Flight flight;
  List<PaxDetails> paxDetailsList;
  FlaightPaymentScreen(
      {super.key,
      required this.flight,
      required this.flightKey,
      this.paxDetails,
      required this.searchKey,
      required seachKey,
      required this.paxDetailsList,
      required FlightSearchDataModel flightSearchDataModel});

  @override
  State<FlaightPaymentScreen> createState() => _FlaightPaymentScreenState();
}

class _FlaightPaymentScreenState extends State<FlaightPaymentScreen> {
  final apiflightController = Get.find<ApiflightsController>();

  @override
  Widget build(BuildContext context) {
    final paymentController = Get.find<PaymentController>();
    return Scaffold(
      appBar: const PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: Obx(
        () => ListView(
          children: [
            Column(
              children: [
                RegisterCommonContainer(),
                Container(
                    height: 405,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/Group 39747.png',
                            ),
                            fit: BoxFit.cover)),
                    child: Center(
                      child: paymentController.paymentindex.value == 0
                          ? Text(
                              'Flight Book Confirmation',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: kwhite,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            )
                          : Text(
                              '',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: kwhite,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 50),
                  child: Row(
                    children: [
                      Text(
                        'Confirmation',
                        style: TextStyle(
                            fontSize: 25,
                            color: kblue,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60, top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            width: MediaQuery.of(context).size.width * 0.29,
                            decoration: BoxDecoration(
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      color: kgrey,
                                      blurRadius: 5)
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'From',
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: kblue,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 35),
                                        child: Text(
                                          apiflightController.origin.value,
                                          style: TextStyle(
                                              color: kblue, fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 35),
                                        child: Text(
                                          apiflightController
                                              .originFullName.value,
                                          style: TextStyle(
                                              color: kblue, fontSize: 13),
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(top: 35),
                                      //   child: Text(
                                      //     'Terminal \n02',
                                      //     style: TextStyle(
                                      //         color: kblue,
                                      //         fontSize: 16,
                                      //         height: 2),
                                      //   ),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(top: 20),
                                      //   child: Text(
                                      //     'Seat \n24H',
                                      //     style: TextStyle(
                                      //         color: kblue,
                                      //         height: 2,
                                      //         fontSize: 16),
                                      //   ),
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          'Date \n${formatDate(apiflightController.depatureDate, [
                                                dd,
                                                "-",
                                                mm,
                                                "-",
                                                yyyy
                                              ])}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: kblue,
                                              height: 2),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'To',
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: kblue,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 35),
                                        child: Text(
                                          apiflightController.destination.value,
                                          style: TextStyle(
                                              color: kblue, fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 35),
                                        child: Text(
                                          apiflightController
                                              .destinationFullName.value,
                                          style: TextStyle(
                                              color: kblue, fontSize: 13),
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(top: 35),
                                      //   child: Text(
                                      //     'Gate \n12',
                                      //     style: TextStyle(
                                      //         color: kblue,
                                      //         fontSize: 16,
                                      //         height: 2),
                                      //   ),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(top: 20),
                                      //   child: Text(
                                      //     'Boarding \n14:54',
                                      //     style: TextStyle(
                                      //         color: kblue,
                                      //         height: 2,
                                      //         fontSize: 16),
                                      //   ),
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          'Flight \n${widget.flight.segments.first.aircraftType} ${widget.flight.segments.first.flightNumber}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: kblue,
                                              height: 2),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.26,
                            width: MediaQuery.of(context).size.width * 0.27,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: const Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kgrey)
                                ],
                                color: kwhite),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.paxDetailsList.first.firstName} ${widget.paxDetailsList.first.lastName}',
                                    style:
                                        TextStyle(fontSize: 20, color: kblue),
                                  ),
                                  if (Get.find<ProfileController>()
                                      .profileData
                                      .isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 40),
                                      child: Text(
                                          Get.find<AuthProfileController>()
                                              .profileData
                                              .first
                                              .email),
                                    ),
                                  if (Get.find<AuthProfileController>()
                                      .profileData
                                      .isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(Get.find<
                                                    AuthProfileController>()
                                                .profileData
                                                .first
                                                .mobile),
                                          )
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: apiflightController.isLoading.isFalse
                                ? InkWell(
                                    onTap: () {
                                      BookingModel bookingModel = BookingModel(
                                          bookingRemark:
                                              "${apiflightController.origin.value} - ${apiflightController.destination.value}",
                                          customerMobile:
                                              Get.find<AuthProfileController>()
                                                  .profileData
                                                  .first
                                                  .mobile,
                                          flightKey: widget.flightKey,
                                          passengerEmail:
                                              Get.find<AuthProfileController>()
                                                  .profileData
                                                  .first
                                                  .email,
                                          passengerMobile:
                                              Get.find<AuthProfileController>()
                                                  .profileData
                                                  .first
                                                  .mobile,
                                          paxDetails: widget.paxDetailsList,
                                          bookingSsrDetails: [],
                                          searchKey: widget.searchKey);

                                      apiflightController.createBooking(
                                        amount: widget.flight.fares.first
                                            .fareDetails.first.totalAmount
                                            .toDouble(),
                                        bookingModel: bookingModel,
                                      );

                                      // flightsController.initiatePayment(
                                      //     amount: widget.flight.fares.first
                                      //             .fareDetails.first.totalAmount
                                      //             .toDouble() *
                                      //         listOfPaxDetailsList.length,
                                      //     bookingModel: bookingModel);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width *
                                          0.27,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              colors: [kyellow, kOrange])),
                                      child: Center(
                                        child: Text(
                                          'Payments',
                                          style: TextStyle(
                                              color: kwhite, fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width *
                                        0.27,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                            colors: [kyellow, kOrange])),
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                ksizedbox20,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
