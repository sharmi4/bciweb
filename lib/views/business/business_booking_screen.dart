import 'package:bciweb/routes/app_pages.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constans.dart';
import '../../controller/business_controller/business_service_controller.dart';
import '../../registerhomescreen/business_comm_homecontainer.dart';
import '../../registerhomescreen/common_reg_bottom.dart';
import '../members/common_widget/business_common_screen.dart';
import 'business_booking_details_screen.dart';

class BusinessBookingScreen extends StatefulWidget {

  const BusinessBookingScreen({super.key});

  @override
  State<BusinessBookingScreen> createState() => _BusinessBookingScreenState();
}

class _BusinessBookingScreenState extends State<BusinessBookingScreen> {
    final serviceController = Get.find<BusinessServiceController>();

  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

  DateTime date1 = DateTime.now();
  DateTime date = DateTime.now();

  String selectdt = formatDate(DateTime.now().subtract(Duration(days: 1)), [
    yyyy,
    "-",
    mm,
    "-",
    dd,
  ]);

  String selectdt1 = formatDate(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      [yyyy, "-", mm, "-", dd]);

  _showDatePicker(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        builder: ((context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: kblue,
                onPrimary: Colors.white,
                onSurface: Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 42, 59, 158),
                ),
              ),
            ),
            child: child!,
          );
        }));

    if (picked != null) {
      setState(() {
        date1 = picked;
        selectdt = formatDate(date1.subtract(Duration(days: 1)), [
          yyyy,
          "-",
          mm,
          "-",
          dd,
        ]);
      });
      serviceController.dateFilterBooking(
          fromdate: selectdt, todate: selectdt1);
    }
  }
  
  _showDatePicker1(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        builder: ((context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: kblue,
                onPrimary: Colors.white,
                onSurface: Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 42, 59, 158),
                ),
              ),
            ),
            child: child!,
          );
        }));

    if (picked != null) {
      setState(() {
        date = picked;
        selectdt1 = formatDate(date.add(const Duration(days: 1)), [
          yyyy,
          "-",
          mm,
          "-",
          dd,
        ]);
      });
      serviceController.dateFilterBooking(
          fromdate: selectdt, todate: selectdt1);
    }
  }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    serviceController.getBooking();
    serviceController.update();
    serviceController.dateFilterBooking(fromdate: selectdt, todate: selectdt1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BusinessCommonScreen(),
              BusinessCommonhomeContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),
          body: ListView(
            children: [
              Column(
                children: [
                  
                     Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset('assets/images/businessbookingimage.png',
                              fit: BoxFit.cover,)),
                              Container(
                                height: 100,
                              )
                          ],
                        ),
                        Positioned(
                          top:0,
                          left:0,
                          right:0,
                          bottom:50,
                          child: Center(
                            child: Text('Bookings',
                               style: displayfont,
                                                      
                            ),
                          )),
                          Positioned(
                            top: 210,
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width*0.25,
                             decoration: BoxDecoration(
                            color: kblue,
                            border: Border.all(
                              color: kwhite
                            ),
                            borderRadius: BorderRadius.circular(5)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "From Date  :",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Text(selectdt,
                                   style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                  ),
                                ),
                                InkWell(
                                   onTap: () {
                                  _showDatePicker(context);
                                },
                                  child: const Icon(Icons.date_range,
                                  color: Colors.white,)),
                              ],
                            ),
                          ),
                          ksizedbox10,
                          Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width*0.25,

                            decoration: BoxDecoration(
                            color: kblue,
                            border: Border.all(
                              color: kwhite
                            ),
                            borderRadius: BorderRadius.circular(5)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "To Date  :",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                               
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Text(selectdt1,
                                  style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                InkWell(
                                   onTap: () {
                                  _showDatePicker1(context);
                                },
                                  child: const Icon(Icons.date_range,
                                  color: Colors.white,)),
                              ],
                            ),
                          ),

                          // Center(
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(),
                          //     child: Text(formatDate(_dateTime, [M,',',yyyy,  ],),style: TextStyle(color: kwhite,fontSize: 18) ,),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 5),
                          //   child: CalenderPicker(
                          //     DateTime.now().subtract(Duration(days: 50)),
                          //     initialSelectedDate: DateTime.now(),
                          //     selectionColor: kOrange,
                          //     selectedTextColor: kblue,
                          //     onDateChange: (date) {
                          //       setState(() {
                          //         _dateTime = date;
                          //         serviceController.dateFilterBooking(
                          //         fromdate: _dateTime.toString(),
                          //          todate: DateTime(_dateTime.year,_dateTime.month,_dateTime.day +1).toString(),
                          //            );
                          //       });
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                            ],
                          ))
                      ],
                    ),
                    ksizedbox40,
                     GetBuilder<BusinessServiceController>(builder: (_) {
                      return serviceController.bookingListData.isEmpty
                ?  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                       Image.asset("assets/images/businessnobookingimage.png",
                       height: 300,fit: BoxFit.fitHeight,
                       ),
                       ksizedbox30,
                       Text('No Booking History',
                       style: TextStyle(
                        fontSize: 20,
                        color: kblue,
                        fontWeight: FontWeight.w700
                       ),)]),
                  )
                : GridView.builder(
                    itemCount: serviceController.bookingListData.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                               Get.to(BusinessBookingDetailsScreen(
                                amt: serviceController.bookingListData[index].purchasePrice, 
                                cusName: serviceController.bookingListData[index].user.name, 
                                des: serviceController.bookingListData[index].description, 
                                email: serviceController.bookingListData[index].user.email, 
                                img: serviceController.bookingListData[index].image, 
                                mobile: serviceController.bookingListData[index].user.mobile, 
                                qty: serviceController.bookingListData[index].quantity, 
                                tit: serviceController.bookingListData[index].service));
                                // dialogBuilder(
                                //     context,
                                //     serviceController.bookingListData[index].image,
                                //     serviceController
                                //         .bookingListData[index].service,
                                //     serviceController
                                //         .bookingListData[index].description,
                                //     serviceController
                                //         .bookingListData[index].purchasePrice,
                                //     serviceController
                                //         .bookingListData[index].quantity,
                                //     serviceController
                                //         .bookingListData[index].user.name,
                                //     serviceController
                                //         .bookingListData[index].user.mobile,
                                //     serviceController
                                //         .bookingListData[index].user.email);
                              },
                              child: Container(
                                height: 140,
                                width: MediaQuery.of(context).size.width*0.35,
                               
                                decoration: BoxDecoration(
                                         color: Colors.white,
                                         boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            offset: Offset(0.0, 0.75),
                                            blurRadius: 5,
                                            color: kgrey
                                          )
                                         ],
                                         borderRadius: BorderRadius.circular(5)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 150,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            left: 5,
                                            right: 10,
                                            bottom: 10),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image.network(
                                              serviceController
                                                  .bookingListData[index].image,
                                              fit: BoxFit.cover,
                                            )),
                                        // child: Image.asset(
                                        //   bookingimage[index],
                                        //   fit: BoxFit.contain,
                                        // ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            serviceController
                                                .bookingListData[index].service,
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                                color: kblue),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 6),
                                            child: Container(
                                              width: 210,
                                              child: Text(
                                                serviceController
                                                    .bookingListData[index]
                                                    .description,
                                                maxLines: 5,
                                                style: TextStyle(
                                                    fontSize: 12, color: kgrey),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3.5),);
      }),
                    
                ],
              ),
                 ksizedbox30,
            RegisterCommonBottom()
            ],
          ),
    );
  }
  
  Future<void> dialogBuilder(
      BuildContext context,
      String img,
      String tit,
      String des,
      String amt,
      String qty,
      String cusName,
      String mobile, 
      String email
      ) {
    return showDialog<void>(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          content: SizedBox(
            height: 500,
            width: 1000,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kblue,
                          size: 15,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Booking Details',
                      style: TextStyle(
                          fontSize: 18,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ksizedbox10,
                Row(
                  children: [
                    Image.network(
                      img,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                ksizedbox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Name',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 90,
                      child: Text(
                        tit,
                        style: TextStyle(
                            fontSize: 15,
                            color: kgrey,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                //  Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //    children: [
                //    Text(
                //       'Date',
                //       style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                // ),
                //      Container(
                //          width: 90,
                //        child: Text(
                //         date,
                //         style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                //                            ),
                //      ),
                //    ],
                //  ),

                //  Divider(thickness: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Customer Name',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 90,
                      child: Text(
                        cusName,
                        style: TextStyle(
                            fontSize: 15,
                            color: kgrey,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                //  Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       width: 150,
                //       child: Text('Status',
                //         style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //     Container(
                //       width: 90,
                //       child: Text(sts,
                //         style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),),
                //     )
                //   ],
                //  ),
                //  Divider(thickness: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 90,
                      child: Text(
                        qty,
                        style: TextStyle(
                            fontSize: 15,
                            color: kgrey,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 90,
                      child: Text(
                        "₹ ${amt}",
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mobile Number',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 90,
                      child: Text(
                        mobile,
                        style: TextStyle(
                            fontSize: 15,
                            color: kgrey,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Email Addres",
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 96,
                      child: Text(
                        email,
                        style: TextStyle(
                            fontSize: 15,
                            color: kgrey,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          insetPadding: const EdgeInsets.all(10),
        );
      },
    );
  }
}