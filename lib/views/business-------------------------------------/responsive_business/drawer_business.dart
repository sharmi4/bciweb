import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/authentication/businness_login.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/home_respo/busimess_home_respo.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/profile_respo_business/respo_profile_screen.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/respo_business_addgallery/respo_business_addgallery.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/respo_business_availability/respo_business_availability.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/respo_business_booking/respo_business_booking.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/respo_business_couponredemption/respo_business_couponredemption.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/respo_business_createcoupons/respo_business_createcoupons.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/respo_business_offers/respo_business_offers.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/respo_landing_screen.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/wallet_respo_business/respo_business_walllet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constant/constans.dart';

class DrawerBusiness extends StatefulWidget {
  DrawerBusiness({super.key});

  @override
  State<DrawerBusiness> createState() => _DrawerBusinessState();
}

class _DrawerBusinessState extends State<DrawerBusiness> {

  bool isLoggedIn =false;
    checkForLoggedInState() async {
    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString('auth_token');
    print("Token is here");
    print(authtoken);
    if (authtoken == "null" || authtoken == null) {
      setState(() {
        isLoggedIn = false;
      });
    } else {
      setState(() {
        isLoggedIn = true;
      });
    }
  }

  final authprofileController = Get.find<AuthProfileController>();

  final authController = Get.find<AuthController>();
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.checkAuthendicationbusiness();
    authprofileController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kblue,
      shadowColor: kOrange,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                Get.to(BusinesHomeRespo());
                  },
                  child: Text(
                    'HOME',
                    style: TextStyle(fontSize: 16, color: kwhite),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Divider(
              color: kgrey,
            ),
          ),






            Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
            children: [
            TextButton(
            onPressed: () {
            Get.to(RespoBusinessAddGallery(  userid: authprofileController.profileData.first.id.toString()));
            },
                  child: Text(
                    'ADD GALLERY',
                    style: TextStyle(fontSize: 16, color: kwhite),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Divider(
              color: kgrey,
            ),
          ),








          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(RespoBusinessCreateCoupons());
                  },
                  child: Text(
                    'CREATE COUPONS',
                    style: TextStyle(fontSize: 16, color: kwhite),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Divider(
              color: kgrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(RespoBusinessCouponredemption());
                  },
                  child: Text(
                    'COUPON REDEMPTION',
                    style: TextStyle(fontSize: 16, color: kwhite),
                  ),
                ),
              ],
            ),
          ),
          //   Padding(
          //   padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
          //   child: Divider(
          //     color: kgrey,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 30, left: 10),
          //   child: Row(
          //     children: [
          //       TextButton(
          //         onPressed: () {
          //           Get.to(CreateCouponsScreen());
          //           // if(isLoggedIn==true){
          //           //   Get.to(RespoBusinessBookings());
          //           // }else{
          //           //       Get.to(const RespoLanding());
                      
          //           // }
                 
          //         },
          //         child: Text(
          //           'CREATE COUPON',
          //           style: TextStyle(fontSize: 16, color: kwhite),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Divider(
              color: kgrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(RespoBusinessBookings());
                    // if(isLoggedIn==true){
                    //   Get.to(RespoBusinessBookings());
                    // }else{
                    //       Get.to(const RespoLanding());
                      
                    // }
                 
                  },
                  child: Text(
                    'BOOKINGS',
                    style: TextStyle(fontSize: 16, color: kwhite),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Divider(
              color: kgrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(RespoBusinessAvailability());
                  },
                  child: Text(
                    'AVILABILITY',
                    style: TextStyle(fontSize: 16, color: kwhite),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Divider(
              color: kgrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(RespoBusinessOffers());
                  },
                  child: Text(
                    'OFFERS',
                    style: TextStyle(fontSize: 16, color: kwhite),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Divider(
              color: kgrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(RespoBusinessWallet());
                  },
                  child: Text(
                    'WALLET',
                    style: TextStyle(fontSize: 16, color: kwhite),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
            child: Divider(
              color: kgrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(BusinessProfileRespo());
                  },
                  child: GetBuilder<AuthProfileController>(
                    builder: (_) {
                      return authprofileController.profileData.isNotEmpty
                          ? authprofileController
                                      .profileData.first.profilePicture !=
                                  null
                              ? Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22.0,
                                      backgroundImage: NetworkImage(
                                        authprofileController
                                            .profileData.first.profilePicture,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        authprofileController
                                            .profileData.first.name,
                                        style: TextStyle(
                                            fontSize: 18, color: kwhite),
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/nick.png',
                                      height: 30,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        'PROFILE',
                                        style: TextStyle(
                                            fontSize: 16, color: kwhite),
                                      ),
                                    ),
                                  ],
                                )
                          : Row(
                              children: [
                                Image.asset(
                                  'assets/images/nick.png',
                                  height: 30,
                                  fit: BoxFit.fitHeight,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    'PROFILE',
                                    style:
                                        TextStyle(fontSize: 16, color: kwhite),
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
                )
              ],
            ),
          ),

  // const Text(""),
         Obx(() =>  Column(
              children: [
                authController.isbusinessLogedin.isTrue
                    ? Padding(
                        padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
                        child: Divider(
                          color: kgrey,
                        ),
                      )
                    : const Text(""),
          
          
                authController.isbusinessLogedin.isFalse
                    ? Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                // Get.offAll(()=> const MemberLoginScreenrespo());
                                Get.to(RespoLanding());
          
                                //    Get.toNamed(Routes.MobLogin);
          
                                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MemberLoginScreenrespo()));
                              },
                              child: Container(
                                height: 30,
                                width: 110,
                                decoration: BoxDecoration(
                                    gradient:
                                        LinearGradient(colors: [kyellow, kOrange]),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Text(
                                    'REGISTER',
                                    style: TextStyle(color: kwhite),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(RespoLanding());
                              },
                              child: Container(
                                height: 30,
                                width: 110,
                                decoration: BoxDecoration(
                                    gradient:
                                        LinearGradient(colors: [kyellow, kOrange]),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Text(
                                    'LogOut',
                                    style: TextStyle(color: kwhite),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                       authController.isbusinessLogedin.isFalse
                    ? Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                // Get.offAll(()=> const MemberLoginScreenrespo());
                                Get.to(RespoLanding());
          
                                //    Get.toNamed(Routes.MobLogin);
          
                                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MemberLoginScreenrespo()));
                              },
                              child: Container(
                                height: 30,
                                width: 110,
                                decoration: BoxDecoration(
                                    gradient:
                                        LinearGradient(colors: [kyellow, kOrange]),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Text(
                                    'LogIn',
                                    style: TextStyle(color: kwhite),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
