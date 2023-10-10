import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/routes/app_pages.dart';
import 'package:bciweb/views/members/homescreens/reg_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constant/constans.dart';
import '../controller/auth_controller/auth_profile_controller.dart';
import '../controller/reg_home_controller.dart';
import '../views/authentication/landing_screen.dart';
import '../views/business-------------------------------------/services_screens/services_homescreen.dart';

class BusinessCommonhomeContainer extends StatefulWidget {
  
  BusinessCommonhomeContainer({super.key});

  @override
  State<BusinessCommonhomeContainer> createState() =>
      _BusinessCommonhomeContainerState();
}

class _BusinessCommonhomeContainerState extends State<BusinessCommonhomeContainer> {

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

  
  @override
  final reghomeController = Get.find<RegisterHomeController>();
  final authController = Get.find<AuthController>();
  final authProfileController = Get.find<AuthProfileController>();
  // final _homeController=Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.checkAuthendication();
    authProfileController.getProfile();
    checkForLoggedInState();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 0),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 180,
              color: Colors.deepOrange[50],
              child: Image.asset('assets/images/logo.png'),
            ),
            // ClipPath(
            //   clipper: ClipClipper(),
            //   child: Container(height: 70,width: 60,color:Colors.deepOrange[50],
            //   ),
            // ),

            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          reghomeController.reindex(0);
                          reghomeController.update();
                          Get.toNamed(Routes.MEMBHOME);
                        },
                        child: Text(
                          'HOME',
                          style: TextStyle(
                              color: reghomeController.reindex == 0
                                  ? kOrange
                                  : kblue),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.about_screens);
                            print("-------------------------");
                            reghomeController.reindex(1);
                            reghomeController.update();
                          },
                          child: Text(
                            'ABOUT',
                            style: TextStyle(
                                color: reghomeController.reindex == 1
                                    ? kOrange
                                    : kblue),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: TextButton(
                          onPressed: () {
                            reghomeController.reindex(2);
                            reghomeController.update();

                            Get.toNamed(Routes.SpecializedScreen);
                          },
                          child: Text(
                            'SPECIALIZED',
                            style: TextStyle(
                                color: reghomeController.reindex == 2
                                    ? kOrange
                                    : kblue),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: TextButton(
                          onPressed: () {
                            reghomeController.reindex(3);
                            reghomeController.update();
                            Get.toNamed(Routes.BUSINESSSERVICE);
                            //Get.toNamed(Routes.Service);
                          },
                          child: Text(
                            'SERVICE',
                            style: TextStyle(
                                color: reghomeController.reindex == 3
                                    ? korange
                                    : kblue),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: TextButton(
                          onPressed: () {
                            reghomeController.reindex(4);
                            reghomeController.update();
                            Get.toNamed(Routes.ClubHouse);
                          },
                          child: Text(
                            'CLUB HOUSE',
                            style: TextStyle(
                                color: reghomeController.reindex == 4
                                    ? kOrange
                                    : kblue),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: TextButton(
                          onPressed: () {
                            reghomeController.reindex(5);
                            reghomeController.update();
                            Get.toNamed(Routes.Gallery);
                          },
                          child: Text(
                            'GALLERY',
                            style: TextStyle(
                                color: reghomeController.reindex == 5
                                    ? kOrange
                                    : kblue),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: TextButton(
                          onPressed: () {
                            reghomeController.reindex(6);
                            reghomeController.update();

                            Get.toNamed(Routes.contact_screen);
                          },
                          child: Text(
                            'CONTACT',
                            style: TextStyle(
                                color: reghomeController.reindex == 6
                                    ? kOrange
                                    : kblue),
                          )),
                    ),
                   if(isLoggedIn==true)
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: TextButton(
                          onPressed: () {
                           
                            reghomeController.reindex(7);
                            reghomeController.update();
                              //Get.toNamed(Routes.BOOKINGS);
                            //  Get.to(Hstory());
                        
                          },
                          child: Text(
                            'BOOKINGS',
                            style: TextStyle(
                                color: reghomeController.reindex == 7
                                    ? kOrange
                                    : kblue),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Row(
                  children: [
                    //  Container(
                    //   height: 30,
                    //   width: 30,
                    //   decoration: BoxDecoration(
                    //    color: kwhite,
                    //    shape: BoxShape.circle,
                    //    boxShadow: <BoxShadow>[
                    //     BoxShadow(
                    //       offset: Offset(0.0, 0.75),
                    //       blurRadius: 2,
                    //       color: kgrey
                    //     )
                    //    ]
                    //   ),
                    //   child: Icon(Icons.search,color: kblue,),
                    //  ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: kwhite,
                            shape: BoxShape.circle,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  offset: Offset(0.0, 0.75),
                                  blurRadius: 2,
                                  color: kgrey)
                            ]),
                        child: Icon(
                          Icons.notifications,
                          color: kblue,
                        ),
                      ),
                    ),
                    // authController.isLogedin == false
                    //     ? Container(
                    //         width: 110,
                    //         color: Colors.white,
                    //       )
                    //     : Padding(
                    //         padding: const EdgeInsets.only(left: 10),
                    //         child: InkWell(
                    //           onTap: () {
                    //             //Get.toNamed(Routes.Subscrib);
                    //           },
                    //           child: Container(
                    //             height: 35,
                    //             width: 110,
                    //             decoration: BoxDecoration(
                    //                 gradient: LinearGradient(
                    //                     colors: [korange, kyellow]),
                    //                 borderRadius: BorderRadius.circular(15)),
                    //             child: Center(
                    //                 child: Text(
                    //               'Membership',
                    //               style: TextStyle(fontSize: 15, color: kwhite),
                    //             )),
                    //           ),
                    //         ),
                    //       ),
                    authController.isLogedin == false
                        ? Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: InkWell(
                              onTap: () {
                                  Get.to(LandingScreen());
                               // Get.toNamed(Routes.MobileVerification);
                              },
                              child: Container(
                                height: 35,
                                width: 110,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [korange, kyellow]),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Text(
                                  'Registration',
                                  style: TextStyle(fontSize: 15, color: kwhite),
                                )),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: InkWell(
                              onTap: () {
                                // Get.to(MobileVerificatio());
                                authController.logoutWeb();
                                Get.toNamed(Routes.BusinessMobileVerification);
                              },
                              child: Container(
                                height: 35,
                                width: 110,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [korange, kyellow]),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Text(
                                  'Logout',
                                  style: TextStyle(fontSize: 15, color: kwhite),
                                )),
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ),
            Obx(() => authController.isLogedin == true
                ? Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(children: [
                      GetBuilder<AuthProfileController>(builder: (_) {
                        return authProfileController.profileData.isNotEmpty
                            ? Text(authProfileController.profileData.first.name)
                            : Text('');
                      }),
                      //   Icon(Icons.expand_more),
                      kwidth10,
                      GetBuilder<AuthProfileController>(builder: (_) {
                        return authProfileController.profileData.isNotEmpty
                            ? authProfileController
                                        .profileData.first.profilePicture !=
                                    null
                                ? InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterProfileScreen()));
                                    },
                                    child: CircleAvatar(
                                        radius: 22.0,
                                        backgroundImage: NetworkImage(
                                          authProfileController
                                              .profileData.first.profilePicture,
                                        )),
                                  )
                                //:Text('')
                                : Image.asset(
                                    'assets/images/nick.png',
                                    height: 35,
                                    fit: BoxFit.fitHeight,
                                  )
                            //:Text('');
                            : Image.asset(
                                'assets/images/nick.png',
                                height: 35,
                                fit: BoxFit.fitHeight,
                              );
                      })
                    ]),
                  )
                : Text('')),
          ],
        ),
      ),
    );
  }
}
