import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/holiday_package_controller.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../controller/auth_controller/auth_profile_controller.dart';
import '../../../../controller/holiday_controller.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';

class HolidaysScreen extends StatefulWidget {
  String packageId;
  //GetPackageDetailsData getPackageDetailsData;
  HolidaysScreen({super.key, required this.packageId});

  @override
  State<HolidaysScreen> createState() => _HolidaysScreenState();
}

class _HolidaysScreenState extends State<HolidaysScreen> {
  var packagenameController = TextEditingController();

  final holidaycontroller = Get.find<HolidayController>();
  final holiday2controller = Get.find<Holiday2Controller>();
  final holiday3controller = Get.find<Holiday3Controller>();

  final holidayPackageController = Get.find<HolidayPackageController>();
  final profileController = Get.find<AuthProfileController>();

  final cityOfDepController = TextEditingController();
  final dateOfDepController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDefault();
  }

  setDefault() async {
    await profileController.getProfile();
    await holidayPackageController.packageDetails(packageid: widget.packageId);
    holidayPackageController.adult(1);
    holidayPackageController.child(0);
    holidayPackageController.infant(0);
    packagenameController.text =
        holidayPackageController.getPackageDetailsData.first.title;
    //  await profileController.getProfile();
    //   print("--------------------->>${profileController.profileData}");
    //   nameController.text = profileController.profileData.first.name;
    // emailController.text = profileController.profileData.first.email;
  }

  DateTime date = DateTime.now();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime.now(),
      locale: const Locale('en', 'IN'),
      lastDate: DateTime.now().add(const Duration(days: 6570)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kblue, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: kblue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null)
      setState(() {
        date = picked;
        dateOfDepController.text = formatDate(date, [dd, "/", mm, "/", yyyy]);
      });
  }

  int holidayindex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: GetBuilder<HolidayPackageController>(
          builder: (_) {
            return holidayPackageController.getPackageDetailsData.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/Group 40449.png',
                            height: 500,
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      RegisterCommonContainer(),
                      Container(
                        height: 500,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/5545.png',
                              width: size.width,
                            ),
                            Positioned(
                                bottom: 180,
                                top: 0,
                                left: 0,
                                right: 0,
                                // top: 0,
                                child: Center(
                                    child: Text(
                                            'Turn Your Dream Holiday\n Into A Reality')
                                        .text
                                        .bold
                                        .xl6
                                        .white
                                        .make())),
                            Positioned(
                              top: 360,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, top: 0),
                                child: Container(
                                  height: 100,
                                  child: Container(
                                    height: 95,
                                    width: MediaQuery.of(context).size.width *
                                        0.94,
                                    decoration: BoxDecoration(
                                      color: kwhite,
                                      border: Border.all(
                                        color: kOrange, // Border color
                                        width: 2.0, // Border width
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            holidayPackageController
                                                .getPackageDetailsData
                                                .first
                                                .title,
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Text(
                                                  'Starting From',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 19.5),
                                                ),
                                              ),
                                              holidayPackageController
                                                      .getPackageDetailsData
                                                      .isEmpty
                                                  ? Text('')
                                                  : Text(
                                                      '₹${holidayPackageController.getPackageDetailsData.first.amount}',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Text(
                                                  'Per Person On Twin Sharing',
                                                  style:
                                                      TextStyle(fontSize: 13.5),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    //child: YourChildWidget(),  // Replace with your actual child widget
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 50, top: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width *
                                        0.57,
                                    decoration: BoxDecoration(color: kOrange),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        holidayindex = 0;
                                                      });
                                                    },
                                                    child: Text(
                                                      'OVERVIEW',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: kwhite),
                                                    )),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        holidayindex = 1;
                                                      });
                                                    },
                                                    child: Text(
                                                      'HOTEL DETAILS',
                                                      style: TextStyle(
                                                          color: kwhite),
                                                    )),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        holidayindex = 2;
                                                      });
                                                    },
                                                    child: Text(
                                                        'DAY WISE ITINERARY',
                                                        style: TextStyle(
                                                            color: kwhite))),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        holidayindex = 3;
                                                      });
                                                    },
                                                    child: Text(
                                                      'ADDITIONAL INFO',
                                                      style: TextStyle(
                                                          color: kwhite),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, top: 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 6),
                                                child: Container(
                                                  height: 2,
                                                  width: 68,
                                                  color: holidayindex == 0
                                                      ? kwhite
                                                      : kOrange,
                                                ),
                                              ),
                                              Container(
                                                height: 2,
                                                width: 100,
                                                color: holidayindex == 1
                                                    ? kwhite
                                                    : kOrange,
                                              ),
                                              Container(
                                                height: 2,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                color: holidayindex == 2
                                                    ? kwhite
                                                    : kOrange,
                                              ),
                                              Container(
                                                height: 2,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                color: holidayindex == 3
                                                    ? kwhite
                                                    : kOrange,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (holidayindex == 0)
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.57,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: holidayPackageController
                                                  .getPackageDetailsData.isEmpty
                                              ? Image.asset(
                                                  'assets/images/overviewimage.png')
                                              : Image.network(
                                                  holidayPackageController
                                                      .getPackageDetailsData
                                                      .first
                                                      .image),
                                        ),
                                        ksizedbox10,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: holidayPackageController
                                                      .getPackageDetailsData
                                                      .isEmpty
                                                  ? Text('No Data')
                                                  : Text(
                                                      holidayPackageController
                                                          .getPackageDetailsData
                                                          .first
                                                          .title,
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.33,
                                                child: Divider(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        // if (holidayPackageController.getPackageDetailsData
                                        //     .first.packageoverview.isNotEmpty)
                                        if (holidayPackageController
                                            .getPackageDetailsData
                                            .first
                                            .packageoverview
                                            .isNotEmpty)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              for (int i = 0;
                                                  i <
                                                      holidayPackageController
                                                          .getPackageDetailsData
                                                          .first
                                                          .includes
                                                          .length;
                                                  i++)
                                                Row(
                                                  children: [
                                                    Icon(Icons
                                                        .arrow_right_rounded),
                                                    Text(
                                                      holidayPackageController
                                                          .getPackageDetailsData
                                                          .first
                                                          .includes[i]
                                                          .value,
                                                      style:
                                                          primaryFont.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  ],
                                                )
                                            ],
                                          ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
                                        //   child: Column(
                                        //     children: [
                                        //       holidayPackageController.getPackageDetailsData.isEmpty?Text('No Data'):
                                        //       Text(holidayPackageController.getPackageDetailsData.first.description,
                                        //       maxLines: 5,)
                                        //     ],
                                        //   ),
                                        // ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(left: 10,top: 17),
                                        //   child: Row(
                                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       holidayPackageController.getPackageDetailsData.isEmpty?Text('No Data'):
                                        //       Text(holidayPackageController.getPackageDetailsData.first.description,
                                        //       style: TextStyle(
                                        //         fontSize: 17,
                                        //         fontWeight: FontWeight.w600
                                        //       ),),
                                        //       Padding(
                                        //         padding: const EdgeInsets.only(left: 32),
                                        //         child: Container(
                                        //           width: MediaQuery.of(context).size.width*0.34,
                                        //           child: Divider(
                                        //             color: Colors.black,
                                        //           ),
                                        //         ),
                                        //       )
                                        //     ],
                                        //   ),
                                        // ),

                                        // Padding(
                                        //   padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                                        //   child: Container(
                                        //     height: 125,
                                        //     width: MediaQuery.of(context).size.width,
                                        //     decoration: BoxDecoration(
                                        //        color: kwhite,
                                        //        border: Border.all(
                                        //         color: Colors.black
                                        //        )
                                        //     ),
                                        //     child: Column(
                                        //       mainAxisAlignment: MainAxisAlignment.start,
                                        //       children: [
                                        //         Container(
                                        //           height: 45,
                                        //           width: MediaQuery.of(context).size.width*0.6,
                                        //           color: kyellow,
                                        //           child: Row(

                                        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        //             children: [
                                        //               Container(
                                        //                 width: 100,
                                        //                 child: Text('Sector',
                                        //                 style: TextStyle(
                                        //                   fontSize: 15,
                                        //                   color: kwhite,
                                        //                   fontWeight: FontWeight.w600
                                        //                 ),),
                                        //               ),
                                        //               Container(
                                        //                 width: 100,
                                        //                 child: Text('Airline',
                                        //                 style: TextStyle(
                                        //                   fontSize: 15,
                                        //                   fontWeight: FontWeight.w600,
                                        //                   color: kwhite
                                        //                 ),),
                                        //               ),
                                        //               Container(
                                        //                 width: 150,
                                        //                 child: Text('Departure Time',
                                        //                 style: TextStyle(
                                        //                   fontSize: 15,
                                        //                   color: kwhite,
                                        //                   fontWeight: FontWeight.w600
                                        //                 ),),
                                        //               ),
                                        //               Container(
                                        //                 width: 100,
                                        //                 child: Text('Arrival Time',
                                        //                 style: TextStyle(
                                        //                   fontSize: 15,
                                        //                   color: kwhite,
                                        //                   fontWeight: FontWeight.w600
                                        //                 ),),
                                        //               )
                                        //             ],
                                        //           ),
                                        //         ),
                                        //         ksizedbox10,
                                        //         Container(
                                        //            width: MediaQuery.of(context).size.width*0.6,
                                        //           child: Row(

                                        //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        //               children: [
                                        //                 Container(
                                        //                   width: 100,
                                        //                   child: Text('DEL-MRU',
                                        //                   style: TextStyle(
                                        //                     fontSize: 15,

                                        //                     fontWeight: FontWeight.w600
                                        //                   ),),
                                        //                 ),
                                        //                 Container(
                                        //                   width: 100,
                                        //                   child: Text('MK745',
                                        //                   style: TextStyle(
                                        //                     fontSize: 15,
                                        //                     fontWeight: FontWeight.w600,

                                        //                   ),),
                                        //                 ),
                                        //                 Container(
                                        //                   width: 150,
                                        //                   child: Text('08:00',
                                        //                   style: TextStyle(
                                        //                     fontSize: 15,

                                        //                     fontWeight: FontWeight.w600
                                        //                   ),),
                                        //                 ),
                                        //                 Container(
                                        //                   width: 100,
                                        //                   child: Text('14:00',
                                        //                   style: TextStyle(
                                        //                     fontSize: 15,

                                        //                     fontWeight: FontWeight.w600
                                        //                   ),),
                                        //                 )
                                        //               ],
                                        //             ),
                                        //         ),
                                        //         Divider(
                                        //          color: Colors.black,

                                        //         ),
                                        //         ksizedbox10,
                                        //         Container(
                                        //            width: MediaQuery.of(context).size.width*0.6,
                                        //           child: Row(

                                        //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        //               children: [
                                        //                 Container(
                                        //                   width: 100,
                                        //                   child: Text('DEL-MRU',
                                        //                   style: TextStyle(
                                        //                     fontSize: 15,

                                        //                     fontWeight: FontWeight.w600
                                        //                   ),),
                                        //                 ),
                                        //                 Container(
                                        //                   width: 100,
                                        //                   child: Text('MK745',
                                        //                   style: TextStyle(
                                        //                     fontSize: 15,
                                        //                     fontWeight: FontWeight.w600,

                                        //                   ),),
                                        //                 ),
                                        //                 Container(
                                        //                   width: 150,
                                        //                   child: Text('08:00',
                                        //                   style: TextStyle(
                                        //                     fontSize: 15,

                                        //                     fontWeight: FontWeight.w600
                                        //                   ),),
                                        //                 ),
                                        //                 Container(
                                        //                   width: 100,
                                        //                   child: Text('14:00',
                                        //                   style: TextStyle(
                                        //                     fontSize: 15,

                                        //                     fontWeight: FontWeight.w600
                                        //                   ),),
                                        //                 ),

                                        //               ],
                                        //             ),
                                        //         ),

                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),

                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 17),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Inclusions',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 6),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.353,
                                                        child: Divider(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              ksizedbox10,
                                              holidayPackageController
                                                      .getPackageDetailsData
                                                      .isEmpty
                                                  ? Text('')
                                                  : HtmlContentViewer(
                                                      htmlContent:
                                                          holidayPackageController
                                                              .getPackageDetailsData
                                                              .first
                                                              .inclusion,
                                                      initialContentHeight:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                      initialContentWidth:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                    ),
                                              //Text('◈${holidayPackageController.getPackageDetailsData.first.inclusion}'),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 17),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Exclusions',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 6),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.353,
                                                  child: Divider(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        //if(holidayPackageController.getPackageDetailsData.first.packageoverview.isNotEmpty)
                                        holidayPackageController
                                                .getPackageDetailsData.isEmpty
                                            ? Text('')
                                            : HtmlContentViewer(
                                                htmlContent:
                                                    holidayPackageController
                                                        .getPackageDetailsData
                                                        .first
                                                        .exclusion,
                                                initialContentHeight:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                initialContentWidth:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                              ),
                                        //  Padding(
                                        //    padding: const EdgeInsets.only(left: 10,top: 10),
                                        //    child: Text('◈${holidayPackageController.getPackageDetailsData.first.exclusion} '),
                                        //  )
                                      ],
                                    ),
                                  ),
                                if (holidayindex == 1)
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.57,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: holidayPackageController
                                                  .getPackageDetailsData.isEmpty
                                              ? Image.asset(
                                                  'assets/images/munnar1.jpg')
                                              : Image.network(
                                                  holidayPackageController
                                                      .getPackageDetailsData
                                                      .first
                                                      .image),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 17),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Hotel Details',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.33,
                                                  child: Divider(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        ksizedbox10,
                                        holidayPackageController
                                                .getPackageDetailsData.isEmpty
                                            ? Center(
                                                child: Image.asset(
                                                    'assets/icons/Group 40449.png'))
                                            : HtmlContentViewer(
                                                htmlContent:
                                                    holidayPackageController
                                                        .getPackageDetailsData
                                                        .first
                                                        .description,
                                                initialContentHeight:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                initialContentWidth:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                              ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(left: 10,top: 10),
                                        //   child: Row(
                                        //     children: [
                                        //       Text('Property Location:',
                                        //       style: TextStyle(
                                        //         fontWeight: FontWeight.bold
                                        //       ),),
                                        //     ],
                                        //   ),
                                        // ),

                                        // Padding(
                                        //   padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                        //   child: Column(
                                        //     children: [
                                        //       Text('When you stay at Villas Mon Plaisir in Pointe Aux Piments, you"ll be on the beach,a 5-minute drive from Turtle Bay and 7 minutes from Trou aux Biches Beach.This beach hotel is 7.1 mi (11.4 km) from Grand Bay Beach and 8.9 mi (14.3 km) from Pereybere Beach',
                                        //       style: TextStyle(
                                        //         fontSize: 14,
                                        //         fontWeight: FontWeight.w400,
                                        //         height: 1.8 ),),

                                        //     ],
                                        //   ),
                                        // ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(left: 10,top: 20),
                                        //   child: Row(
                                        //     children: [
                                        //       Text('Rooms:',
                                        //       style: TextStyle(
                                        //         fontWeight: FontWeight.bold
                                        //       ),),
                                        //     ],
                                        //   ),
                                        // ),
                                        //     Padding(
                                        //   padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                        //   child: Column(
                                        //     children: [
                                        //       Text('Make yourself at home in one of the 48 air-conditioned rooms featuring refrigerators and plasma televisions. Rooms have private balconies. Complimentary wireless Internet access keeps you connected, and satellite programming is available for your entertainment. Private bathrooms with showers feature complimentary toiletries and hair dryers',
                                        //       style: TextStyle(
                                        //         fontSize: 14,
                                        //         fontWeight: FontWeight.w400,
                                        //         height: 1.8 ),),

                                        //     ],
                                        //   ),
                                        // ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(left: 10,top: 20),
                                        //   child: Row(
                                        //     children: [
                                        //       Text('Amenities: ',
                                        //       style: TextStyle(
                                        //         fontWeight: FontWeight.bold
                                        //       ),),
                                        //     ],
                                        //   ),
                                        // ),
                                        //    Padding(
                                        //   padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                        //   child: Column(
                                        //     children: [
                                        //       Text('Pamper yourself with a visit to the spa, which offers massages, body treatments, and facials. Additional features at this hotel include complimentary wireless Internet access,tour/ticket assistance, and barbecue grills.',
                                        //       style: TextStyle(
                                        //         fontSize: 14,
                                        //         fontWeight: FontWeight.w400,
                                        //         height: 1.8 ),),

                                        //     ],
                                        //   ),
                                        // ),
                                        //  Padding(
                                        //     padding: const EdgeInsets.only(left: 10,top: 20),
                                        //     child: Row(
                                        //       children: [
                                        //         Text('Dining:',
                                        //         style: TextStyle(
                                        //           fontWeight: FontWeight.bold
                                        //         ),),
                                        //       ],
                                        //     ),
                                        //   ),
                                        //    Padding(
                                        //   padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                        //   child: Column(
                                        //     children: [
                                        //       Text('Grab a bite at one of the hotel"s 2 restaurants, or stay in and take advantage of the room service (during limited hours). Quench your thirst with your favorite drink at the bar/lounge',
                                        //       style: TextStyle(
                                        //         fontSize: 14,
                                        //         fontWeight: FontWeight.w400,
                                        //         height: 1.8 ),),

                                        //     ],
                                        //   ),
                                        // ),
                                        // Padding(
                                        //     padding: const EdgeInsets.only(left: 10,top: 20),
                                        //     child: Row(
                                        //       children: [
                                        //         Text('Business, Other Amenities:',
                                        //         style: TextStyle(
                                        //           fontWeight: FontWeight.bold
                                        //         ),),
                                        //       ],
                                        //     ),
                                        //   ),
                                        //    Padding(
                                        //   padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                        //   child: Column(
                                        //     children: [
                                        //       Text('Featured amenities include complimentary newspapers in the lobby, dry cleaning/laundry services, and a 24-hour front desk. A roundtrip airport shuttle is provided for a surcharge (available 24 hours), and free self parking is available onsite',
                                        //       style: TextStyle(
                                        //         fontSize: 14,
                                        //         fontWeight: FontWeight.w400,
                                        //         height: 1.8 ),),

                                        //     ],
                                        //   ),
                                        // ),
                                      ])),
                                if (holidayindex == 2)
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.57,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Column(children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: holidayPackageController
                                                    .getPackageDetailsData
                                                    .isEmpty
                                                ? Image.asset(
                                                    'assets/images/munnar2.jpg')
                                                : Image.network(
                                                    holidayPackageController
                                                        .getPackageDetailsData
                                                        .first
                                                        .image)),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 17),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Day Wise Itineary',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.31,
                                                  child: Divider(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        ksizedbox20,
                                        holidayPackageController
                                                .getPackageDetailsData.isEmpty
                                            ? const Center(
                                                child: Text("No Data Found"),
                                              )
                                            : HtmlContentViewer(
                                                htmlContent:
                                                    holidayPackageController
                                                        .getPackageDetailsData
                                                        .first
                                                        .dayWiseItinerary,
                                                initialContentHeight:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                initialContentWidth:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                              ),
                                      ])),
                                if (holidayindex == 3)
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.57,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Column(children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: holidayPackageController
                                                    .getPackageDetailsData
                                                    .isEmpty
                                                ? Image.asset(
                                                    'assets/images/munnar3.jpg')
                                                : Image.network(
                                                    holidayPackageController
                                                        .getPackageDetailsData
                                                        .first
                                                        .image)),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 17),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Additinal Information',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 33),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.283,
                                                  child: Divider(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),

                                        // if (holidayPackageController.getPackageDetailsData
                                        //     .first.packageoverview.isNotEmpty)
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        if (holidayPackageController
                                            .getPackageDetailsData
                                            .first
                                            .packageoverview
                                            .isNotEmpty)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              for (int i = 0;
                                                  i <
                                                      holidayPackageController
                                                          .getPackageDetailsData
                                                          .first
                                                          .includes
                                                          .length;
                                                  i++)
                                                Row(
                                                  children: [
                                                    Icon(Icons
                                                        .arrow_right_rounded),
                                                    Text(
                                                      holidayPackageController
                                                          .getPackageDetailsData
                                                          .first
                                                          .includes[i]
                                                          .value,
                                                      style:
                                                          primaryFont.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  ],
                                                )
                                            ],
                                          )
                                      ]))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(color: kOrange),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Want to go for a memorable holidays?',
                                          style: TextStyle(
                                              color: kwhite, fontSize: 18.5),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: Text(
                                            'Provide your details to know best holidays deals',
                                            style: TextStyle(
                                                color: kwhite, fontSize: 14),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 830,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    color: kwhite,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 15),
                                          child: Text(
                                            'Package Name',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        ksizedbox10,
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Container(
                                            height: 45,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: TextField(
                                              controller: packagenameController,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder()),
                                            ),
                                          ),
                                        ),
                                        ksizedbox10,
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 15),
                                          child: Text(
                                            'City of Departure',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        ksizedbox10,
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Container(
                                            height: 45,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: TextField(
                                              controller: cityOfDepController,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder()),
                                            ),
                                          ),
                                        ),
                                        ksizedbox10,
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 15),
                                          child: InkWell(
                                            child: Text(
                                              'Date of Departure',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                        ksizedbox10,
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Container(
                                            height: 45,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: TextField(
                                              controller: dateOfDepController,
                                              onTap: () {
                                                _selectDate(context);
                                              },
                                              decoration: InputDecoration(
                                                isDense: true,
                                                border: OutlineInputBorder(),
                                                hintText:
                                                    dateOfDepController.text,
                                                hintStyle: TextStyle(
                                                  color: Color(0xff6E6D6E),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ksizedbox20,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Adult'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Container(
                                                    height: 30,
                                                    width: 105,
                                                    decoration: BoxDecoration(
                                                        color: kwhite,
                                                        boxShadow: <BoxShadow>[
                                                          BoxShadow(
                                                              offset: Offset(
                                                                  0.0, 0.75),
                                                              blurRadius: 1,
                                                              color: kgrey)
                                                        ]),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      //crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 10),
                                                          child: IconButton(
                                                            onPressed: () {
                                                              if (holidaycontroller
                                                                      .cout ==
                                                                  1)
                                                                holidaycontroller
                                                                    .decrement();
                                                              holidaycontroller
                                                                  .update();
                                                            },
                                                            icon: Icon(
                                                              Icons.remove,
                                                              size: 14,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 50,
                                                          width: 22,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color:
                                                                      korange),
                                                          child: Center(
                                                            child: Obx(
                                                              () => Text(
                                                                  '${holidaycontroller.cout.value}'),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 10),
                                                          child: IconButton(
                                                              onPressed: () {
                                                                holidaycontroller
                                                                    .increament();
                                                                holidaycontroller
                                                                    .update();
                                                              },
                                                              icon: Icon(
                                                                Icons.add,
                                                                size: 14,
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Child '),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Container(
                                                    height: 30,
                                                    width: 105,
                                                    decoration: BoxDecoration(
                                                        color: kwhite,
                                                        boxShadow: <BoxShadow>[
                                                          BoxShadow(
                                                              offset: Offset(
                                                                  0.0, 0.75),
                                                              blurRadius: 1,
                                                              color: kgrey)
                                                        ]),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      //crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 10),
                                                          child: IconButton(
                                                              onPressed: () {
                                                                if (holiday2controller
                                                                        .cout! ==
                                                                    1)
                                                                  holiday2controller
                                                                      .decrement();
                                                                holiday2controller
                                                                    .update();
                                                              },
                                                              icon: Icon(
                                                                Icons.remove,
                                                                size: 14,
                                                              )),
                                                        ),
                                                        Container(
                                                          height: 50,
                                                          width: 22,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color:
                                                                      korange),
                                                          child: Center(
                                                            child: Obx(() => Text(
                                                                '${holiday2controller.cout.value}')),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 10),
                                                          child: IconButton(
                                                              onPressed: () {
                                                                holiday2controller
                                                                    .increament();
                                                                holiday2controller
                                                                    .update();
                                                              },
                                                              icon: Icon(
                                                                Icons.add,
                                                                size: 14,
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Infant'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Container(
                                                    height: 30,
                                                    width: 105,
                                                    decoration: BoxDecoration(
                                                        color: kwhite,
                                                        boxShadow: <BoxShadow>[
                                                          BoxShadow(
                                                              offset: Offset(
                                                                  0.0, 0.75),
                                                              blurRadius: 1,
                                                              color: kgrey)
                                                        ]),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      //crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            if (holiday3controller
                                                                    .cout! ==
                                                                1)
                                                              holiday3controller
                                                                  .decrement();
                                                            holiday3controller
                                                                .update();
                                                          },
                                                          icon: Icon(
                                                            Icons.remove,
                                                            size: 14,
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 50,
                                                          width: 22,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color:
                                                                      korange),
                                                          child: Center(
                                                            child: Obx(() => Text(
                                                                '${holiday3controller.cout.value}')),
                                                          ),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              holiday3controller
                                                                  .increament();
                                                              holiday3controller
                                                                  .update();
                                                            },
                                                            icon: Icon(
                                                              Icons.add,
                                                              size: 14,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        ksizedbox10,
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Contact Details',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 10),
                                          child: Container(
                                            height: 45,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: TextField(
                                              controller: nameController,
                                              decoration: InputDecoration(
                                                  hintText: 'Your Name',
                                                  border: OutlineInputBorder()),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 10),
                                          child: Container(
                                            height: 45,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: TextField(
                                              controller: emailController,
                                              decoration: InputDecoration(
                                                  hintText: 'Email',
                                                  border: OutlineInputBorder()),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 10),
                                          child: Container(
                                            height: 45,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: TextField(
                                              controller: mobileController,
                                              decoration: InputDecoration(
                                                  hintText: 'Phone Number',
                                                  border: OutlineInputBorder()),
                                            ),
                                          ),
                                        ),
                                        ksizedbox20,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                print(
                                                    "---------testing enquiry--------------");
                                                print(widget.packageId);
                                                print(cityOfDepController.text);
                                                print(dateOfDepController.text);
                                                print(nameController.text);
                                                print(emailController.text);
                                                print(mobileController.text);
                                                if (emailController
                                                    .text.isEmail) {
                                                  holidayPackageController
                                                      .createEnquiry(
                                                    packageid: widget.packageId,
                                                    cityofdeparture:
                                                        cityOfDepController
                                                            .text,
                                                    dateofdeparture:
                                                        dateOfDepController
                                                            .text,
                                                    adultcount:
                                                        holidayPackageController
                                                            .adult.value
                                                            .toString(),
                                                    childcount:
                                                        holidayPackageController
                                                            .child.value
                                                            .toString(),
                                                    infantcount:
                                                        holidayPackageController
                                                            .infant.value
                                                            .toString(),
                                                    name: nameController.text,
                                                    email: emailController.text,
                                                    mobile:
                                                        mobileController.text,
                                                    status: "pending",
                                                  );
                                                } else {
                                                  Get.rawSnackbar(
                                                      message:
                                                          "Enter a valid email id",
                                                      backgroundColor:
                                                          Colors.red);
                                                }
                                              },
                                              child: Container(
                                                  height: 45,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: korange),
                                                  child: Center(
                                                      child: Text('Send Query',
                                                          style: TextStyle(
                                                              color: kwhite)))),
                                            )
                                          ],
                                        ),
                                        ksizedbox10,
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              Icon(Icons.schedule,
                                                  color: korange),
                                              Text(
                                                  'Duration :6 Nights & 7 Days')
                                            ],
                                          ),
                                        ),
                                        ksizedbox10,
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              Icon(Icons.add_location,
                                                  color: korange),
                                              Text(
                                                  'Places to Visit :06N Mauritius')
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, left: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Packages Include',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(Icons.flight_sharp,
                                                  color: kgrey),
                                              Icon(Icons.hotel, color: kgrey),
                                              Icon(Icons.explore, color: kgrey),
                                              Icon(Icons.car_crash,
                                                  color: kgrey),
                                              Icon(Icons.set_meal,
                                                  color: kgrey),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('Flight',
                                                  style:
                                                      TextStyle(color: kgrey)),
                                              Text(
                                                'Hotel',
                                                style: TextStyle(color: kgrey),
                                              ),
                                              Text(
                                                'Sightseeing',
                                                style: TextStyle(color: kgrey),
                                              ),
                                              Text(
                                                'Car',
                                                style: TextStyle(color: kgrey),
                                              ),
                                              Text('Meals',
                                                  style:
                                                      TextStyle(color: kgrey))
                                            ],
                                          ),
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
                      ksizedbox40,
                      RegisterCommonBottom()
                    ],
                  );
          },
        ),
      ),
    );
  }
}
