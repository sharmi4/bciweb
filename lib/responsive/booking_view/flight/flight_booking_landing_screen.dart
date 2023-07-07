
import 'package:bciweb/responsive/booking_view/flight/par_nyc_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constans.dart';
import '../../../controller/flaight_booking_controller.dart';
import 'flight_dates_choosers.dart';
import 'flight_destination_chooser.dart';
import 'flight_landing_screen_header.dart';

class FlightBookingLandingScreen extends StatefulWidget {
  const FlightBookingLandingScreen({super.key});

  @override
  State<FlightBookingLandingScreen> createState() =>
      _FlightBookingLandingScreenState();
}

class _FlightBookingLandingScreenState
    extends State<FlightBookingLandingScreen> {
  final flightBookingController = Get.find<FlaightBookingController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
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
          FlightDateRange(),
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
              Column(
                children: [
                  Text(
                    'Economy',
                    style: TextStyle(fontSize: 15, color: kgrey),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: korange),
                    height: 5,
                    width: 30,
                  )
                ],
              ),
              Text(
                'Business',
                style: TextStyle(fontSize: 15, color: kgrey),
              ),
              Text(
                'First Class',
                style: TextStyle(fontSize: 15, color: kgrey),
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
                  '1 Adult',
                  style: TextStyle(fontSize: 15, color: kgrey),
                ),
              ),
              Image.asset('assets/images/Group 447.png'),
            ],
          ),
          ksizedbox20,
          Divider(
            thickness: 1,
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 42, right: 41),
            child: InkWell(
              onTap: () {
                //Get.to(ParNycSCreen(flightSearchDataModel: null,));
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
                child: Text(
                  'Search Flights',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          ksizedbox40
        ],
      ),
    );
  }
}
