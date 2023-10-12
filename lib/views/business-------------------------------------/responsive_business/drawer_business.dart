import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/profile_respo_business/respo_profile_screen.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/respo_business_availability/respo_business_availability.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/respo_landing_screen.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/wallet_respo_business/respo_business_walllet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../constant/constans.dart';

class DrawerBusiness extends StatelessWidget {
  DrawerBusiness({super.key});

  final authprofileController = Get.find<AuthProfileController>();
  final authController=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kblue,
      shadowColor: kOrange,
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 10),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  //        Get.to(MobileHome());
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
                          Get.to(RespoBusinessAvailability());
                },
                child: Text(
                  'Availability',
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
                  'Wallet',
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
                                  style: TextStyle(fontSize: 16, color: kwhite),
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
   authController.isLogedin.isFalse
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
                ),   ]),
    );
  }
}
