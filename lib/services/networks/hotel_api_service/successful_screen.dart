import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../views/members/common_widget/common.dart';

class SucssesFullsceen extends StatelessWidget {
  const SucssesFullsceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonScreen(),
              RegisterCommonContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Booking Has Been Success full')
                .text
                .xl6
                .bold
                .blue900
                .make(),
          ),
        ],
      ),
    );
  }
}
