import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/controller/setting_controller/setting_controller.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/wallet_respo_business/respo_business_payout.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class RespoBusinessWallet extends StatefulWidget {
  const RespoBusinessWallet({super.key});

  @override
  State<RespoBusinessWallet> createState() => _RespoBusinessWalletState();
}

class _RespoBusinessWalletState extends State<RespoBusinessWallet> {
  int index = 0;
  List amountimage = [
    'assets/images/amounticon.png',
    'assets/images/amounticon.png',
  ];
  List amounttitle = ['Luck Draw registeration', 'Wallet Topup'];
  List amountcash = [' -  ₹4500', ' +  ₹500'];
  List amountdate = [
    '20/04/2023',
    '20/04/2023',
  ];
  List refno = [
    'Ref.no:654',
    'Ref.no:25',
  ];
  List yesterdayamountimage = [
    'assets/images/amounticon.png',
    'assets/images/amounticon.png',
  ];
  List yesterdayamounttitle = [
    'Money Send to Ankit',
    'Money Received From Tom'
  ];
  List yesterdaydate = ['20/03/2023', '20/03/2023'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authprofileController.getProfile();
    authController.transactionHistoryDetails();
    apisettingController.transactionHistoryDetails();
  }
final apisettingController = Get.find<ApiSettingController>();
  final authprofileController = Get.find<AuthProfileController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarMob(),
        preferredSize: Size(double.infinity, 40),
      ),
      drawer: DrawerBusiness(),
      body: GetBuilder<ProfileController>(builder: (_) {
        return ListView(physics: const BouncingScrollPhysics(), children: [
          Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Total Wallet',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Container(
                      height: 110,
                      width: 235,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: const Offset(0.0, 0.75),
                              blurRadius: 7.0,
                              color: kyellow)
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: kOrange,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 20, left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Wallet Amount',
                              style: TextStyle(
                                color: kwhite,
                                fontSize: 17,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, right: 30),
                              child:authprofileController.profileData.isNotEmpty
                                  ? Text(
                                      '₹${authprofileController.profileData.first.walletAmount}',
                                      style: TextStyle(
                                          fontSize: 21, color: kwhite),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 30),
                                      child: Text(
                                        '₹ 0',
                                        style: TextStyle(
                                            fontSize: 21, color: kwhite),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (authprofileController
                                  .profileData.first.bankAccountNumber !=
                              "" &&
                         authprofileController.profileData.first.bankAccountName !=
                              "" &&
                         authprofileController.profileData.first.ifscCode != "") {
                        Get.to(() => RespoBusinessPayout());
                      } else {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 2),
                                child: Container(
                                  height: 130,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Add Bank Account to Withdraw',
                                              style: TextStyle(
                                                  fontSize: 17, color: kblue),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(170, 45),
                                            backgroundColor: kblue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15))),
                                        onPressed: () {
                                          //          Get.to(const BankDetailsScreen());
                                        },
                                        child: const Text(
                                          'Add',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: kyellow,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: kOrange, width: 1)),
                            height: _mediaQuery.height > 700 ? 110 : 110,
                            width: _mediaQuery.width > 700 ? 90 : 95,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 11),
                                  child: CircleAvatar(
                                    backgroundColor: kwhite,
                                    radius: 25,
                                    child: Image.asset(
                                      'assets/images/cirlewallet.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Withdraw \nCash',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14, color: kwhite),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        'Transaction History',
                        style: TextStyle(
                            fontSize: 20,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    // Image.asset('assets/images/transactionicon.png')
                  ],
                ),
              ),
              GetBuilder<AuthController>(builder: (_) {
                return Container(
                  height: _mediaQuery.height * 0.50,
                  child: authController.transactionHistorydata.isNotEmpty
                      ? ListView.builder(
                          itemCount:
                              authController.transactionHistorydata.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 65,
                                width: _mediaQuery.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.grey.withOpacity(0.5))
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 7),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          authController
                                                      .transactionHistorydata[
                                                          index]
                                                      .status ==
                                                  "credit"
                                              ? Text(
                                                  "Credited",
                                                  style: primaryFont.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Text(
                                                  "Debited",
                                                  style: primaryFont.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          authController
                                                      .transactionHistorydata[
                                                          index]
                                                      .status ==
                                                  "credit"
                                              ? Text(
                                                  "Credited on ${formatDate(authController.transactionHistorydata[index].createdAt, [
                                                        dd,
                                                        "-",
                                                        mm,
                                                        "-",
                                                        yyyy,
                                                        " ",
                                                        hh,
                                                        ":",
                                                        nn,
                                                        " ",
                                                        am
                                                      ])}",
                                                  style: primaryFont.copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              : Text(
                                                  "Debited on ${formatDate(authController.transactionHistorydata[index].createdAt, [
                                                        dd,
                                                        "-",
                                                        mm,
                                                        "-",
                                                        yyyy,
                                                        " ",
                                                        hh,
                                                        ":",
                                                        nn,
                                                        " ",
                                                        am
                                                      ])}",
                                                  style: primaryFont.copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                        ],
                                      ),
                                      authController
                                                  .transactionHistorydata[index]
                                                  .status ==
                                              "credit"
                                          ? Text(
                                              "+ ₹${authController.transactionHistorydata[index].amount}",
                                              style: primaryFont.copyWith(
                                                  fontSize: 16,
                                                  color: Colors.green),
                                            )
                                          : Text(
                                              "- ₹${authController.transactionHistorydata[index].amount}",
                                              style: primaryFont.copyWith(
                                                  fontSize: 16,
                                                  color: Colors.red),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/w.jpeg',
                                // fit: BoxFit.fitHeight,
                                height: 200,
                              ),
                              ksizedbox20,
                              Text(
                                'No Wallet Data',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: kblue,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                );
              }),
            ],
          ),
        ]);
      }),
    );
  }
}
