import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/setting_controller/setting_controller.dart';
import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePartialScreen extends StatefulWidget {
  const ProfilePartialScreen({super.key});

  @override
  State<ProfilePartialScreen> createState() => _ProfilePartialScreenState();
}

class _ProfilePartialScreenState extends State<ProfilePartialScreen> {
  @override
  void initState() {
    super.initState();
    settingController.getPartialPaymentDatas();
    // settingController.getCreditProfile();
    //settingController.partialBookingHistory(partialamountid: settingController.partialbookinghistorylist.first.partialId);
  }

  final settingController = Get.find<ApiSettingController>();
  bool hotelbool = false;
  bool busbool = false;
  bool flightbool = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width - 195,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/businesswalletbackgroundimage.png',
                    fit: BoxFit.cover,
                  )),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Center(
                    child: Text(
                      'Partial Collect',
                      style: displayfont,
                    ),
                  ))
            ],
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Text(
                  'Details',
                  style: TextStyle(
                      fontSize: 22, color: kblue, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          ksizedbox30,
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: GetBuilder<ApiSettingController>(builder: (_) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: settingController.partialAmountdataList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 250,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: kwhite,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 5,
                              color: kgrey)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Plan Name',
                                    style: TextStyle(color: kblue),
                                  ),
                                  Text(
                                    settingController
                                        .partialAmountdataList[index].planTitle,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Plan Amount',
                                    style: TextStyle(color: kblue),
                                  ),
                                  Text(
                                    '₹${settingController.partialAmountdataList[index].planAmount}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Paid',
                                    style: TextStyle(color: kblue),
                                  ),
                                  Text(
                                    '₹${settingController.partialAmountdataList[index].collectedAmount}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Unpaid',
                                    style: TextStyle(color: kblue),
                                  ),
                                  Text(
                                    '₹${settingController.calculateUnPaid(double.parse(settingController.partialAmountdataList[index].planAmount), double.parse(settingController.partialAmountdataList[index].collectedAmount))}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(color: kblue),
                              ),
                              Container(
                                height: 25,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.yellow[200],
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      color: kgrey,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: kOrange,
                                          shape: BoxShape.circle),
                                    ),
                                    Text(
                                      settingController
                                          .partialAmountdataList[index].status,
                                      style: TextStyle(color: kblue),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          ksizedbox30,
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Text(
                  'Transactions Details',
                  style: TextStyle(
                      fontSize: 22, color: kblue, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          ksizedbox30,
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Container(
              height: 500,
              width: size.width,
              decoration: BoxDecoration(color: kwhite, boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: Offset(0.0, 0.75), blurRadius: 5, color: kgrey)
              ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GetBuilder<ApiSettingController>(builder: (_) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        settingController.partialAmountHistoryList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ksizedbox20,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              const Icon(
                                                Icons.check_circle_rounded,
                                                size: 20,
                                                color: Colors.green,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 1.5,
                                                color: kgrey,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  settingController
                                                      .partialAmountHistoryList[
                                                          index]
                                                      .planTitle,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: kblue),
                                                ),
                                                Text(
                                                  "Paid on ${formatDate(settingController.partialAmountHistoryList[index].createdAt, [
                                                        dd,
                                                        " ",
                                                        M,
                                                        " ",
                                                        yyyy
                                                      ])}",
                                                  style:
                                                      TextStyle(color: kblue),
                                                ),
                                                Text(
                                                  "Rs.${settingController.partialAmountHistoryList[index].collectedAmount}",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: kblue),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     ksizedbox10,
                              //     Text(
                              //       '₹${settingController.creditTransactionsList[index].amount}',
                              //       style: TextStyle(
                              //           fontSize: 18,
                              //           color: Colors.pink,
                              //           fontWeight: FontWeight.w500),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                          Divider()
                        ],
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
