import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paged_vertical_calendar/utils/date_utils.dart';

import '../../../../../constant/constans.dart';
import '../../../../../controller/auth_controller/auth_profile_controller.dart';
import '../../../../../controller/subscription_controller/subscription_controller.dart';
import '../../../mobile_wdgets/comomappbar.dart';
import '../../../mobile_wdgets/drawer.dart';

class MySubscriptionMobileScreen extends StatefulWidget {
  const MySubscriptionMobileScreen({super.key});

  @override
  State<MySubscriptionMobileScreen> createState() => _MySubscriptionMobileScreenState();
}

class _MySubscriptionMobileScreenState extends State<MySubscriptionMobileScreen> {
   bool isLoading = true;

  //  @override
  // void initState() {
  //   super.initState();
 
  // }


@override
void initState() {
  super.initState();
}
setDefault() async {
    await authprofileController.getProfile();
    if (authprofileController.planid.value != "") {
      await plansController.getPlanDetails(
          id: int.parse(authprofileController.planid.value));
    }

    setState(() {
      isLoading = false;
    });
  }


getCardNumber(String carNum){
       // Initialize an empty string to accumulate the formatted result
    String formattedResult = '';
      // Split the string into groups of 4 characters each and accumulate them with spaces
    for(int i=0; i< carNum.length; i += 4){
      formattedResult += carNum.substring(i,i + 4) + " "; 
    }
         // Remove the trailing space and print the formatted result
     formattedResult = formattedResult.trimRight();
      return formattedResult;

  }



 final plansController=Get.find<SubscriptionApiController>();
 final authprofileController = Get.find<AuthProfileController>();
  @override
  Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
            drawer: MobileDrawer(),
      body: GetBuilder<SubscriptionApiController>(builder: (_) {
        return Container(
              height: size.height,
              child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          plansController.subscriptionplan.isEmpty
                              ? Container(
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/offersnotavailableimage.png"),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "No Plans Found",
                                          style: primaryFont.copyWith(
                                              color: kblue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 220,
                                  width: 500,
                                  // color: Colors.red,
                                  child: Stack(
                                    children: [
                                      Container(
                                   height: 220,
                                  width: 500,
                                  alignment: Alignment.center,
                                        child: Image.network(
                                          plansController
                                              .subscriptionplan.first.cardImg,
                                          // height: 200,
                                          //width: size.width,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned(
                                        right: 15,
                                        top: 20,
                                        child: authprofileController.profileData.first
                                                .profilePicture.isEmpty
                                            ? Image.asset(
                                                'assets/icons/prfl.png',
                                                height: 50,
                                                width: 50,
                                              )
                                            : Container(
                                                height: 55,
                                                width: 55,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                      authprofileController
                                                          .profileData
                                                          .first
                                                          .profilePicture,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                      Positioned(
                                        top: 130,
                                        left: 50,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                             getCardNumber(plansController
                                            .subscriptionplan.first.cardNo),
                                              style:  GoogleFonts.orbitron(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                            ),
                                          const  SizedBox(
                                            height: 5,
                                           ),
                                            Text(
                                              authprofileController
                                                  .profileData.first.name,
                                              style:  GoogleFonts.orbitron(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 175,
                                        left: 135,
                                        child: Text(
                                          formatDate(plansController
                                            .subscriptionplan.first.createdAt.addDays(int.parse(plansController
                                            .subscriptionplan.first.validityDays)), [mm,"/",yy]),
                                          style: GoogleFonts.orbitron(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                      ),
                                      Positioned(
                                         top: 175,
                                        left: 65,
                                        child: Text(
                                          formatDate(plansController
                                            .subscriptionplan.first.createdAt, [mm,"/",yy]),
                                          style: GoogleFonts.orbitron(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          //const Image(image: AssetImage("assets/images/Group 4930.png"),height: 200,),
                          ksizedbox10,
                          plansController.subscriptionplan.isEmpty
                              ? Container()
                              : Text(
                                  plansController.subscriptionplan.first.title,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: kblue),
                                ),
                          ksizedbox10,
                          plansController.subscriptionplan.isEmpty
                              ? Container()
                              : Text(
                                  "₹${double.parse(plansController.subscriptionplan.first.saleAmount).toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: kOrange),
                                ),
                        ],
                      ),
                    ),
                    if (plansController.subscriptionplan.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Subcribe Details:',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  ksizedbox10,
                                  // const Icon(CupertinoIcons.suit_diamond,color: Colors.white,),
                                  plansController.subscriptionplan.isEmpty
                                      ? Container()
                                      : Container(
                                          width: size.width,
                                          child: Text(
                                            plansController.subscriptionplan
                                                .first.planDescription,
                                            maxLines: 13,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
            );
      }),
    );
  }
}