import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/service_controller/home_controller.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class RespoBusinessBookings extends StatefulWidget {
  const RespoBusinessBookings({super.key});

  @override
  State<RespoBusinessBookings> createState() => _RespoBusinessBookingsState();
}

class _RespoBusinessBookingsState extends State<RespoBusinessBookings> {
  final serviceController = Get.find<HomeServiceController>();




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

  DateTime dateTime1 = DateTime(2100);







  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: PreferredSize(
        child: AppBarMob(),
        preferredSize: Size(double.infinity, 40),
      ),
      drawer: DrawerBusiness(),





      body: Column(
        children: [ Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "From Date:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _showDatePicker(context);
                            },
                            child: Container(
                              height: 35,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(selectdt),
                                  const Icon(Icons.edit_calendar)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      ksizedbox10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "To Date:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _showDatePicker1(context);
                            },
                            child: Container(
                              height: 35,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(selectdt1),
                                  const Icon(Icons.edit_calendar)
                                ],
                              ),
                            ),
                          ),
                        ],
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
                ),
              ),
          GetBuilder<HomeServiceController>(builder: (_) {
            return serviceController.bookingListData.isEmpty
                ? Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/noBooking.png",
                            height: 250,
                            fit: BoxFit.fitHeight,
                          ),
                          ksizedbox20,
                          Text(
                            'No Booking History',
                            style: TextStyle(
                                fontSize: 16,
                                color: kblue,
                                fontWeight: FontWeight.w700),
                          )
                        ]),
                  )
                : ListView.builder(
                    itemCount: serviceController.bookingListData.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                dialogBuilder(
                                    context,
                                    serviceController.bookingListData[index].image,
                                    serviceController
                                        .bookingListData[index].service,
                                    serviceController
                                        .bookingListData[index].description,
                                    serviceController
                                        .bookingListData[index].purchasePrice,
                                    serviceController
                                        .bookingListData[index].quantity,
                                    serviceController
                                        .bookingListData[index].user.name,
                                    serviceController
                                        .bookingListData[index].user.mobile,
                                    serviceController
                                        .bookingListData[index].user.email);
                              },
                              child: Container(
                                height: 140,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Row(
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
                    });
          }),
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
      String email) {
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
