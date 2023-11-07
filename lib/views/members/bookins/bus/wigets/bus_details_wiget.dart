import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/models/busbookingmodels/bus_contact_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../../../controller/bus_controllers.dart';
import '../../../../../models/busbookingmodels/search_bus_model.dart';

class BussDetails extends StatefulWidget {
  Bus busData;
  String boardingId;
  String dropingId;
  String searchkey;
  List<BusContactDetailsModel> busContactmodel;
  List<String> seatIds;
  String amount;
  BussDetails(
      {super.key,
      required this.boardingId,
      required this.busData,
      required this.dropingId,
      required this.searchkey,
      required this.amount,
      required this.busContactmodel,
      required this.seatIds});

  @override
  State<BussDetails> createState() => _BussDetailsState();
}

class _BussDetailsState extends State<BussDetails> {
  final busController = Get.find<BusController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[100],
      // height: 30,
      width: size.width * 0.16,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Onward').text.gray500.semiBold.make(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset('assets/images/bus-1.png'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 130,
                        child: Text(widget.busData.operatorName,).text.semiBold.sm.make()
                      ,),
                      Container(
                          width: 120,
                          child: Text(widget.busData.busType)
                              .text
                              .gray500
                              .sm
                              .make()),
                      Row(
                        children: [
                          Text('Seat No.').text.sm.gray500.make(),
                          for (int i = 0; i <widget.busContactmodel.length; i++)
                            Text(' ${widget.busContactmodel[i].seats.toString()},')
                                .text
                                .sm
                                .gray500
                                .make(),
                        ],
                      ),
                      Text(busController.date.string).text.gray500.sm.make()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          ksizedbox10,
          Text(busController.fromCity.string).text.semiBold.make(),
          Text(busController.boardingName.string).text.gray500.make(),
          Text(widget.busData.departureTime).text.gray500.make(),
          ksizedbox10,
          WebsafeSvg.asset('assets/images/Group 45.svg'),
          ksizedbox10,
          Text(busController.toCity.string).text.semiBold.make(),
          Text(busController.droppingName.string).text.gray500.make(),
          Text(widget.busData.arrivalTime).text.gray500.make(),
          //   ksizedbox20,
          Divider(
            height: 1,
          ),
          ksizedbox10,
          Divider(
            height: 1,
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Fare Details').text.semiBold.make(),
              ],
            ),
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 105,
                      child: Text('Basic Fare (for 2 Seats)').text.gray500.make()),
                    Text('₹ ${busController.seatMap.first.fareMaster.basicAmount}').text.make(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Bus partner GST').text.gray500.make(),
                    Text('₹${busController.seatMap.first.fareMaster.gst}').text.make(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Service Charge').text.gray500.make(),
                    Text('₹${busController.seatMap.first.fareMaster.serviceFeeAmount}').text.make(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 105,
                      child: Text('Free Cancellaation Charges').text.gray500.make()),
                    Text(' ₹${busController.seatMap.first.fareMaster.cancellationCharges} ').text.make(),
                  ],
                ),
                ksizedbox10,
                Divider(
                  height: 1,
                ),
                ksizedbox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Fare').text.gray500.make(),
                    Text('₹ ${busController.seatMap.first.fareMaster.totalAmount}').text.make(),
                  ],
                ),
                ksizedbox10
              ],
            ),
          )
        ],
      ),
    );
  }
}
