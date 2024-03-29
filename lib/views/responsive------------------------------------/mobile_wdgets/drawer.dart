import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/respo_landing_screen.dart';
import 'package:bciweb/views/responsive------------------------------------/authentications/generate_otp/generate_otp.dart';
import 'package:bciweb/views/responsive------------------------------------/booking_view/booking_screen.dart';
import 'package:bciweb/views/responsive------------------------------------/holiday/holiday_home.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/resmembership/mobile_subscription.dart';
import 'package:bciweb/views/responsive------------------------------------/respo%20gallery/respo_gallery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/auth_controller/auth_controller.dart';
import '../authentications/contact us/respo_contact.dart';
import '../bus/bus_screen.dart';
import '../hottel/search_hotel_screen.dart';
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
  final authController = Get.find<AuthController>();
  final authprofileController = Get.find<AuthProfileController>();
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
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(const MobileHome());
                  },
                  child: Text(
                    'HOME',
                    style: TextStyle(fontSize: 16, color: kwhite),
                  ),
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
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 8),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      Get.to(const BusScreen());
                      // Get.to(HolidayHomeScreen());
                    },
                    child: Text(
                      'BUS',
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
                      Get.to(const SerchHotelScreen());
                      //Get.to(HolidayHomeScreen());
                    },
                    child: Text(
                      'HOTEL',
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
                      // Get.to(HolidayScreen());
                      Get.to(const HolidayHomeScreen());
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
                      Get.to(const RespoContact());
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
                      Get.to(const RespoGallery());
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
                      Get.to(const ClubHousemob());
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
                      // if(isLoggedIn==true){
                      //   Get.to(const MembersBookingCommonContainer());
                      // }else{
                      //     Get.to(const RespoLanding());
                        
                      //   // Get.to(MemberLoginScreenrespo());
                      // }
                     
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
          authController.isLogedin.isTrue
              ? Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.offAll(const MobileProfileScreen());
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
                                              authprofileController.profileData
                                                  .first.profilePicture,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              authprofileController
                                                  .profileData.first.name,
                                              style: TextStyle(
                                                  fontSize: 18, color: kwhite),
                                            ),
                                          )
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
                                            padding:
                                                const EdgeInsets.only(left: 15),
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
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          'PROFILE',
                                          style: TextStyle(
                                              fontSize: 16, color: kwhite),
                                        ),
                                      ),
                                    ],
                                  );
                          },
                        ),
                      )
                    ],
                  ),
                )
              : const Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
          authController.isLogedin.isTrue
              ? Padding(
                  padding: const EdgeInsets.only(top: 7,),
                  child: Divider(
                    color: kgrey,
                  ),
                )
              : const Text(""),
          authController.isLogedin.isFalse
              ? Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.offAll(()=> const MemberLoginScreenrespo());
                          Get.to(const RespoLanding());

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
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(const RespoLanding());
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
                  authController.isLogedin.isFalse
              ? Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.offAll(()=> const MemberLoginScreenrespo());
                          Get.to(const RespoLanding());

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
              : Container(),
                ]
              ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(children: [
              Image.asset(
                'assets/images/phoneimage.png',
                height: 15,
                fit: BoxFit.fitHeight,
              ),
              InkWell(
                  onTap: (){
                     launchUrl(Uri.parse("tel:9884551551"));
                  },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Text(
                    '+91  9884 551 551 ',
                    style: TextStyle(color: kwhite, fontSize: 12),
                  ),
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
                InkWell(
                  onTap: (){
                     launchUrl(Uri.parse("mailto:customercare@bcipvtltd.com"));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Text(
                      'customercare@bcipvtltd.com',
                      style: TextStyle(color: kwhite, fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 7),
            child: InkWell(
              onTap: ()async{
                 await launchUrl(Uri.parse("https://www.google.com/search?client=ms-android-oneplus-rvo3&sca_esv=595946801&cs=0&output=search&q=Benze+Club+International+Pvt.Ltd&ludocid=10196856849577630497&ibp=gwp;0,7&lsig=AB86z5UBkz5L8tYpXLWTwqQvypY7&kgs=5d9694caf30ce3db&shndl=-1&shem=lscsce,lsp&source=sh/x/loc/hdr/m1/2"));
              },
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23, top: 10, bottom: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'Follow Us :',
                style: TextStyle(color: kwhite, fontSize: 13),
              ),
              InkWell(
                onTap: (){
                 launchUrl(Uri.parse(
                                            "https://www.facebook.com/benzclubinternational"));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    'assets/images/facebook.png',
                    height: 15,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                     launchUrl(Uri.parse(
                                                "https://twitter.com/happybcigroup"));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    'assets/images/twitter.png',
                    fit: BoxFit.fitHeight,
                    height: 15,
                  ),
                ),
              ),
             
              InkWell(
                onTap: (){
                   launchUrl(Uri.parse(
                                            "https://www.instagram.com/benzeclubinternational"));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    'assets/images/instagram.png',
                    height: 15,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              
            ]),
          ),
        ],
      ),
    );
  }
}
