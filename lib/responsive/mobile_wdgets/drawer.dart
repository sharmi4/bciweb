import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/responsive/booking_view/booking_screen.dart';
import 'package:bciweb/responsive/holiday/holiday_home.dart';
import 'package:bciweb/responsive/mobile_wdgets/resmembership/mobile_subscription.dart';
import 'package:bciweb/responsive/respo%20gallery/respo_gallery.dart';
import 'package:bciweb/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller/auth_controller.dart';
import '../authentications/contact us/respo_contact.dart';
import '../authentications/generate_otp/generate_otp.dart';
import '../holiday/holidaybookings.dart';
import '../respo_services/respo_service.dart';
import '../mobile_body/mobile_home.dart';
import '../respo_services/widgets/resprofile/mobile_profile_screen.dart';
import '../specialized/respo_specialized.dart';
import 'clubhousee.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  final authController = Get.find<AuthController>();
  final authprofileController=Get.find<AuthProfileController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.checkAuthendication();
    authprofileController.getProfile();
  }





  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kblue,
      shadowColor: kOrange,
      child:  ListView(
          children: [
            Row(
              children: [
                // Image.asset('')
              ],
            ),
            //   ksizedbox40,
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.to(MobileHome());
                      },
                      child: Text(
                        'HOME',
                        style: TextStyle(fontSize: 16, color: kwhite),
                      ))
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
                       // Get.to(HolidayScreen());
                        Get.to(HolidayHomeScreen());
                      },
                      child: Text(
                        'TRIP ',
                        style: TextStyle(fontSize: 16, color: kwhite),
                      )),
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
                        Get.to(RespoContact());
                      },
                      child: Text(
                        'CONTACT ',
                        style: TextStyle(fontSize: 16, color: kwhite),
                      )),
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
                        Get.to(RespoServices());
                      },
                      child: Text(
                        'SERVICES',
                        style: TextStyle(fontSize: 16, color: kwhite),
                      ))
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
                        Get.to(Get.to(RespoSpecialized()));
                        //  Get.to(RespoServices());
                      },
                      child: Text(
                        'SPECIALIZED',
                        style: TextStyle(fontSize: 16, color: kwhite),
                      ))
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
                        Get.to(RespoGallery());
                        //Get.to(RespoServices());
                      },
                      child: Text(
                        'GALLERY',
                        style: TextStyle(fontSize: 16, color: kwhite),
                      ))
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
                        Get.to(ClubHousemob());
                      },
                      child: Text(
                        'CLUB HOUSE',
                        style: TextStyle(fontSize: 16, color: kwhite),
                      ))
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
                        Get.to(const MembersBookingCommonContainer());
                      },
                      child: Text(
                        'BOOKINGS',
                        style: TextStyle(fontSize: 16, color: kwhite),
                      ))
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
                        Get.to(MobileSubscription());
                      },
                      child: Text(
                        'MEMBERSHIP',
                        style: TextStyle(fontSize: 16, color: kwhite),
                      ))
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
                        Get.to(MobileProfileScreen());
                      },
                      child: GetBuilder<AuthProfileController>(
                        builder: (_){
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
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(authprofileController.profileData.first.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: kwhite
                                    ),),
                                  )
                            ],
                          ):

                     Row(
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
                     ):
                     
                     Row(
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
                        }
            
                      )
                      )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
              child: Divider(
                color: kgrey,
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
                            Get.toNamed(Routes.MobLogin);
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
                            Get.to(MemberLoginScreenrespo());
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
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 20),
              child: Row(children: [
                Image.asset(
                  'assets/images/phoneimage.png',
                  height: 15,
                  fit: BoxFit.fitHeight,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Text(
                    '+91  9884 551 551 ',
                    style: TextStyle(color: kwhite, fontSize: 12),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 7),
              child: Row(
                children: [
                  Icon(
                    Icons.mail,
                    color: kwhite,
                    size: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Text(
                      'customercare@bcipvtltd.com',
                      style: TextStyle(color: kwhite, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 7),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 15,
                    color: kwhite,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Chennai, Tamilnadu - 600026',
                      style: TextStyle(fontSize: 13, color: kwhite),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23, top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  'Follow Us :',
                  style: TextStyle(color: kwhite, fontSize: 13),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Image.asset(
                    'assets/images/facebook.png',
                    height: 15,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Image.asset(
                    'assets/images/twitter.png',
                    fit: BoxFit.fitHeight,
                    height: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Image.asset(
                    'assets/images/linkedin.png',
                    height: 15,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Image.asset(
                    'assets/images/instagram.png',
                    height: 15,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Image.asset(
                    'assets/images/whatsappimage.png',
                    height: 15,
                    fit: BoxFit.fitHeight,
                  ),
                )
              ]),
            ),
          ],
        ),
      
    );
  }
}
