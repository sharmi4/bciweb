import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/subscribe_controllers.dart';
import '../../../../registerhomescreen/common_reg_appbar';
import '../../../../registerhomescreen/common_reg_homescreen.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({super.key});

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  final settingsController = Get.find<SubscribeController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: RegisterCommonAppbar(), preferredSize: Size(double.infinity, 40)),
      body: Obx(
        () => ListView(
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             RegisterCommonContainer(),
            Container(
              child: Stack(
                children: [
                  Image.asset('assets/images/Group 39757.png'),
                  Positioned(top: 0,left: 0,bottom: 0,right: 0,
                    child: Center(
                      child: Text(
                        'Subscribe',
                        style: GoogleFonts.lato(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: kwhite),
                      ),
                    ),
                  )
                ],
              ),
            ),ksizedbox30,
            Text(
              'Select Membership',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff003366), fontSize: 35, fontWeight: FontWeight.bold),
            ),
            ksizedbox10,
            const Text(
              "All Select Membership Cards Choose Anything",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  color: Color(0xff003366)),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            settingsController.index(0);
                            settingsController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 0
                                    ? const Color(0xffFF9021)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 0
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 0)
                                    const BoxShadow(
                                      color: Color(0xffFF9021),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "OTC",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 0
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                        kwidth10,
                        InkWell(
                          onTap: () {
                            settingsController.index(1);
                            settingsController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 1
                                    ? Color(0xff0C559F)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 1
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 1)
                                    const BoxShadow(
                                      color: Color(0xff003366),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "BUSINESS",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 1
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            settingsController.index(2);
                            settingsController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 2
                                    ? const Color(0xff911361)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 2
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 2)
                                    const BoxShadow(
                                      color: Color(0xff911361),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "DIAMOND",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 2
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                        kwidth10,
                        InkWell(
                          onTap: () {
                            settingsController.index(3);
                            settingsController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 3
                                    ? const Color(0xffB0002D)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 3
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 3)
                                    const BoxShadow(
                                      color: Color(0xffB0002D),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "PLATINUM LIFE",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 3
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            settingsController.index(4);
                            settingsController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 4
                                    ? const Color(0xffD69D35)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 4
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 4)
                                    const BoxShadow(
                                      color: Color(0xffEDD076),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "ELITE LIFE",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 4
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                        kwidth10,
                        InkWell(
                          onTap: () {
                            settingsController.index(5);
                            settingsController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 5
                                    ? const Color(0xff148523)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 5
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 5)
                                    const BoxShadow(
                                      color: Color(0xff148523),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "SIGNATURE LIFE",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 5
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            settingsController.index(6);
                            settingsController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 6
                                    ? const Color(0xffDB5D08)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 6
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 6)
                                    const BoxShadow(
                                      color: Color(0xffDB5D08),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "AMABASSADORE LIFE",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 6
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                        kwidth10,
                        InkWell(
                          onTap: () {
                            settingsController.index(7);
                            settingsController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 7
                                    ? const Color(0xff6A2C77)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 7
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 7)
                                    const BoxShadow(
                                      color: Color(0xff6A2C77),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "HAPPY NEW YEAR",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 7
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      if (settingsController.index.value == 0)
                        InkWell(
                            onTap: () {Get.toNamed('/payment',);
                              //  Get.to(Otc_payment());
                            },
                            child: const Image(
                              image:
                                  AssetImage("assets/images/Group 38622.png"),
                              height: 234,
                            )),
                      if (settingsController.index.value == 1)
                        InkWell(
                            onTap: () {Get.toNamed('/payment',);
                              // Get.to(Otc_payment());
                            },
                            child: const Image(
                              image:
                                  AssetImage("assets/images/Group 38638.png"),
                              height: 234,
                            )),
                      if (settingsController.index.value == 2)
                        InkWell(
                            onTap: () {Get.toNamed('/payment',);
                              // Get.to(Otc_payment());
                            },
                            child: const Image(
                              image:
                                  AssetImage("assets/images/Group 38632.png"),
                              height: 234,
                            )),
                      if (settingsController.index.value == 3)
                        InkWell(
                            onTap: () {Get.toNamed('/payment',);
                              //   Get.to(Otc_payment());
                            },
                            child: const Image(
                              image:
                                  AssetImage("assets/images/Group 38633.png"),
                              height: 234,
                            )),
                      if (settingsController.index.value == 4)
                        InkWell(
                            onTap: () {Get.toNamed('/payment',);
                              //    Get.to(Otc_payment());
                            },
                            child: const Image(
                              image:
                                  AssetImage("assets/images/Group 38634.png"),
                              height: 234,
                            )),
                      if (settingsController.index.value == 5)
                        InkWell(
                            onTap: () {Get.toNamed('/payment',);
                              //   Get.to(Otc_payment());
                            },
                            child: const Image(
                              image:
                                  AssetImage("assets/images/Group 38635.png"),
                              height: 234,
                            )),
                      if (settingsController.index.value == 6)
                        InkWell(
                            onTap: () {Get.toNamed('/payment',);
                              //  Get.to(Otc_payment());
                            },
                            child: const Image(
                              image:
                                  AssetImage("assets/images/Group 38636.png"),
                              height: 234,
                            )),
                      if (settingsController.index.value == 7)
                        InkWell(
                            onTap: () {
                              Get.toNamed('/payment',);
                            },
                            child: const Image(
                              image:
                                  AssetImage("assets/images/Group 38637.png"),
                              height: 234,
                            )),
                    ],
                  ),
                ),
              ],
            ),
            ksizedbox40,
           RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}
