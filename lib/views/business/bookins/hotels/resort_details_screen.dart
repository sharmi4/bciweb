import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constans.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../flight/booking_flight.dart';
import '../history/views/history.dart';
import '../liquer/Liquer_booking.dart';
import '../trip/trip_booking.dart';
import 'booking_hotels.dart';

class ResortDetailsScreen extends StatefulWidget {
  const ResortDetailsScreen({super.key});

  @override
  State<ResortDetailsScreen> createState() => _ResortDetailsScreenState();
}

class _ResortDetailsScreenState extends State<ResortDetailsScreen> {
  var dropvalue1='';
  var lastname1Controller=TextEditingController();
    var lastname2Controller=TextEditingController();
    var emailController=TextEditingController();
    var numberController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    String dropdownvalue='MR';
    
    
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [Column(
          children: [
              RegisterCommonContainer(),
             Stack(
                children: [
                  Container(
                      width: size.width,
                      child: Image.asset('assets/images/Group 39748.png')),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(BookingFlight());
                                  },
                                  child: bookingbutton(
                                    size: size,
                                    text: 'FLIGHT',
                                    colorr: kblue,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(BookingHotels());
                                  },
                                  child: bookingbutton(
                                    size: size,
                                    text: 'HOTELS',
                                    colorr: korange,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(BookingTrip());
                                  },
                                  child: bookingbutton(
                                    size: size,
                                    text: 'TRIP',
                                    colorr: kblue,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(BookingLiquer());
                                  },
                                  child: bookingbutton(
                                    size: size,
                                    text: 'LIQUOR',
                                    colorr: kblue,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(History());
                                  },
                                  child: bookingbutton(
                                    size: size,
                                    text: 'HISTORY',
                                    colorr: kblue,
                                  ),
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     Get.to(OthersBooking());
                                //   },
                                //   child: bookingbutton(
                                //     size: size,
                                //     text: 'Others',
                                //     colorr: kblue,
                                //   ),
                                // ),
                              ],
                            ),
                            height: 65,
                            width: size.width * 0.6,
                            decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Spacer(),
                                Container(
                                  height: size.height * 0.14,
                                  width: size.width * 0.15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        //     Text('CITY, PROPERTY NAME OR LOCATION',
                                        //         style: primarysmallFont),
                                        Spacer(),
                                        Text('Tamil Nadu',
                                            style: primarymediumFont),
                                        Spacer(),
                                        Text('India', style: TextStyle(
                                          fontSize: 16
                                        )
                                        ),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color: kblue,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: size.height * 0.14,
                                  width: size.width * 0.09,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('CHECK-IN', style: TextStyle(
                                          fontSize: 13
                                        )),
                                        Spacer(),
                                        Text('6 May23', style: primarymediumFont),
                                        Spacer(),
                                        //       Text('Saturday', style: primarysmallFont),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color: kblue,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: size.height * 0.15,
                                  width: size.width * 0.09,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('CHECK-OUT',
                                            style: TextStyle(
                                              fontSize: 13
                                            )),
                                        Spacer(),
                                        Text('6 May23', style: primarymediumFont),
                                        Spacer(),
                                        //     Text('Saturday', style: primarysmallFont),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color: kblue,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: size.height * 0.15,
                                  width: size.width * 0.15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('ROOMS & GUESTS',
                                            style: TextStyle(
                                              fontSize: 13
                                            )),
                                        Spacer(),
                                        Text('1 Room 2 Adults',
                                            style: primarymediumFont),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color: kblue,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: size.height * 0.11,
                                  width: size.width * 0.09,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('PRICE PER NIGHT',
                                            style: primarysmallFont),
                                        Spacer(),
                                        Text('₹0-₹1500, ₹1500-',
                                            style: primarysmallFont),
                                        Spacer(),
                                        //    Text('₹2500,...',
                                        //       style: primarysmallFont),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color: kblue,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                Spacer()
                              ],
                            ),
                            height: 140,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                                color: kwhite,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.zero,
                                    bottomLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                          ),
                          Spacer()
                        ],
                      ),
                    ),
                  ),
                   Positioned(
                                bottom: 80,
                               right: 0,
                                left: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 40,
                                         width: MediaQuery.of(context).size.width*0.14,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: kwhite),
                                          gradient: LinearGradient(colors: [
                                          kOrange,
                                          kyellow
                                                       ])
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: (){
                                                       
                                                      },
                                                      child: Center(
                                                        child: Text('SEARCH',
                                                        style: TextStyle(
                                                          color: kwhite,
                                                          fontSize: 16
                                                        ),
                                                        textAlign: TextAlign.center,)),
                                                    ),
                                                  ),
                                  ],
                                ),
                                            ),
      
                           
                ],
              ),
               Padding(
                 padding: const EdgeInsets.only(left: 20,right: 20,top: 25),
                 child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height:500,
                                    width: 700,
                                    decoration: BoxDecoration(
                                      color: kwhite,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          offset: Offset(0.0, 0.75),
                                          blurRadius: 5,
                                          color: kgrey
                                        )
                                      ]
                                    ),
                                    child: Column(
                                      children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top:20,left: 20,right: 20),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Alagoa Resort',
                                                    style: TextStyle(
                                                      fontSize: 23,
                                                      fontWeight: FontWeight.bold
                                                    ),),
                                                    ksizedbox10,
                                                    Row(
                                                     children: [
                                                      Text('Raiting',
                                                       style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w500
                                                        ),),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left: 5),
                                                           child: Icon(Icons.star,color: Colors.yellow,),
                                                         ),
                                                         Icon(Icons.star,color: Colors.yellow,),
                                                         Icon(Icons.star,color: Colors.yellow,),
                                                         Icon(Icons.star,color: Colors.yellow,),
                                                         Icon(Icons.star,color: Colors.yellow,)
                                                         ],
                                                        ),
                                                        ksizedbox20,
                                                      Row(
                                                      children: [
                                                        Text('Betalbatim Salcette Goa, Goa, India',
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight: FontWeight.w500
                                                        ),),
                                                      ],
                                                                                                        )
                                                  
                                                  ],
                                                ),
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: Image.asset('assets/images/resorthotelimage.jpg',
                                                  height: 100,
                                                  fit: BoxFit.fitHeight,),
                                                ),
                                                  
                                              ],
                                            ),
                                          ),
                                          ksizedbox20,
                                          Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: kgrey.withOpacity(0.4)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('CHECK IN'),
                                                       Text('6 May 2023',
                                                       style: TextStyle(
                                                        fontSize: 19,
                                                        color: kblue,
                                                        fontWeight: FontWeight.bold
                                                       ),),
                                                       Text('Saturday, 1 PM'),
                                                      // Row(
                                                      //   children: [
                                                         
                                                      //     Icon(Icons.arrow_back),
                                                      //     Text('1 NIGHT'),
                                                      //     Icon(Icons.arrow_forward),
                                                      //     Text('7 May 2023'),
                                                      //     Text('1 Night | 2 Adults | 1 Room'),
                                                      //     Text('')
                                                      //   ],
                                                      // )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 50),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.arrow_back,
                                                        size: 12,),
                                                    Text('1 NIGHT',
                                                    style: TextStyle(
                                                      fontSize: 14
                                                    ),),
                                                    Icon(Icons.arrow_forward,
                                                    size: 12,)
                                                  
                                                      ],
                                                    ),
                                                  ),

                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 50),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Text('CHECK OUT'),
                                                        Text('7 May 2023',
                                                        style: TextStyle(
                                                          fontSize: 19,
                                                          fontWeight: FontWeight.bold,
                                                          color: kblue
                                                        ),),
                                                        Text('Sunday, 10 AM')
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 60),
                                                    child: Row(
                                                      children: [
                                                        Text('1 Night | 2 Adults | 1 Room',
                                                        style: TextStyle(
                                                          color: kblue,
                                                          fontWeight: FontWeight.bold
                                                        ),)
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(left: 20,top: 20),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              //mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text('Deluxe Room',
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  color: kblue
                                                ),),
                                                
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 4),
                                                  child: Text('2 Adults'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8),
                                                  child: Text('Room Only'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top:4),
                                                  child: Text('No meals included'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 5),
                                                  child: Row(
                                                    children: [
                                                      Text('Non-Refundable |',
                                                      style: TextStyle(
                                                        color: korange
                                                      ),),
                                                      Text('On Cancellation, You will not get any refund'),
                                                      Text('Cancellation policy details',
                                                      style: TextStyle(
                                                        color: korange
                                                      ),)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 30,left: 20),
                                            child: Row(
                                              
                                              children: [
                                                Text('Upgrade Your Stay',
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  color: kblue
                                                ),)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20,top: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text('Add Breakfast for ₹ 595 for all guests'),
                                                Text('Add Breakfast + Lunch/Dinner for ₹ 1717 for all guests')
                                              ],
                                            ),
                                          )
                                        
                                      ],
                                    ),
                                  ),

                                  Column(
                                    children: [
                                      Container(
                                        height: 350,
                                        width: 330,
                                        decoration: BoxDecoration(
                                          color: kwhite,
                                          boxShadow: <BoxShadow>[

                                            BoxShadow(
                                              offset: Offset(0.0, 0.75),
                                              blurRadius: 5,
                                              color: kgrey
                                            )
                                          ]
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top:15,left: 15),
                                              child: Row(
                                                children: [
                                                  Text('Price Breakup',
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold,
                                                    color: kblue
                                                  ),)
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15,top:19,right: 15),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('1 Room x 1 Night',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: kblue,
                                                    fontWeight: FontWeight.bold
                                                  ),),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(top:10),
                                                        child: Text('Base Price'),
                                                      ),
                                                      Text('₹ 3,550',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: korange,
                                                        fontWeight: FontWeight.bold
                                                      ),)
                                                    ],
                                                  ),
                                                  Text('-----------------------------------------------------',
                                                  style: TextStyle(
                                                    color: kgrey
                                                  ),),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:7),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Total Discount',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold,
                                                          color: kblue
                                                        ),),
                                                        Text('₹ 744',
                                                        style: TextStyle(
                                                          color: kblue,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold
                                                        ),)
                                                      ],
                                                    ),
                                                  ),
                                                    Text('-----------------------------------------------------',
                                                  style: TextStyle(
                                                    color: kgrey
                                                  ),),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:7),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Price after Discount',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold,
                                                          color: kblue
                                                        ),),
                                                        Text('₹ 2,806',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                          color: korange
                                                        ),)
                                                      ],
                                                    ),
                                                  ),
                                                     Text('-----------------------------------------------------',
                                                  style: TextStyle(
                                                    color: kgrey
                                                  ),),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:7),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Taxes & Service Fees',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold,
                                                          color: kblue
                                                        ),),
                                                        Text('₹ 573',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                          color: korange
                                                        ),)
                                                      ],
                                                    ),
                                                  ),
                                                    Text('-----------------------------------------------------',
                                                  style: TextStyle(
                                                    color: kgrey
                                                  ),),

                                                 Padding(
                                                   padding: const EdgeInsets.only(top:4),
                                                   child: Row(
                                                     children: [
                                                       Container(
                                                        height: 50,
                                                        width:200 ,
                                                        decoration: BoxDecoration(
                                                         color: kOrange
                                                        ),
                                                        child: Center(
                                                          child: Text('Total Amount to be paid',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: kwhite,
                                                            fontWeight: FontWeight.bold
                                                          ),),
                                                        ),
                                                       ),
                                                       Container(
                                                        height: 50,
                                                        width:100 ,
                                                        decoration: BoxDecoration(
                                                         color: kblue
                                                        ),
                                                        child: Center(
                                                          child: Text('₹ 3,379',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: kwhite,
                                                            fontWeight: FontWeight.bold
                                                          ),),
                                                        ),
                                                       ),
                                                     ],
                                                   ),
                                                 )
                                                ],
                                              ),
                                            ),
                                           
                                          ],
                                        ),
                                      ),
                                       ksizedbox10,
                                            Container(
                                              height: 140,
                                              width: 330,
                                              decoration: BoxDecoration(
                                                color: kwhite,
                                                boxShadow: <BoxShadow>[
                                                  
                                                  BoxShadow(
                                                    offset: Offset(0.0, 0.75),
                                                    blurRadius: 5,
                                                    color: kgrey
                                                  )
                                                ],
                                                borderRadius: BorderRadius.circular(10)

                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:10,left: 10),
                                                    child: Row(
                                                      children: [
                                                        Text('WHY ',
                                                        style: TextStyle(
                                                          color: kblue,
                                                          fontWeight: FontWeight.bold
                                                        ),),
                                                        Text('SIGN UP',
                                                        style: TextStyle(
                                                          color: korange,
                                                          fontWeight: FontWeight.bold
                                                        ),),
                                                        Text(' OR LOGIN',
                                                        style: TextStyle(
                                                          color: kblue,
                                                          fontWeight: FontWeight.bold
                                                        ),)
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:10,top:10),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: korange
                                                          ),
                                                          child: Center(
                                                            child: Icon(Icons.check,
                                                            color: kwhite,
                                                            size: 14,),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left:10),
                                                          child: Text('Get access to Secret Deals',
                                                            style: TextStyle(
                                                            fontWeight: FontWeight.w500
                                                          ),),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:10,top:10),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: korange
                                                          ),
                                                          child: Center(
                                                            child: Icon(Icons.check,
                                                            color: kwhite,
                                                            size: 14,),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left:10),
                                                          child: Text('Book Faster - we’ll save & pre-enter \nyour details',
                                                            style: TextStyle(
                                                            fontWeight: FontWeight.w500
                                                          ),),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:10,top:10),
                                                      child: Row(
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: korange
                                                          ),
                                                          child: Center(
                                                            child: Icon(Icons.check,
                                                            size: 14,
                                                            color: kwhite,),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left:10),
                                                          child: Text('Manage your bookings from one place',
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w500
                                                          ),),
                                                        )
                                                      ],
                                                      ),
                                                    )
                                                ],
                                              ),
                                            )
                                    ],
                                  )
                                ],
                              ),
               ),
               ksizedbox30,

               Padding(
                 padding: const EdgeInsets.only(left: 70,right:70),
                 child: Container(
                  height: 220,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: kwhite,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0.0, 0.75),
                        blurRadius: 5,
                        color: kgrey
               
                      )
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Padding(
                         padding: const EdgeInsets.only(left:20),
                         child: Row(
                          children: [
                            Text('Guest Details',
                            style: TextStyle(
                              fontSize: 19,
                              color: kblue,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                         ),
                       ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('TITLE'),
                              ksizedbox10,
                                 Container(
                                                      height: 40,
                                                      width: MediaQuery.of(context).size.width*0.12,
                                                      decoration: BoxDecoration(
                                                             border: Border.all(
                                                              color: kgrey
                                                             ),
                                                             borderRadius: BorderRadius.circular(5)
                                                        ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                           Padding(
                                                            padding: const EdgeInsets.only(left: 10),
                                                            child: Text(dropvalue1),
                                                          ),
                                                            PopupMenuButton(
                                                            child: Icon(Icons.arrow_drop_down_sharp),
                                                          itemBuilder: (context)=>[
                                                             PopupMenuItem(
                                                              value: 'MR',
                                                              child: Text('MR',
                                                              style: TextStyle(
                                                                fontSize: 14
                                                              ),)),
                                                            
                                                             PopupMenuItem(
                                                              value: 'SR',
                                                              child: Row(
                                                                children: [
                                                                
                                                                  Text('SR',
                                                                  style: TextStyle(
                                                                    fontSize: 13
                                                                  ),),
                                                                ],
                                                              ),
                                
                                                             ),
                                                             
                                                             
                                                    
                                                        ],
                                                        onSelected: (value){
                                                          setState(() {
                                                          dropvalue1=value.toString();
                                                          });
                                                        },
                                                        ),
                          
                                                        ],
                                                      ),
                                                    ),
                            ],
                           ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('LAST NAME'),
                              ksizedbox10,
                              Container(
                                height: 45,
                                width: size.width*0.25,
                                child: TextField(
                                  
                                  controller: lastname1Controller,
                                  decoration: InputDecoration(
                                    hintText: 'Last Name',
                                    border: OutlineInputBorder()
                                  ),
                                ),
                              )
                            ],
                           ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('LAST NAME'),
                              ksizedbox10,
                              Container(
                                height: 45,
                                width: size.width*0.25,
                                child: TextField(
                                  controller: lastname1Controller,
                                  decoration: InputDecoration(
                                    hintText: 'Last Name',
                                    border: OutlineInputBorder()
                                  ),
                                ),
                              )
                            ],
                           )
                         ],
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 60,top: 20),
                         child: Row(
                         
                          children: [
                                Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('EMAIL ADDRESS(Booking voucher will be sent to this email ID)'),
                                ksizedbox10,
                                Container(
                                  height: 45,
                                  width: size.width*0.25,
                                  child: TextField(
                                    
                                    controller: lastname1Controller,
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      border: OutlineInputBorder()
                                    ),
                                  ),
                                )
                              ],
                             ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 50,top:10
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('MOBILE NUMBER'),
                                  ksizedbox10,
                                  Row(
                                    children: [
                                      Container(
                                        height: 45,
                                      
                                        child: Row(
                                          
                                          children: [
                                            Container(
                                              height: 45,
                                              width: 80,
                                              
                                              decoration: BoxDecoration(
                                              color: kwhite,
                                              border: Border.all(
                                                color: kgrey
                                              ),
                                              borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  PopupMenuButton(
                                                                    child: Icon(Icons.arrow_drop_down_sharp),
                                                                  itemBuilder: (context)=>[
                                                                     PopupMenuItem(
                                                                      value: 'MR',
                                                                      child: Text('MR',
                                                                      style: TextStyle(
                                                                        fontSize: 14
                                                                      ),)),
                                                                    
                                                                     PopupMenuItem(
                                                                      value: 'SR',
                                                                      child: Row(
                                                                        children: [
                                                                        
                                                                          Text('SR',
                                                                          style: TextStyle(
                                                                            fontSize: 13
                                                                          ),),
                                                                        ],
                                                                      ),
                                
                                                                     ),
                                                                     
                                                                     
                                                            
                                                                ],
                                                                onSelected: (value){
                                                                  setState(() {
                                                                  dropvalue1=value.toString();
                                                                  });
                                                                },
                                                                ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                            height: 45,
                                            width: size.width*0.2,
                                              child: TextField(
                                                controller: lastname1Controller,
                                                decoration: InputDecoration(
                                                  hintText: 'Last Name',
                                                  border: OutlineInputBorder()
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                                                         ),
                              )
                          ],
                         ),
                       )
                    ],
                  ),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.only(left:70,right:70,top:15),
                 child: Container(

                  height: 45,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: korange,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text('Pay Now',
                    style: TextStyle(
                      fontSize: 20,
                      color: kwhite,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                 ),
               ),
               ksizedbox30,
          ],
        ),
        ]
      ),
    );
  }
}