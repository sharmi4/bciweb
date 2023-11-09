import 'package:bciweb/controller/seat_controller.dart';
import 'package:bciweb/models/air_search_model.dart';
import 'package:bciweb/models/flight_searchdatamodel.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../constant/constans.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';
import '../../../members/common_widget/common_buttom.dart';

class FlaightSeatsBookingScreen extends StatefulWidget {
   String searchKey;
  String flightKey;
  dynamic paxDetails;
  Flight flight;
   FlaightSeatsBookingScreen({super.key,
   required this.flight,
   required this.flightKey,
   this.paxDetails,
   required this.searchKey, required seachKey, required FlightSearchDataModel flightSearchDataModel});

  @override
  State<FlaightSeatsBookingScreen> createState() => _FlaightSeatsBookingScreenState();
}

class _FlaightSeatsBookingScreenState extends State<FlaightSeatsBookingScreen> {
  @override
  Widget build(BuildContext context) {
    final seatController=Get.find<SeatController>();
    return Scaffold(
        appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
          body:  ListView(
            children: [Column(
                children: [
                   RegisterCommonContainer(),
                  Container(
                             height: 405,
                                    width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(image:AssetImage('assets/images/Group 39747.png',
                              ),fit: BoxFit.cover )
                            ),
                                child:Center(
                                  child:Text('Flight Seats Choose',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: kwhite,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2
                                  ),)
                                )),
                               
                             
                              
                               Padding(
                                 padding: const EdgeInsets.only(top:20),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text('Economy ',
                                     style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: kblue
                                     ),),
                                     Text('72 Seats Available',
                                     style: TextStyle(
                                      fontSize: 20,
                                    color: kblue
                                     ),)
                                   ],
                                 ),
                               ),
                                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/flaightseats.png'),
                    Image.asset('assets/images/flaightseats.png'),
                    Image.asset('assets/images/flaightseats.png'),
                    Image.asset('assets/images/flaightseats.png'),
                    Text(
                      'A',
                      style: TextStyle(fontSize: 16, color: kyellow),
                    ),
                    Image.asset('assets/images/flaightseats.png'),
                    Image.asset('assets/images/flaightseats.png'),
                    Image.asset('assets/images/flaightyellowseats.png'),
                    Image.asset('assets/images/flaightseats.png')
                  ],
                ),
           
                               ksizedbox20,
                                 CommonBottom()
                ],
              ),
            ]
          ),
          
    );
  }
}