
import 'package:bciweb/responsive/booking_view/flight/par_nyc_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constans.dart';
import '../../../controller/api_flightcontroller/api_flight_Controller.dart';
import '../../../controller/flaight_booking_controller.dart';
import '../../../models/flight_searchdatamodel.dart';
import 'flight_dates_choosers.dart';
import 'flight_destination_chooser.dart';
import 'flight_landing_screen_header.dart';
import 'flight_one_way_date_chooser.dart';

class FlightBookingLandingScreen extends StatefulWidget {
  const FlightBookingLandingScreen({super.key});

  @override
  State<FlightBookingLandingScreen> createState() =>
      _FlightBookingLandingScreenState();
}

class _FlightBookingLandingScreenState
    extends State<FlightBookingLandingScreen> {

       @override
  void initState() {
    super.initState();
  }

  setDefault() async {
    apiflightController.adultsCount(1);
    apiflightController.childsCount(0);
  }
  final flightBookingController = Get.find<FlaightBookingController>();
  final apiflightController = Get.find<ApiflightsController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(()=>
         ListView(
          physics: BouncingScrollPhysics(),
          children: [
            FlightBookingHeader(),
            ksizedbox20,
            FlightDestinationChooser(),
            ksizedbox20,
            const Divider(
              thickness: 1,
            ),
            ksizedbox10,
              apiflightController.wayIndex.value == 1
                  ? FlightDateRange()
                  : FlightOneWayDateRange(),
            ksizedbox20,
            const Divider(
              thickness: 1,
            ),
            ksizedbox10,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Cabin Class",
                style: primaryFont.copyWith(
                    color: kblue, fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
            ),
            ksizedbox20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    apiflightController.cabinClassIndex(0);
                  },
                  child: Column(
                    children: [
                      Text(
                        'Economy',
                        style: TextStyle(fontSize: 15, color: kgrey),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:apiflightController.cabinClassIndex==0? korange:kwhite),
                        height: 5,
                        width: 30,
                      )
                    ],
                  ),
                ),
                 InkWell(
                  onTap: () {
                    apiflightController.cabinClassIndex(1);
                  },
                  child: Column(
                    children: [
                      Text(
                        'Business',
                        style: TextStyle(fontSize: 15, color: kgrey),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:
                                apiflightController.cabinClassIndex.value ==
                                        1
                                    ? korange
                                    : kwhite),
                        height: 5,
                        width: 30,
                      )
                    ],
                  ),
                ),
                 InkWell(
                  onTap: () {
                    apiflightController.cabinClassIndex(2);
                  },
                  child: Column(
                    children: [
                      Text(
                        'First Class',
                        style: TextStyle(fontSize: 15, color: kgrey),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:
                                apiflightController.cabinClassIndex.value ==
                                        2
                                    ? korange
                                    : kwhite),
                        height: 5,
                        width: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
            ksizedbox20,
            Divider(
              thickness: 1,
            ),
            ksizedbox10,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Passengers",
                style: primaryFont.copyWith(
                    color: kblue, fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
            ),
            ksizedbox20,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    '${apiflightController.adultsCount.value}Adult',
                    style: TextStyle(fontSize: 15, color: kgrey),
                  ),
                ),
                 PopupMenuButton(
                  child: Image.asset('assets/images/Group 447.png'),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value:
                          'Adults ${apiflightController.adultsCount.value}',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Adults',
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    apiflightController
                                        .decreaseAdultCount();
                                    flightBookingController.update();
                                  },
                                  icon: Icon(Icons.do_not_disturb_on_outlined)),
                              Obx(() => Text(
                                    ' ${apiflightController.adultsCount.value}',
                                    style: TextStyle(fontSize: 14),
                                  )),
                              IconButton(
                                  onPressed: () {
                                    apiflightController
                                        .increaseAdultCount();
                                    flightBookingController.update();
                                  },
                                  icon: const Icon(
                                      Icons.add_circle_outline_outlined))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  onSelected: (value) {
                    setState(() {
                      // dropvalue1 = value.toString();
                    });
                  },
                ),
                     const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    '${apiflightController.childsCount.value} Children',
                    style: TextStyle(fontSize: 15, color: kgrey),
                  ),
                ),
                PopupMenuButton(
                  child: Image.asset('assets/images/Group 447.png'),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value:
                          'Childrens ${apiflightController.childsCount.value}',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Childrens',
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    apiflightController
                                        .decreaseChildCount();
                                    flightBookingController.update();
                                  },
                                  icon: Icon(Icons.do_not_disturb_on_outlined)),
                              Obx(() => Text(
                                    '${apiflightController.childsCount.value}',
                                    style: TextStyle(fontSize: 14),
                                  )),
                              IconButton(
                                  onPressed: () {
                                    apiflightController
                                        .increaseChildCount();
                                    flightBookingController.update();
                                  },
                                  icon: const Icon(
                                      Icons.add_circle_outline_outlined))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  onSelected: (value) {
                    setState(() {
                      // dropvalue1 = value.toString();
                    });
                  },
                ),
              
              ],
            ),
            ksizedbox20,
            Divider(
              thickness: 1,
            ),
            ksizedbox10,
              Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 42, right: 41),
                child: apiflightController.isLoading.isTrue
                    ? Container(
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFFFF5C29),
                              Color(0xFFFFCD38),
                            ],
                          ),
                        ),
                        child: const CupertinoActivityIndicator(
                          color: Colors.white,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          FlightSearchDataModel flightSearchDataModel =
                              FlightSearchDataModel(
                                  adultsCount: apiflightController
                                      .adultsCount.value,
                                  cabinClass: apiflightController
                                      .cabinClassIndex.value,
                                  fromName: apiflightController
                                      .originFullName.value,
                                  toName:
                                      apiflightController
                                          .destinationFullName.value,
                                  childCount:
                                      apiflightController.childsCount.value,
                                  depatureDate:
                                      apiflightController.depatureDate,
                                  fromIata:
                                      apiflightController.origin.value,
                                  isOneWayOrRoundTrip:
                                      apiflightController.wayIndex.value,
                                  returnDate:
                                      apiflightController.returnDate,
                                  toIata: apiflightController
                                      .destination.value);

                          apiflightController.airSearch(
                              flightSearchModel: flightSearchDataModel,ismobilorweb: true);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFFF5C29),
                                Color(0xFFFFCD38),
                              ],
                            ),
                          ),
                          child: const Text(
                            'Search Flights',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
              ),
            ),
            ksizedbox40
          ],
        ),
      ),
    );
  }
}
