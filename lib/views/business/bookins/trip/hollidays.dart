import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';

class HolidaysScreen extends StatelessWidget {
  const HolidaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
          child: Column(children: [
        RegisterCommonContainer(),
        Stack(
          children: [
            Image.asset(
              'assets/images/5545.png',
              width: size.width,
            ),
            Positioned(bottom: 0,top: 0,
                left: 0,
                right: 0,
               // top: 0,
                child: Center(
                    child: Text('Turn Your Dream Holiday\n Into A Reality')
                        .text
                        .bold
                        .xl6
                        .white
                        .make()))
          ],
        ),

Container(height: 50,width: 300,
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.black,  // Border color
      width: 2.0,          // Border width
    ),
  ),
  //child: YourChildWidget(),  // Replace with your actual child widget
),



        RegisterCommonBottom()
      ])),
    );
  }
}
