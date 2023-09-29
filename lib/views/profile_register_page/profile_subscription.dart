import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paged_vertical_calendar/utils/date_utils.dart';
import '../../constant/constans.dart';
import '../../controller/auth_controller/auth_profile_controller.dart';
import '../../controller/subscription_controller/subscription_controller.dart';

class ProfileSubscription extends StatefulWidget {
  const ProfileSubscription({super.key});

  @override
  State<ProfileSubscription> createState() => _ProfileSubscriptionState();
}

class _ProfileSubscriptionState extends State<ProfileSubscription> {
  final authprofileController = Get.find<AuthProfileController>();
   final plansController = Get.find<SubscriptionApiController>();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    plan();
  }

  plan() {
    authprofileController.getProfile();
    if (authprofileController.planid != "") {
      plansController.getPlanDetails(id: authprofileController.planid.value);
    } else {}
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/images/subscriptionbackimage.png',
              ),
              fit: BoxFit.cover,
            )),
            width: MediaQuery.of(context).size.width * 0.8471,
            child: Center(
              child: Text(
                'SUBSCRIBE',
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: kwhite),
              ),
            ),
          ),
          // Image.asset('assets/images/Group 39757.png'),

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 30, top: 40),
            child: GetBuilder<SubscriptionApiController>(builder: (_) {
              return GetBuilder<AuthProfileController>(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    plansController.subscriptionplan.isEmpty
                        ? Image.asset('assets/images/si1.png',
                            height: 200, fit: BoxFit.fitHeight)
                        : Stack(
                            children: [
                               Container(
                                 height: 220,
                                width: 500,
                                alignment: Alignment.center,
                                      child: Image.network(
                                        plansController.subscriptionplan.first.cardImg,
                                        // height: 200,
                                        //width: size.width,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                               
                              Positioned(
                                right: 80,
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
                                                ))),
                                      ),
                              ),
                              Positioned(
                                top: 130,
                                left: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                     Text(
                                           getCardNumber(plansController.subscriptionplan.first.cardNo),
                                            style:  GoogleFonts.orbitron(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                    Text(
                                      authprofileController.profileData.first.name,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                             
                                       Positioned(
                                       top: 180,
                                      left: 145,
                                      child: Text(
                                        formatDate(plansController
                                          .subscriptionplan.first.createdAt, [mm,"/",yy]),
                                        style: GoogleFonts.orbitron(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                      Positioned(
                                      top: 180,
                                      left: 220,
                                      child: Text(
                                        formatDate(plansController.subscriptionplan.first.createdAt.addDays(int.parse(plansController.subscriptionplan.first.validityDays)), 
                                        [mm,'/',yyyy]),
                                        style: GoogleFonts.orbitron(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                            ],
                          ),
                        
                    const SizedBox(
                      width: 10,
                    ),
                    plansController.subscriptionplan.isEmpty
                        ? const Text("")
                        : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(plansController.subscriptionplan.first.title,
                             style: TextStyle(
                              fontSize: 21,
                              color: kblue,
                              fontWeight: FontWeight.w600
                             ),),
                             ksizedbox10,
                             Text(
                                "₹${double.parse(plansController.subscriptionplan.first.saleAmount).toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    color: kOrange),
                              ),
                              ksizedbox10,
                              Text(
                                  'Subcribe Details:',
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                ksizedbox10,
                            Container(
                              width:  MediaQuery.of(context).size.width * 0.4,
                            
                              child: Text(plansController
                                  .subscriptionplan.first.planDescription,
                                  maxLines: 13,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400
                                  ),),
                            ),
                          ],
                        ),
                  ],
                );
              });
            }),
          )
        ],
      ),
    );
  }
}
