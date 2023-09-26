import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/reg_profile_controller.dart';
import 'package:bciweb/views/authentication/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/profile_controller.dart';
import '../../../controller/profile_show_controller.dart';
import '../../../controller/service_controller/home_controller.dart';
import '../../../controller/setting_controller/setting_controller.dart';
import '../../../controller/subscription_controller/subscription_controller.dart';

import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';
import '../../profile_register_page/my_account/profile_office_addreas.dart';
import '../../profile_register_page/my_account/profile_residential_address.dart';
import '../../profile_register_page/my_account/profile_settings.dart';
import '../../profile_register_page/profile_dashboard.dart';
import '../../profile_register_page/profile_offerce.dart';
import '../../profile_register_page/profile_partners.dart';
import '../../profile_register_page/profile_referal.dart';
import '../../profile_register_page/profile_register_page.dart';
import '../../profile_register_page/profile_subscription.dart';
import '../../profile_register_page/profile_support.dart';
import '../../profile_register_page/profile_upgrage.dart';
import '../common_widget/common.dart';

class RegisterProfileScreen extends StatefulWidget {
  const RegisterProfileScreen({super.key});

  @override
  State<RegisterProfileScreen> createState() => _RegisterProfileScreenState();
}

class _RegisterProfileScreenState extends State<RegisterProfileScreen> {
  final subscriptionapiController = Get.find<SubscriptionApiController>();
  final reghomeController = Get.find<RegisterProfileController>();
  final regshowController = Get.find<ProfileShowController>();
  final authprofileController = Get.find<AuthProfileController>();
  final profileController = Get.find<ProfileController>();
  final subscripeController = Get.find<SubscriptionApiController>();
  final seriveoffersController = Get.find<HomeServiceController>();
 var dobController = TextEditingController();

 

  final plansController = Get.find<SubscriptionApiController>();

