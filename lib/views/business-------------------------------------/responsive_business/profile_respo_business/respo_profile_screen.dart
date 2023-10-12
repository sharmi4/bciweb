import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/profile_respo_business/respo_business_bankdetails.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/profile_respo_business/respo_business_referal.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/profile_respo_business/respo_business_support.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/profile_respo_business/respo_bussiness_dashboard.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/profile_respo_business/settings_myaccount_respo.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class BusinessProfileRespo extends StatelessWidget {
  const BusinessProfileRespo({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarMob(),
        preferredSize: Size(double.infinity, 40),
      ),
      drawer: DrawerBusiness(),
      body: ListView(
        children: [
          ksizedbox20,
          GestureDetector(
            onTap: () {
              Get.to(BusinessMyAccountRespo());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: kblue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        'My Account',
                        style: TextStyle(
                            fontSize: 22,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          GestureDetector(
            onTap: () {

               Get.to(RespoBusinessBankDetails());
               
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.comment_bank,
                      color: kblue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,),
                      child: Text(
                        'Bank Details',
                        style: TextStyle(
                            fontSize: 22,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          GestureDetector(
            onTap: () {
                  Get.to(RespoBussinessDashboard());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.dashboard,
                      color: kblue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, ),
                      child: Text(
                        'Dashboard',
                        style: TextStyle(
                            fontSize: 22,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(RespoBusinessReferal());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_add,
                      color: kblue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, ),
                      child: Text(
                        'Your Referral',
                        style: TextStyle(
                            fontSize: 22,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          GestureDetector(
            onTap: () {
              // Get.to(const SubscriptionScreen());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.subscriptions_rounded,
                      color: kblue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, ),
                      child: Text(
                        'Package Subscription',
                        style: TextStyle(
                            fontSize: 22,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
              color: kgrey,
            ),
          ),
          GestureDetector(
            onTap: () {
               Get.to(RespoBusinessSupport());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.support,
                      color: kblue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, ),
                      child: Text(
                        'Support',
                        style: TextStyle(
                            fontSize: 22,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ksizedbox10,
          // Padding(
          //   padding: const EdgeInsets.only(left: 10, right: 10),
          //   child: Divider(
          //     thickness: 1,
          //     color: kgrey,
          //   ),
          // ),
          // GestureDetector(
          //   onTap: () {
          //     // showDialog(
          //     //   context: context,
          //     //   builder: (BuildContext context) {
          //     //     return mAlertItem2;
          //     //   });

          //     //Get.find<AuthController>().logout();
          //   },
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 20),
          //       child: Row(
          //         children: [
          //           Image.asset('assets/images/settinglogout.png'),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10, top: 6),
          //             child: Text(
          //               'LogOut',
          //               style: TextStyle(
          //                   fontSize: 22,
          //                   color: kblue,
          //                   fontWeight: FontWeight.w500),
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
