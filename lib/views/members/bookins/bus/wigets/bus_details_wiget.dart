import 'package:bciweb/constant/constans.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websafe_svg/websafe_svg.dart';

class BussDetails extends StatelessWidget {
  const BussDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
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
                      Text('Yolo Bus').text.semiBold.sm.make(),
                      Text('Capella A/c Sleeper(2+2)').text.gray500.sm.make(),
                      Text('Seats SUS DU7').text.gray500.sm.make(),
                      Text('08:56,17 june,2023').text.gray500.sm.make()
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
          Text('Chennai').text.semiBold.make(),
          Text('Vadapalani').text.gray500.make(),
          Text('10:04,17 june,2023').text.gray500.make(),
          ksizedbox10,
          WebsafeSvg.asset('assets/images/Group 45.svg'),
          ksizedbox10,
          Text('Kerala').text.semiBold.make(),
          Text('Vadapalani').text.gray500.make(),
          Text('10:04,17 june,2023').text.gray500.make(),
          ksizedbox20,
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
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Basic Fare (for 2 Seats)').text.gray500.make(),Text('₹ 1200.0').text.make(),],
                ), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Bus partner GST').text.gray500.make(),Text('₹ 49.0').text.make(),],
                ), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Service Charge').text.gray500.make(),Text('₹ 21.0').text.make(),],
                ) ,Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Free Cancellaation Charges').text.gray500.make(),Text('+₹ 12.0').text.make(),],
                ) ,ksizedbox10,Divider(height: 1,),ksizedbox10,
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Total Fare').text.gray500.make(),Text('₹ 1200.0').text.make(),],
                ),
             ksizedbox10 ],
            ),
          )
        ],
      ),
      color: Colors.grey[100],
      // height: 30,
      width: size.width * 0.16,
    );
  }
}
