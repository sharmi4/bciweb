import 'package:bciweb/models/busbookingmodels/search_bus_model.dart';
import 'package:bciweb/views/members/bookins/bus/passengers_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../constant/constans.dart';
import '../../../../controller/auth_controller/auth_profile_controller.dart';
import '../../../../controller/bus_controllers.dart';
import '../../../../controller/profile_controller.dart';
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
    busController.busSeat(
        boardingId: widget.boardingId,
        droppingId: widget.dropingId,
        busData: widget.busData,
        searchKey: widget.searchkey);
  }
    final profileController = Get.find<AuthProfileController>();
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
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Positioned(
                        bottom: 19,
                        right: 5,
                        child: Transform.rotate(
                          angle: -math.pi / 2.0,
                          child: Text(
                            "Upper Seats",
                            style: TextStyle(
                                color: kgrey,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              height: size.height * 0.8,
                              width: size.width * 0.1,
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                ),
                                itemCount: busController.seatMap.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      if (busController
                                              .seatMap[index].isSelect ==
                                          true) {
                                        busController.seatMap[index].isSelect =
                                            false;
                                        setState(() {
                                          busController.seatIds.remove(
                                              busController
                                                  .seatMap[index].seatNumber);

 BusContactDetailsModel busContactDetailsModeldata = BusContactDetailsModel(
                                                  ageController: TextEditingController(),
                                                  gender: "",
                                                  nameController: TextEditingController(),
                                                  seats: busController.seatMap[index].seatNumber
                                                ); 

                                                busContactDetailsModel.removeWhere((element) => element.seats == busController.seatMap[index].seatNumber);   

                                        });

                                        double tempAmount =
                                            busController.totalAmount.value -
                                                busController.seatMap[index]
                                                    .fareMaster.totalAmount;

                                        busController.totalAmount(tempAmount);

                                        busController.update();
                                      } else {
                                        busController.seatMap[index].isSelect =
                                            true;
                                        setState(() {
                                          busController.seatIds.add(
                                              busController
                                                  .seatMap[index].seatNumber);


                                                  BusContactDetailsModel busContactDetailsModeldata = BusContactDetailsModel(
                                                  ageController: TextEditingController(),
                                                  gender: "",
                                                  nameController: TextEditingController(),
                                                  seats: busController.seatMap[index].seatNumber
                                                );
                               busContactDetailsModel.add(busContactDetailsModeldata);

                                        });

                                        double tempAmount =
                                            busController.totalAmount.value +
                                                busController.seatMap[index]
                                                    .fareMaster.totalAmount;

                                        busController.totalAmount(tempAmount);

                                        busController.update();
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: busController.seatMap[index]
                                                      .isSelect ==
                                                  true
                                              ? korange
                                              : Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          busController
                                              .seatMap[index].seatNumber,
                                          style: TextStyle(
                                            color: busController.seatMap[index]
                                                        .isSelect ==
                                                    true
                                                ? korange
                                                : Colors.grey[300],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )),
                        ],
                      ),
                      Positioned(
                        bottom: 19,
                        right: 5,
                        child: Transform.rotate(
                          angle: -math.pi / 2.0,
                          child: Text(
                            "Lower Seats",
                            style: TextStyle(
                                color: kgrey,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                ksizedbox20,
                Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Seat No.").text.xl3.blue900.semiBold.make(),
                            Container(
                                width: 100,
                                child: Wrap(
                                  children: [
                                    for (int i = 0;
                                        i < busController.seatIds.length;
                                        i++)
                                      Text("${busController.seatIds[i]},")
                                          .text
                                          .xl
                                          .blue900
                                          .semiBold
                                          .make(),
                                  ],
                                )),
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
                                Text("INR ${busController.totalAmount.value} ")
                                    .text
                                    .xl2
                                    .blue900
                                    .semiBold
                                    .make(),
                                ksizedbox10,
                                InkWell(
                                  onTap: () {
                                    Get.to(PssengesDetails(
                                       cusName:profileController.profileData.isEmpty ? "test" : profileController.profileData.first.name,
                        busContactmodel: busContactDetailsModel,
                                      boardingId: widget.boardingId,
                                      busData: widget.busData,
                                      dropingId: widget.dropingId,
                                      searchkey: widget.searchkey,
                                      seatIds: busController.seatIds,
                                      amount: busController.totalAmount.value
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
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
