import 'package:flutter/material.dart';

import '../../../constant/constans.dart';
import '../../../views/business/bookins/history/views/widgets/orders.dart';
import 'liqour_order.dart';

class MobileLiqourBooking extends StatefulWidget {
  const MobileLiqourBooking({super.key});

  @override
  State<MobileLiqourBooking> createState() => _MobileLiqourBookingState();
}

class _MobileLiqourBookingState extends State<MobileLiqourBooking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MobileLiqourOrder(
              bottleimg: 'assets/images/Group 5831.png',
            ),
            // MobileLiqourOrder(
            //   bottleimg: 'assets/images/Group 5831.png',
            // ),
          ],
        ),
        ksizedbox30,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MobileLiqourOrder(
              bottleimg: 'assets/images/Group 5831.png',
            ),
            // MobileLiqourOrder(
            //   bottleimg: 'assets/images/Group 5831.png',
            // ),
          ],
        ),
        ksizedbox30,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MobileLiqourOrder(
              bottleimg: 'assets/images/Group 5831.png',
            ),
            // MobileLiqourOrder(
            //   bottleimg: 'assets/images/Group 5831.png',
            // ),
          ],
        ),
      ],
    )
    );
  }
}