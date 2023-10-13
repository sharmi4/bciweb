import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/reg_profile_controller.dart';
import 'package:bciweb/views/authentication/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth_controller/auth_controller.dart';
import '../../../controller/profile_controller.dart';
import '../../../controller/profile_show_controller.dart';
import '../../../controller/service_controller/home_controller.dart';
import '../../../controller/setting_controller/setting_controller.dart';
import '../../../controller/subscription_controller/subscription_controller.dart';

import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';
import '../../registerhomescreen/business_comm_homecontainer.dart';
import '../members/common_widget/business_common_screen.dart';
import 'business_profile/accout_profile.dart';
import 'business_profile/bank_details_screen.dart';
import 'business_profile/business_gallery.dart';
import 'business_profile/business_profile_dashboard.dart';
import 'business_profile/business_support.dart';
import 'business_profile/business_yourreferal.dart';
import 'business_profile/update_accountprofile.dart';

class BusinessRegisterProfileScreen extends StatefulWidget {
  const BusinessRegisterProfileScreen({super.key});

  @override
  State<BusinessRegisterProfileScreen> createState() => _BusinessRegisterProfileScreenState();
}

class _BusinessRegisterProfileScreenState extends State<BusinessRegisterProfileScreen> {
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
          //Get.offAll(LandingScreen());
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

  callApis() async{
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      // setDefauld();
      authprofileController.getProfile();
      subscripeController.getcouponsList();
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
    
    callApis();
     setvalue();
    // plansController.getPlanDetails(id: int.parse(authprofileController.planId.value));
       
  }
  setvalue() async{
    
      await Future.delayed(Duration(seconds: 1));
       profileController.profileindex(0);
       profileController.update();
  
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
              BusinessCommonScreen(),
              BusinessCommonhomeContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),
      body: Obx(
        () => ListView(
          primary: true,
          scrollDirection: Axis.vertical,
          children: [
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
                                      'Gallery',
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
                            reghomeController.proindex(3);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(color: kwhite)),
                              color: reghomeController.proindex == 3
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
                                      'Bank Details',
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
                            reghomeController.proindex(4);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(color: kwhite)),
                              color: reghomeController.proindex == 4
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
                            reghomeController.proindex(5);
                            reghomeController.update();
                          },
                          child: Container(
                            width: 195,
                            height: 40,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 5
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
                            reghomeController.proindex(6);
                            reghomeController.update();
                            showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.white,
                        title: Column(
                          children: [
                            Image.asset('assets/images/logoutimage.png'),
                            Text("Comeback Soon!",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                        content:const Text(
                          "Are you sure want to logout?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      // ignore: unrelated_type_equality_checks
                                      color: kwhite),
                                  child: Center(
                                      child: Text("Cancel",
                                          style: TextStyle(
                                              color: kOrange))),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // authController.logoutindex(1);
                                  // authController.update();
                                  Get.find<AuthController>().businesslogoutWeb();
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: kOrange,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      "Logout",
                                      style:TextStyle(color: kwhite),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ksizedbox10
                        ],
                      );
                    });
                            //Get.offAll(LandingScreen());
                          },
                          child: Container(
                            width: 195,
                            height: 40,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 6
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
                      //   Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 20, top: 20),
                      //       child: Text(
                      //         'Profile Update',
                      //         style: TextStyle(
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.w500,
                      //             color: kblue),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(right: 150, top: 20),
                      //       child: InkWell(
                      //         onTap: () {
                      //           profileController.profileindex(1);
                      //           profileController.update();
                      //         },
                      //         child: Image.asset(
                      //           'assets/icons/profiledropdown.png',
                      //           height: 10,
                      //           fit: BoxFit.fitHeight,
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      if (profileController.profileindex.value == 0)
                        BusinessProfileSettings(),
                      //    if(profileController.profileindex.value==1)
                      // BusinessUpdateAccountScreen(),  
                      
                    
                      
                    ],
                  ),
                ),
              ),
                
             
            if (reghomeController.proindex.value == 1) BusinessProfileDashboardScreen(),

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
            
             if (reghomeController.proindex.value == 2) BusinessAddGallery(userid: authprofileController.profileData.first.id.toString(),),
            if (reghomeController.proindex.value == 4) BusinessProfileReferal(),
                if (reghomeController.proindex.value == 3)  BusinessBankDetailsScreen(),
            if (reghomeController.proindex.value == 5) BusinessProfileSupport(),
           

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
