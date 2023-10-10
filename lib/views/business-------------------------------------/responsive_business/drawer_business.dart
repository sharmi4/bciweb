import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/profile_respo_business/respo_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../constant/constans.dart';

class DrawerBusiness extends StatelessWidget {
  DrawerBusiness({super.key});

  final authprofileController = Get.find<AuthProfileController>();

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
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  //   Get.to(RespoContact());
                },
                child: Text(
                  'Profile',
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
      ]),
    );
  }
}
