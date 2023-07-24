import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constant/constans.dart';
//import '../../../../registerhomescreen/common_reg_appbar';
import '../../common_widget/common.dart';

class AddWallet extends StatelessWidget {
  const AddWallet({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(),
          preferredSize: Size(double.infinity, 40)),
      body: ListView(
        children: [
          RegisterCommonContainer(),
          Container(
            child: Image.asset('assets/images/Group .png'),
          ),
          ksizedbox10,
          Text(
            'OTC Payment',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff003366),
                fontSize: 35,
                fontWeight: FontWeight.bold),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/wallet.png', height: size.height * 0.5,
                // alignment: Alignment.center,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ksizedbox30,
                  Text(
                    'Add To Wallet Amounts or Default Amount Choose Payment Methods...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kblue,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  ksizedbox30,
                  Container(
                    child: Center(
                      child: Text(
                        '₹1990.00',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: kwhite),
                      ),
                    ),
                    height: 50,
                    width: 220,
                    decoration: BoxDecoration(
                        color: kblue, borderRadius: BorderRadius.circular(4)),
                  ),
                ],
              ),
            ],
          ),
          ksizedbox40,
          Text(
            'Others Amounts',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kblue, fontSize: 22, fontWeight: FontWeight.w700),
          ),
          ksizedbox30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: kblue)),
                child: Center(
                  child: Text(
                    '+2000',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: kblue),
                  ),
                ),
                height: 50,
                width: 120,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: kblue)),
                child: Center(
                  child: Text(
                    '+2000',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: kblue),
                  ),
                ),
                height: 50,
                width: 120,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: kblue)),
                child: Center(
                  child: Text(
                    '+2000',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: kblue),
                  ),
                ),
                height: 50,
                width: 120,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: kblue)),
                child: Center(
                  child: Text(
                    '+2000',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: kblue),
                  ),
                ),
                height: 50,
                width: 120,
              ),
            ],
          ),
          ksizedbox30,
          ksizedbox40,
          InkWell(
            onTap: () {
              //  Get.to(Sucessful_screen_otc());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                width: size.width,
                height: 50,
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
                  'Next',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          ksizedbox30,
          InkWell(
            onTap: () {
              {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 180, bottom: 120),
                        child: Dialog(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cancel Transaction',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Are you sure you want to Cancel transaction',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: kgrey,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                ksizedbox20,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: Size(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                40),
                                            backgroundColor: kOrange),
                                        onPressed: () {
                                          Get.back();

                                          // showModalBottomSheet(
                                          //     shape: RoundedRectangleBorder(
                                          //         borderRadius:
                                          //             BorderRadius.vertical(
                                          //       top: Radius.circular(26.0),
                                          //     )),
                                          //     context: context,
                                          //     builder: (context) {
                                          //       return Padding(
                                          //         padding:
                                          //             const EdgeInsets.only(
                                          //                 left: 10, right: 10),
                                          //         child: Container(
                                          //           height: 300,
                                          //           width:
                                          //               MediaQuery.of(context)
                                          //                   .size
                                          //                   .width,
                                          //           child: Column(
                                          //             children: [
                                          //               Image.asset(
                                          //                   'assets/images/cancel.png'),
                                          //               ksizedbox20,
                                          //               Text(
                                          //                 'Payment has been Declined',
                                          //                 style: TextStyle(
                                          //                     fontSize: 25),
                                          //               ),
                                          //               ksizedbox10,
                                          //               InkWell(
                                          //                 onTap: () {
                                          //                   Get.back();
                                          //                 },
                                          //                 child: Container(
                                          //                   height: 45,
                                          //                   width: MediaQuery.of(
                                          //                               context)
                                          //                           .size
                                          //                           .width *
                                          //                       0.5,
                                          //                   decoration: BoxDecoration(
                                          //                       color: kblue,
                                          //                       borderRadius:
                                          //                           BorderRadius
                                          //                               .circular(
                                          //                                   15)),
                                          //                   child: Center(
                                          //                     child: Text(
                                          //                       'Try Again',
                                          //                       style: TextStyle(
                                          //                           color:
                                          //                               kwhite,
                                          //                           fontSize:
                                          //                               25,
                                          //                           fontWeight:
                                          //                               FontWeight
                                          //                                   .w500),
                                          //                     ),
                                          //                   ),
                                          //                 ),
                                          //               ),
                                          //             ],
                                          //           ),
                                          //         ),
                                          //       );
                                          //     });
                                        },
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(fontSize: 23),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: Size(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                40),
                                            backgroundColor: kOrange),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'No',
                                          style: TextStyle(fontSize: 23),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: size.width,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kblue,
                  border: Border.all(color: const Color.fromARGB(0, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 28, color: kwhite, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          ksizedbox40,
          RegisterCommonBottom()
        ],
      ),
    );
  }
}
