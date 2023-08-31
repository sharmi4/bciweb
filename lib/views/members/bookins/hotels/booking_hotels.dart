
import 'package:bciweb/views/members/bookins/hotels/widgets/containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../constant/constans.dart';
import '../../../../controller/hotel_controller/hotel_controller.dart';
import '../../../../models/hotel_model/hoteldestination_model.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';
import '../bus/Bus_booking_main.dart';
import '../flight/booking_flight.dart';
import '../history/views/history.dart';
import '../trip/trip_booking.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
class BookingHotels extends StatefulWidget {
  const BookingHotels({super.key});

  @override
  State<BookingHotels> createState() => _BookingHotelsState();
}

class _BookingHotelsState extends State<BookingHotels> {
    Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDateRange: daterange,
    );

    if (newDateRange == null) return;

    setState(() => daterange = newDateRange);
  }
  
   DateTimeRange daterange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(days: 1)));

var destinationController = TextEditingController();
final hotelcityController = Get.find<HotelController>();
  @override
  Widget build(BuildContext context) {
     final start = daterange.start;
    final end = daterange.end;
    final diffrence = daterange.duration;
    bool isChecked = false;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
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
                              // InkWell(
                              //   onTap: () {
                              //     Get.to(BookingLiquer());
                              //   },
                              //   child: bookingbutton(
                              //     size: size,
                              //     text: 'LIQUOR',
                              //     colorr: kblue,
                              //   ),
                              // ),
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
                             InkWell(
                                onTap: () {
                                  Get.to(BusBookingMain());
                                },
                                child: bookingbutton(
                                  size: size,
                                  text: 'Bus',
                                  colorr: kblue,
                                ),
                              ),
                            ],
                          ),
                          height: 60,
                          width: size.width * 0.7,
                          decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        GetBuilder<HotelController>(
                          builder: (_) {
                            return Container(
                              height: 140,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                  color: kwhite,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.zero,
                                      bottomLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15))),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  Container(
                                            decoration: BoxDecoration(
                                                //  color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            height: size.height * 0.06,
                                            width: size.width * 0.2,
                                            child: TypeAheadField<HotelDestinationModel>(
                                              getImmediateSuggestions: true,
                                              textFieldConfiguration:
                                                  TextFieldConfiguration(
                                                onChanged: (value) async {
                                                  if (value.length > 1) {
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 200));
                                                            hotelcityController.hoteldestination(
                                                              city: value.toString());

                                                  }

                                                 
                                                },
                                                controller: destinationController,
                                                decoration: const InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    hintText: 'Enter Destination',
                                                    hintStyle: TextStyle(
                                                      fontSize: 14
                                                    )),
                                                    
                                              ),
                                              suggestionsCallback:
                                                  (String pattern) async {
                                                return hotelcityController.destinationlist
                                                    .where((item) => item.destination
                                                        .toLowerCase()
                                                        .startsWith(
                                                            pattern.toLowerCase()))
                                                    .toList();
                                              },
                                              itemBuilder: (context,
                                                  HotelDestinationModel citymodel) {
                                                return ListTile(
                                                  title: Text(citymodel.destination),
                                                );
                                              },
                                              itemSeparatorBuilder:
                                                  (context, index) {
                                                return Divider();
                                              },
                                              onSuggestionSelected:
                                                  (HotelDestinationModel citymodel) {
                                                print("destination selected");
                                                destinationController.text =
                                                    citymodel.destination;
                                                hotelcityController
                                                    .cityid(citymodel.destination);
                                                hotelcityController
                                                    .cityid(citymodel.destination);
                                              },
                                            ),
                                          ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      pickDateRange();
                                    },
                                    child: Container(
                                      height: size.height * 0.14,
                                      width: size.width * 0.09,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('CHECK-IN', style: TextStyle(
                                              fontSize: 13
                                            )),
                                            Spacer(),
                                              Text(
                                                            DateFormat('dd-MM-yyyy').format(start),
                                                            style: TextStyle(color: kblue, fontSize: 14),
                                                          ),
                                                           Spacer(),
                                                       
                                  
                                            //Text('6 May23', style: primarymediumFont),
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
                                              Text(
                                                            DateFormat('dd-MM-yyyy').format(end),
                                                            style: TextStyle(color: kblue, fontSize: 14),
                                                          ),
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
                                  Obx(()=>
                                   Container(
                                      height: size.height * 0.15,
                                      width: size.width * 0.15,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('ROOMS ',
                                                    style: TextStyle(
                                                      fontSize: 13
                                                    )),
                                                       Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                         children: [
                                                           InkWell(
                                                             onTap: () {
                                                               hotelcityController.roomno--;
                                                                                },
                                                                                child: const Icon(
                                                                                             Icons.remove_circle_outline_outlined,
                                                                                             size: 20,
                                                                                                 )),
                                                                                                 SizedBox(
                                                                                                  width: 2,
                                                                                                 ),
                                                            Text(hotelcityController.roomno.value.toString(),
                                                style:TextStyle(
                                                  fontSize: 13
                                                )),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                       InkWell(
                                onTap: () {
                                  hotelcityController.roomno++;
                                },
                                child: const Icon(
                                  Icons.add_circle_outline_outlined,
                                  size: 20,
                                )),
                                                         ],
                                                       ),
                                              ],
                                            ),
                                       Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(' GUESTS',
                                                    style: TextStyle(
                                                      fontSize: 13
                                                    )),
                                                       Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                               children: [
                                                 InkWell(
                                                       onTap: () {
                                                  hotelcityController.adult--;
                                                                      },
                                                                      child: const Icon(
                                                                                   Icons.remove_circle_outline_outlined,
                                                                                   size: 20,
                                                                                       )),
                                                                                       SizedBox(
                                                                                        width: 2,
                                                                                       ),
                                                         Text(hotelcityController.adult.value.toString(),
                                                style: TextStyle(
                                                  fontSize: 14
                                                )),
                                                  SizedBox(
                                                   width: 2,
                                                   ),
                                                 InkWell(
                                onTap: () {
                                  hotelcityController.adult++;
                                },
                                child: const Icon(
                                  Icons.add_circle_outline_outlined,
                                  size: 20,
                                )),
                                 
                                               ],
                                             ),
                                              ],
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
                                  ),
                                  
                                  Spacer(),
                                  Obx(()=>
                                     InkWell(
                                    
                                            onTap: () {
                hotelcityController.searchHotel(
                  child: hotelcityController.child.value.toString(),
                  adult: hotelcityController.adult.value.toString(),
                  checkindate: DateFormat('dd/MM/yyyy').format(start),
                  checkoutdate: DateFormat('dd/MM/yyyy').format(end),
                  destination: hotelcityController.hotelSearchKey.value,
                  //  childage: hotelController.roomno.value,
                  roomsno: hotelcityController.roomno.string,
                  countryCode: hotelcityController.hotelsearchkeycode.value
                );
                                            },
                                       child: hotelcityController.isLoading.isTrue? Container(
                                        height: size.height * 0.11,
                                        width: size.width * 0.09,
                                        child:Center(
                                          child: Text('Search',
                                          style: TextStyle(
                                            color: kblue,
                                            fontSize: 14
                                          ),),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          border: Border.all(
                                            color: kblue,
                                            width: 1.0,
                                          ),
                                        ),
                                                                         ):
                                                                         Container(
                                        height: size.height * 0.11,
                                        width: size.width * 0.09,
                                        child:Center(
                                          child: Text('Search',
                                          style: TextStyle(
                                            color: kblue,
                                            fontSize: 14
                                          ),),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          border: Border.all(
                                            color: kblue,
                                            width: 1.0,
                                          ),
                                        ),
                                                                         )

                                     ),
                                  ),
                                   ksizedbox20,
         
                                  Spacer()
                                ],
                              ),
                            );
                          }
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                )
              ],
            ),
            ksizedbox30,
            Text('Showing Properties in Tamil Nadu',
            style: TextStyle(
              fontSize: 25,
              color: kblue,
              fontWeight: FontWeight.bold
            ),),
            
                
            ksizedbox40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      ksizedbox30,
                      Row(
                        children: [
                          kwidth10,
                          Text('Poular Filters').text.semiBold.make(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Go first                      ₹ 6,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Go first                      ₹ 6,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Go first                      ₹ 6,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Go first                      ₹ 6,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Go first                      ₹ 6,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Go first                      ₹ 6,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Non Stop 17             ₹ 3,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Text('Show Less')
                          .text
                          .semiBold
                          .blue600
                          .make()
                          .objectCenterLeft()
                          .p12(),
                      ksizedbox30,
                      Text('One Way Price')
                          .text
                          .semiBold
                          .xl
                          .make()
                          .objectCenterLeft()
                          .p12(),
                      Slider(
                        value: 35,
                        onChanged: (Value) {},
                        max: 100,
                        min: 0,
                        activeColor: Vx.blue400,
                      ),
                      HStack([
                        Text('₹ 6,499 ').text.semiBold.make(),
                        Spacer(),
                        Text('₹ 12,499 ').text.semiBold.make()
                      ]).px24(),
                      ksizedbox30,
                    ],
                  ),
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: kwhite,
                      boxShadow: [
                        new BoxShadow(
                          color: Color.fromARGB(255, 186, 182, 182),
                          blurRadius: 20.0,
                        ),
                      ]),
                  // height: size.height * 0.6,
                  width: size.width * 0.18,
                ),
                Column(
                  children: [
                    ksizedbox30,
                    HottelbookingContainer(size: size),
                    ksizedbox10,
                    HottelbookingContainer(size: size),
                    ksizedbox10,
                    HottelbookingContainer(size: size),
                    ksizedbox10,
                  ],
                ),
              ],
            ),
            //   HottelbookingContainer(size: size),
            ksizedbox10,
            ksizedbox40,
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}
