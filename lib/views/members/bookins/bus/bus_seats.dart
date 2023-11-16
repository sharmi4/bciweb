import 'package:bciweb/models/busbookingmodels/search_bus_model.dart';
import 'package:bciweb/views/members/bookins/bus/passengers_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../constant/constans.dart';
import '../../../../controller/auth_controller/auth_profile_controller.dart';
import '../../../../controller/bus_controllers.dart';

import '../../../../models/busbookingmodels/bus_contact_details_model.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../common_widget/common.dart';
import 'dart:math' as math;

class BusSeats extends StatefulWidget {
  Bus busData;
  String boardingId;
  String dropingId;
  String searchkey;
  BusSeats({
    super.key,
    required this.busData,
    required this.boardingId,
    required this.dropingId,
    required this.searchkey,
  });

  @override
  State<BusSeats> createState() => _BusSeatsState();
}

class _BusSeatsState extends State<BusSeats> {
  final busController = Get.find<BusController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.getProfile();
    busController.busSeat(
        boardingId: widget.boardingId,
        droppingId: widget.dropingId,
        busData: widget.busData,
        searchKey: widget.searchkey);
  }

  final profileController = Get.find<AuthProfileController>();
  List<String> seatIds = [];
  List<BusContactDetailsModel> busContactDetailsModel = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
          child: Column(
        children: [
          RegisterCommonContainer(),
          ksizedbox10,
          Container(
            width: size.width * 0.8,
            // height: size.height * 0.9,
            decoration: BoxDecoration(
              color: kwhite,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 198, 198, 198)
                      .withOpacity(0.3), // Shadow color
                  spreadRadius: 1, // The spread radius of the shadow
                  blurRadius: 5, // The blur radius of the shadow
                  offset: Offset(0, 3), // The offset of the shadow
                ),
              ],
              border: Border.all(
                color: Colors.grey, // Border color
                width: 0.2, // Border width
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ksizedbox20,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Operator').text.semiBold.orange500.make(),
                          Text(widget.busData.operatorName)
                              .text
                              .semiBold
                              .blue900
                              .xl
                              .make(),
                          Text(widget.busData.busType)
                              .text
                              .semiBold
                              .blue900
                              .sm
                              .make(),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Arrival').text.semiBold.orange500.make(),
                          Text(widget.busData.arrivalTime)
                              .text
                              .semiBold
                              .blue900
                              .xl
                              .make(),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Departure').text.semiBold.orange500.make(),
                          Text(widget.busData.departureTime)
                              .text
                              .semiBold
                              .blue900
                              .xl
                              .make(),
                        ],
                      ),
                    ]),
                ksizedbox20,
                GetBuilder<BusController>(builder: (_) {
                  return Container(
                    height: 500,
                  //  width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Positioned(
                        //   bottom: 19,
                        //   right: 5,
                        //   child: Transform.rotate(
                        //     angle: -math.pi / 2.0,
                        //     child: Text(
                        //       "Upper Seats",
                        //       style: TextStyle(
                        //           color: kgrey,
                        //           fontSize: 22,
                        //           fontWeight: FontWeight.w700),
                        //     ),
                        //   ),
                        // ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
            
                           if(busController.upperSeatsList.isNotEmpty)   Column(
                                children: [
                                  Text(
                                    "Upper birth",
                                    style: primaryFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: kblue
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                              width: 200,
                              height: 450,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          for (var seats
                                              in busController.upperSeatsList)
                                            seats.isEmpty
                                                ? const SizedBox(
                                                    height: 10,
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      for (var seat in seats)
                                                        InkWell(
                                                          onTap: () {
                                                            if (seat.bookable) {
                                                              if (seat.isSelect ==
                                                                  true) {
                                                                seat.isSelect =
                                                                    false;
                                                                setState(() {
                                                                  seatIds.remove(
                                                                      seat.seatNumber);

                                                                  BusContactDetailsModel busContactDetailsModeldata = BusContactDetailsModel(
                                                                      ageController:
                                                                          TextEditingController(),
                                                                      gender:
                                                                          "",
                                                                      nameController:
                                                                          TextEditingController(),
                                                                      seats: seat
                                                                          .seatNumber);

                                                                  busContactDetailsModel.removeWhere(
                                                                      (element) =>
                                                                          element
                                                                              .seats ==
                                                                          seat.seatNumber);
                                                                });

                                                                double tempAmount = busController
                                                                        .totalAmount
                                                                        .value -
                                                                    seat.fareMaster
                                                                        .totalAmount;

                                                                busController
                                                                    .totalAmount(
                                                                        tempAmount);

                                                                busController
                                                                    .update();
                                                              } else {
                                                                seat.isSelect =
                                                                    true;
                                                                setState(() {
                                                                  seatIds.add(seat
                                                                      .seatNumber);

                                                                  BusContactDetailsModel busContactDetailsModeldata = BusContactDetailsModel(
                                                                      ageController:
                                                                          TextEditingController(),
                                                                      gender:
                                                                          "",
                                                                      nameController:
                                                                          TextEditingController(),
                                                                      seats: seat
                                                                          .seatNumber);

                                                                  busContactDetailsModel
                                                                      .add(
                                                                          busContactDetailsModeldata);
                                                                });

                                                                double tempAmount = busController
                                                                        .totalAmount
                                                                        .value +
                                                                    seat.fareMaster
                                                                        .totalAmount;

                                                                busController
                                                                    .totalAmount(
                                                                        tempAmount);

                                                                busController
                                                                    .update();
                                                              }
                                                            }
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 4),
                                                            child: seat.length ==
                                                                    "2"
                                                                ? Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            13),
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/sleeper.png",
                                                                      width: 45,
                                                                      color: seat
                                                                              .ladiesSeat
                                                                          ? Colors
                                                                              .pink
                                                                          : seat.isSelect
                                                                              ? Colors.green
                                                                              : seat.bookable
                                                                                  ? Colors.black
                                                                                  : Colors.grey.withOpacity(0.5),
                                                                    ),
                                                                  )
                                                                : seat.width ==
                                                                        "2"
                                                                    ? Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 10),
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/images/sleeper2.png",
                                                                          width:
                                                                              45,
                                                                          color: seat.ladiesSeat
                                                                              ? Colors.pink
                                                                              : seat.isSelect
                                                                                  ? Colors.green
                                                                                  : seat.bookable
                                                                                      ? Colors.black
                                                                                      : Colors.grey.withOpacity(0.5),
                                                                        ),
                                                                      )
                                                                    : Image
                                                                        .asset(
                                                                        "assets/images/seater.png",
                                                                        color: seat.ladiesSeat
                                                                            ? Colors.pink
                                                                            : seat.isSelect
                                                                                ? Colors.green
                                                                                : seat.bookable
                                                                                    ? Colors.black
                                                                                    : Colors.grey.withOpacity(0.5),
                                                                        height:
                                                                            26,
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
                              )
                              ),
                                ],
                              ),
                              
                          
                    Column(
                      children: [
                        Text(
                          "Lower birth",
                          style: primaryFont.copyWith(  fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: kblue),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 200,
                          height: 450,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.grey, width: 0.5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (var seats
                                          in busController.lowerSeatsList)
                                        seats.isEmpty
                                            ? const SizedBox(
                                                height: 10,
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  for (var seat in seats)
                                                    InkWell(
                                                      onTap: () {
                                                        // print(seat.seatNumber);
                                                        if (seat.bookable) {
                                                          if (seat.isSelect ==
                                                              true) {
                                                            seat.isSelect =
                                                                false;
                                                            setState(() {
                                                              seatIds.remove(seat
                                                                  .seatNumber);

                                                              BusContactDetailsModel
                                                                  busContactDetailsModeldata =
                                                                  BusContactDetailsModel(
                                                                      ageController:
                                                                          TextEditingController(),
                                                                      gender:
                                                                          "",
                                                                      nameController:
                                                                          TextEditingController(),
                                                                      seats: seat
                                                                          .seatNumber);

                                                              busContactDetailsModel
                                                                  .removeWhere((element) =>
                                                                      element
                                                                          .seats ==
                                                                      seat.seatNumber);
                                                            });

                                                            double tempAmount =
                                                                busController
                                                                        .totalAmount
                                                                        .value -
                                                                    seat.fareMaster
                                                                        .totalAmount;

                                                            busController
                                                                .totalAmount(
                                                                    tempAmount);

                                                            busController
                                                                .update();
                                                          } else {
                                                            seat.isSelect =
                                                                true;
                                                            setState(() {
                                                              seatIds.add(seat
                                                                  .seatNumber);

                                                              BusContactDetailsModel
                                                                  busContactDetailsModeldata =
                                                                  BusContactDetailsModel(
                                                                      ageController:
                                                                          TextEditingController(),
                                                                      gender:
                                                                          "",
                                                                      nameController:
                                                                          TextEditingController(),
                                                                      seats: seat
                                                                          .seatNumber);

                                                              busContactDetailsModel
                                                                  .add(
                                                                      busContactDetailsModeldata);
                                                            });

                                                            double tempAmount =
                                                                busController
                                                                        .totalAmount
                                                                        .value +
                                                                    seat.fareMaster
                                                                        .totalAmount;

                                                            busController
                                                                .totalAmount(
                                                                    tempAmount);

                                                            busController
                                                                .update();
                                                          }
                                                        }
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 4),
                                                        child:
                                                            seat.length == "2"
                                                                ? Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            13),
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/sleeper.png",
                                                                      width: 45,
                                                                      color: seat
                                                                              .ladiesSeat
                                                                          ? Colors
                                                                              .pink
                                                                          : seat.isSelect
                                                                              ? Colors.green
                                                                              : seat.bookable
                                                                                  ? Colors.black
                                                                                  : Colors.grey.withOpacity(0.5),
                                                                    ),
                                                                  )
                                                                : seat.width ==
                                                                        "2"
                                                                    ? Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 10),
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/images/sleeper2.png",
                                                                          width:
                                                                              36,
                                                                          color: seat.ladiesSeat
                                                                              ? Colors.pink
                                                                              : seat.isSelect
                                                                                  ? Colors.green
                                                                                  : seat.bookable
                                                                                      ? Colors.black
                                                                                      : Colors.grey.withOpacity(0.5),
                                                                        ),
                                                                      )
                                                                    : Image
                                                                        .asset(
                                                                        "assets/images/seater.png",
                                                                        color: seat.ladiesSeat
                                                                            ? Colors.pink
                                                                            : seat.isSelect
                                                                                ? Colors.green
                                                                                : seat.bookable
                                                                                    ? Colors.black
                                                                                    : Colors.grey.withOpacity(0.5),
                                                                        height:
                                                                            26,
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
                          ),
                        ),
                      ],
                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
                ksizedbox20,
                GetBuilder<BusController>(
                  builder: (_) {
                    return Container(
                      width: size.width * 0.7,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                        color: kwhite,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 228, 228, 228)
                                .withOpacity(0.3), // Shadow color
                            spreadRadius: 1, // The spread radius of the shadow
                            blurRadius: 5, // The blur radius of the shadow
                            offset: Offset(0, 3), // The offset of the shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 0.2, // Border width
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                           Row(
                children: [
                  Text(
                    'Seat No  :  ',
                    style: TextStyle(color:kblue, 
                    fontSize: 19,
                    fontWeight: FontWeight.w500),
                  ),
                  for (int i = 0; i < seatIds.length; i++)
                    Text(
                      '${seatIds[i]},',
                      style: TextStyle(color: kgrey, fontSize: 19),
                    ),
                ],
              ),
                            Divider(
                              height: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Fare Details")
                                        .text
                                        .xl
                                        .blue900
                                        .semiBold
                                        .make(),
                                    ksizedbox10,
                                    Text("Amount").text.xl2.blue900.semiBold.make(),
                                    ksizedbox10,
                                    Text("Cash will be calculated During Payment")
                                        .text
                                        .xl
                                        .blue900
                                        .semiBold
                                        .make(),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("INR ${busController.totalAmount.value.toStringAsFixed(2)} ")
                                        .text
                                        .xl2
                                        .blue900
                                        .semiBold
                                        .make(),
                                    ksizedbox10,
                                    Obx(
                                      () => busController.isLoading.isTrue
                                          ? InkWell(
                                              onTap: () {
                                                Get.to(PssengesDetails(
                                                  cusName: profileController
                                                          .profileData.isEmpty
                                                      ? "test"
                                                      : profileController
                                                          .profileData.first.name,
                                                  busContactmodel:
                                                      busContactDetailsModel,
                                                  boardingId: widget.boardingId,
                                                  busData: widget.busData,
                                                  dropingId: widget.dropingId,
                                                  searchkey: widget.searchkey,
                                                  seatIds: busController.seatIds,
                                                  amount: busController
                                                      .totalAmount.value
                                                      .toStringAsFixed(2),
                                                ));
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: [korange, kyellow]),
                                                    borderRadius:
                                                        BorderRadius.circular(15)),
                                                child: Center(
                                                  child:
                                                      const CupertinoActivityIndicator(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                Get.to(
                                                  PssengesDetails(
                                                    cusName: profileController
                                                            .profileData.isEmpty
                                                        ? "test"
                                                        : profileController
                                                            .profileData.first.name,
                                                    busContactmodel:
                                                        busContactDetailsModel,
                                                    boardingId: widget.boardingId,
                                                    busData: widget.busData,
                                                    dropingId: widget.dropingId,
                                                    searchkey: widget.searchkey,
                                                    seatIds: busController.seatIds,
                                                    amount: busController
                                                        .totalAmount.value
                                                        .toStringAsFixed(2),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: [korange, kyellow]),
                                                    borderRadius:
                                                        BorderRadius.circular(15)),
                                                child: Center(
                                                  child: Text(
                                                    'Proceed To Book ',
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.w700,
                                                        color: kwhite),
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
                ksizedbox40
              ],
            ),
          ),
          ksizedbox30,
          RegisterCommonBottom()
        ],
      )),
    );
  }
}