  plan() {
    if (authprofileController.planid != "") {
      plansController.getPlanDetails(id: authprofileController.planid.value);
    } else {}
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text =
            '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
      });
    }
  }

  bool isMarried = false;
  bool isUnmarried = false;
  int offersindex = 0;
  bool isLoading = false;
  List partnerimage = [
    'assets/images/partnerimage1.png',
    'assets/images/partnerimage2.png',
    'assets/images/partnerimage3.png',
    'assets/images/partnerimage4.png',
    'assets/images/partnerimage5.png',
    'assets/images/partnerimage6.png'
  ];


  AlertDialog mAlertItem2 = AlertDialog(
    backgroundColor: Colors.white,
    title: const Text("Confirmation",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    content: const Text(
      "Are you sure you want to logout?",
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      TextButton(
        child: Text(
          "Yes",
          style: TextStyle(color: kblue),
        ),
        onPressed: () {
          Get.offAll(LandingScreen());
        },
      ),
      TextButton(
        child: Text("No", style: TextStyle(color: kblue)),
        onPressed: () {
          Get.back();
        },
      ),
    ],
  );
  final apisettingController = Get.find<ApiSettingController>();

  callApis() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // setDefauld();
      subscripeController.getcouponsList();
      authprofileController.getProfile();
      apisettingController.getwalletList();
      apisettingController.generateReferralCode();
      apisettingController.transactionHistoryDetails();
      apisettingController.ourPartner();
      seriveoffersController.gettodayoffersList();
      subscriptionapiController.getplansList();
    });
  }

  @override
  void initState() {
    super.initState();
    // setDefauld();
    // subscripeController.getcouponsList();
    // authprofileController.getProfile();
    // apisettingController.getwalletList();
    // apisettingController.generateReferralCode();
    // apisettingController.ourPartner();
    callApis();
    // plansController.getPlanDetails(id: int.parse(authprofileController.planId.value));
  }

  final List<ChartData> chartData = [
    ChartData('David', 25, Color.fromRGBO(9, 0, 136, 1)),
    ChartData('Steve', 38, Color.fromRGBO(147, 0, 119, 1)),
    ChartData('Jack', 34, Color.fromRGBO(228, 0, 124, 1)),
    ChartData('Others', 52, Color.fromRGBO(255, 189, 57, 1))
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
      body: Obx(
        () => ListView(children: [
          // RegisterCommonContainer(),

          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 1500,
              width: 195,
              color: kyellow,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(0);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 0
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 20,
                                    color: kwhite,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'My Account',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(1);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                  bottom: BorderSide(color: kwhite),
                                ),
                                color: reghomeController.proindex == 1
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profiledashboard.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Dashboard',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(2);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 2
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profileoffers.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Offers',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //  Padding(
                  //   padding: const EdgeInsets.only(top: 20),
                  //   child: Row(
                  //     children: [
                  //      InkWell(
                  //       onTap: (){
                  //          reghomeController.proindex(3);
                  //           reghomeController.update();
                  //       },
                  //        child: Container(
                  //            height: 40,
                  //            width: 195,
                  //              decoration: BoxDecoration(
                  //              border: BorderDirectional(
                  //             bottom: BorderSide(
                  //               color: kwhite
                  //             )
                  //           ),
                  //           color:reghomeController.proindex==3?kblue:kyellow
                  //                                      ),
                  //        child: Padding(
                  //          padding: const EdgeInsets.only(left: 20),
                  //          child: Row(
                  //            children: [
                  //             Image.asset('assets/icons/profilecuopons.png',
                  //             height: 15,fit: BoxFit.fitHeight,),
                  //              Padding(
                  //                padding: const EdgeInsets.only(left: 11),
                  //                child: Text('Your Coupons',
                  //                style: TextStyle(
                  //                 color: kwhite
                  //                ),),
                  //              ),
                  //            ],
                  //          ),
                  //        ),),
                  //      )
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(4);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color:  reghomeController.proindex == 4
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/proaditionaloffer.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'My Subscription',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(5);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(color: kwhite)),
                              color: reghomeController.proindex == 5
                                  ? kblue
                                  : kyellow,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profilerefferal.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Your Referrals',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(6);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(color: kwhite)),
                              color: reghomeController.proindex == 6
                                  ? kblue
                                  : kyellow,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 11),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profilepartner.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Our Partner',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(7);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 7
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profileupgrade.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Upgrade',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(8);
                            reghomeController.update();
                          },
                          child: Container(
                            width: 195,
                            height: 40,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 8
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profilesubort.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Support',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(9);
                            reghomeController.update();

                            //Get.offAll(LandingScreen());
                          },
                          child: Container(
                            width: 195,
                            height: 40,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 9
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/cirlewallet.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                    color: kwhite,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Wallet',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(10);
                            reghomeController.update();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return mAlertItem2;
                                });
                            //Get.offAll(LandingScreen());
                          },
                          child: Container(
                            width: 195,
                            height: 40,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 10
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profilelogout.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Logout',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (reghomeController.proindex.value == 0)
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 195,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              'Profile Setting',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kblue),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150, top: 20),
                            child: InkWell(
                              onTap: () {
                                profileController.profileindex(0);
                                profileController.update();
                              },
                              child: Image.asset(
                                'assets/icons/profiledropdown.png',
                                height: 10,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 1, left: 10, right: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      if (profileController.profileindex.value == 0)
                        ProfileSettings(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              'Office Address',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kblue),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150, top: 20),
                            child: InkWell(
                              onTap: () {
                                profileController.profileindex(1);
                                profileController.update();
                              },
                              child: Image.asset(
                                'assets/icons/profiledropdown.png',
                                height: 10,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 1, left: 10, right: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              'Residential Address',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kblue),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150, top: 20),
                            child: InkWell(
                              onTap: () {
                                profileController.profileindex(2);
                                profileController.update();
                              },
                              child: Image.asset(
                                'assets/icons/profiledropdown.png',
                                height: 10,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 1, left: 10, right: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      if (profileController.profileindex.value == 1)
                        ProfileOfficeAddreass(),
                      if (profileController.profileindex.value == 2)
                        ProfileResidentialAddressScreen()
                    ],
                  ),
                ),
              ),
            if (reghomeController.proindex.value == 1) ProfileDashboardScreen(),

            if (reghomeController.proindex.value == 2) ProfileOfferceScreen(),
            // if (reghomeController.proindex.value == 3)
            //   Container(
            //     width: MediaQuery.of(context).size.width - 195,
            //     child: Column(
            //       children: [
            //         Row(
            //           children: [
            //             Container(
            //               height: 45,
            //               width: MediaQuery.of(context).size.width - 195,
            //               decoration: BoxDecoration(color: kblue),
            //               child: Row(
            //                 children: [
            //                   InkWell(
            //                     onTap: () {
            //                       setState(() {
            //                         regshowController.showindex(0);
            //                         offersindex = 0;
            //                         regshowController.update();
            //                       });
            //                     },
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(left: 10),
            //                       child: Container(
            //                         height: 30,
            //                         width: 150,
            //                         decoration: BoxDecoration(
            //                             color:
            //                                 offersindex == 0 ? kyellow : kblue,
            //                             borderRadius: BorderRadius.circular(5),
            //                             border: offersindex == 0
            //                                 ? Border.all(color: kwhite)
            //                                 : null),
            //                         child: Center(
            //                             child: Text(
            //                           'Other Coupons',
            //                           style: TextStyle(
            //                             color:
            //                                 offersindex == 0 ? kwhite : kwhite,
            //                           ),
            //                         )),
            //                       ),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.only(left: 30),
            //                     child: InkWell(
            //                       onTap: () {
            //                         setState(() {
            //                           regshowController.showindex(1);
            //                           offersindex = 1;
            //                           regshowController.update();
            //                         });
            //                       },
            //                       child: Container(
            //                         height: 30,
            //                         width: 150,
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(5),
            //                           border: offersindex == 1
            //                               ? Border.all(color: kwhite)
            //                               : null,
            //                           color: offersindex == 1 ? kyellow : kblue,
            //                         ),
            //                         child: Center(
            //                             child: Text(
            //                           'Vendor Coupons',
            //                           style: TextStyle(
            //                             color:
            //                                 offersindex == 1 ? kwhite : kwhite,
            //                           ),
            //                         )),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //         // if (regshowController.showindex.value == 1)

            //     //    if (regshowController.showindex.value == 0)ProfileOfferceScreen()

            //       ],
            //     ),
            //   ),
            if (reghomeController.proindex.value == 4) ProfileSubscription(),
            if (reghomeController.proindex.value == 5) ProfileReferal(),
            if (reghomeController.proindex.value == 6) ProfilePartners(),
            if (reghomeController.proindex.value == 7) ProfileUpgradeScreen(),
            if (reghomeController.proindex.value == 8) ProfileSupport(),
            if (reghomeController.proindex.value == 9) ProfileWalletScreen()
          ]),
          ksizedbox20,
          RegisterCommonBottom()
        ]),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
