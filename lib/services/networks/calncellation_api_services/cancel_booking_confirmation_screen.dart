
import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/members/bookins/history/views/history.dart';
import 'package:bciweb/views/members/bookins/history/views/widgets/widgetsdemo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

//import 'holiday_home.dart';

class BookingCancelled extends StatelessWidget {
  const BookingCancelled({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.red,
                size: 200,
              ),
            ),
            Text(
              'Booking cancelled',
              style: TextStyle(
                  color: kblue, fontSize: 28, fontWeight: FontWeight.w700),
            ),
            ksizedbox10,
            Text(
              'Your amount will get refunded',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w600, color: kblue),
            ),
            ksizedbox40,
            ksizedbox40,
            InkWell(
              onTap: () {
                Get.offAll(
                  () => History(),
                );
              },
              child: Container(
                width: 150,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFFF5C29),
                      Color(0xFFFFCD38),
                    ],
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
