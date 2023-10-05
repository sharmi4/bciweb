import 'package:flutter/material.dart';

import '../../../registerhomescreen/business_comm_homecontainer.dart';
import '../../members/common_widget/business_common_screen.dart';

class BusinessCouponRedementionScreen extends StatefulWidget {
  const BusinessCouponRedementionScreen({super.key});

  @override
  State<BusinessCouponRedementionScreen> createState() => _BusinessCouponRedementionScreenState();
}

class _BusinessCouponRedementionScreenState extends State<BusinessCouponRedementionScreen> {
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
          body: ListView(children: [
            Column(
              children: [
                
              ],
            )
          ]),
    );
  }
}