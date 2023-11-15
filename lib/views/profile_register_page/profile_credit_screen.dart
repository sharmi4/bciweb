import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/setting_controller/setting_controller.dart';
import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/views/profile_register_page/partial_statement_screen.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCreditScreen extends StatefulWidget {
  const ProfileCreditScreen({super.key});

  @override
  State<ProfileCreditScreen> createState() => _ProfileCreditScreenState();
}

class _ProfileCreditScreenState extends State<ProfileCreditScreen> {
  @override
  void initState() {
    super.initState();
    settingController.getCreditProfile();
    settingController.getCreditStatement();
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
                      'Credit Overview',
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
                  'Total Credit Limit',
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
              height: 150,
              width: size.width,
              decoration: BoxDecoration(color: kwhite, boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: Offset(0.0, 0.75), blurRadius: 5, color: kgrey)
              ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GetBuilder<ApiSettingController>(builder: (_) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Credit Limit',
                            style: TextStyle(color: kblue),
                          ),
                          Text(
                            '₹${settingController.creditLimit.value}',
                            style: TextStyle(
                                fontSize: 18,
                                color: kblue,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Current Outstanding ',
                                style: TextStyle(color: kblue),
                              ),
                              Text(
                                '₹${settingController.usedLimit.value}',
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
                                'Available Credit limit',
                                style: TextStyle(color: kblue),
                              ),
                              Text(
                                '₹${settingController.pendingLimit.value}',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: kblue,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                }),
              ),
            ),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Text(
                  'Your Billed Details',
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
              height: 250,
              width: size.width,
              decoration: BoxDecoration(color: kwhite, boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: Offset(0.0, 0.75), blurRadius: 5, color: kgrey)
              ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GetBuilder<ApiSettingController>(builder: (_) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment Due Date',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: kblue),
                          ),
                          Text(
                            formatDate(
                                settingController.creditTransactionsList.first
                                    .transactionDate,
                                [dd, ' ', MM, ' ', yyyy]),
                            style: TextStyle(
                                fontSize: 16,
                                color: kblue,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Billed Due',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: kblue),
                          ),
                          Text(
                            '₹${settingController.totalUnpaidAmountCurrentMonth}',
                            style: TextStyle(
                                fontSize: 17,
                                color: kblue,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            child: Text(
                              'Billing information can be defined as any data that enables any person to access a customer or donor"s account. These accounts could be a credit card, checking account, savings account or any similar account. It could also .',
                              style: TextStyle(height: 1.3, color: kblue),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              settingController.initiatePayment(
                                  amount: double.parse(settingController.
                                  covertAmountToInt(settingController.totalUnpaidAmountCurrentMonth.value)));
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: kblue,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  'Pay Bill',
                                  style: TextStyle(color: kwhite),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(const PartialStatementScreen());
                            },
                            child: Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: kblue,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  'View Statement',
                                  style: TextStyle(color: kwhite),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
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
              width: size.width,
              decoration: BoxDecoration(color: kwhite, boxShadow: <BoxShadow>[
                BoxShadow(
                    offset:const Offset(0.0, 0.75), blurRadius: 5, color: kgrey)
              ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GetBuilder<ApiSettingController>(builder: (_) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: settingController.creditTransactionsList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ksizedbox10,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Column(
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
                                                height: 20,
                                                width: 1.5,
                                                color: kgrey,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                settingController
                                                    .creditTransactionsList[
                                                        index]
                                                    .creditFor,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color: kblue),
                                              ),
                                              settingController.creditTransactionsList[index].isPaid == "2" ? 
                                              Text("Credited on ${formatDate(settingController.creditTransactionsList[index].createdAt, [
                                                                dd,
                                                                " ",
                                                                M,
                                                                " ",
                                                                yyyy
                                                              ])}",
                                                          style: const TextStyle(
                                                              fontSize: 14,
                                                              color: Color(
                                                                  0xFF05406E),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ) :
                                              Text(
                                                "Paid on ${formatDate(settingController.creditTransactionsList[index].createdAt, [
                                                      dd,
                                                      " ",
                                                      M,
                                                      " ",
                                                      yyyy
                                                    ])}",
                                                style: TextStyle(
                                                    fontSize: 13, color: kblue),
                                              )  
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ksizedbox10,
                                  Text(
                                    '₹${settingController.creditTransactionsList[index].amount}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: settingController
                                                      .creditTransactionsList[
                                                          index]
                                                      .isPaid ==
                                                  "2"
                                              ? Colors.green
                                              : Colors.pink,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                          ksizedbox20,
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
