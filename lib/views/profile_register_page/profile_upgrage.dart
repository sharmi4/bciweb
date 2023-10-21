
import 'package:bciweb/controller/plans_controller.dart';
import 'package:bciweb/controller/setting_controller/setting_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/constans.dart';
import '../../controller/subscription_controller/subscription_controller.dart';
import '../members/subscribe/views/payment.dart';

class ProfileUpgradeScreen extends StatefulWidget {
  const ProfileUpgradeScreen({super.key});

  @override
  State<ProfileUpgradeScreen> createState() => _ProfileUpgradeScreenState();
}

class _ProfileUpgradeScreenState extends State<ProfileUpgradeScreen> {
  String cardimgae = '';
  int temindex = 0;
  final subscripeController = Get.find<SubscriptionApiController>();
  final subscriptionapiController = Get.find<SubscriptionApiController>();
   final settingsController = Get.find< ApiSettingController>();
  final plansController = Get.find<PlanController>();

  final planController = Get.find<PlanController>();

  callApis() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // setDefauld();
      //  subscripeController.getcouponsList();

      subscriptionapiController.getplansList();
    });
  }

  @override
  void initState() {
    super.initState();
    // setDefauld();
    // subscripeController.getcouponsList();
    // authprofileController.getProfile();
    // apisettingController.getwalletList();
    // apisettingController.generateReferralCode();
    // apisettingController.ourPartner();
    callApis();
    // plansController.getPlanDetails(id: int.parse(authprofileController.planId.value));
  }

  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionApiController>(builder: (_) {
      return Container(
        // width:double.infinity,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width - 195,
        child: ListView(
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // RegisterCommonContainer(),
            Container(
              child: Stack(
                children: [
                  Image.asset('assets/images/Group 39757.png'),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'Subscribe',
                        style: GoogleFonts.lato(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: kwhite),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ksizedbox30,
            Text(
              'Select Membership',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff003366),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            ksizedbox10,
            const Text(
              "All Select Membership Cards Choose Anything",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  color: Color(0xff003366)),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Container(
                    height: 500,
                    width: 600,
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount:
                            subscriptionapiController.plansdataList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 40,
                            crossAxisSpacing: 40,
                            childAspectRatio: 6,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print(
                                  "------------------------------------------------${subscriptionapiController.plansdataList[index].cardImg}");
                              setState(() {
                                temindex = index;
                                cardimgae = subscriptionapiController
                                    .plansdataList[index].cardImg;
                              });
                            },
                            child: Container(
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: temindex == index ? kOrange : kwhite,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color:
                                          temindex == index ? kwhite : kblue)),
                              child: Text(
                                subscriptionapiController
                                    .plansdataList[index].title,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: temindex == index ? kwhite : kblue),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(Payment(
                            image: subscriptionapiController
                                .plansdataList[temindex].cardImg,
                            htext: subscriptionapiController
                                .plansdataList[temindex].title,
                            text: subscriptionapiController
                                .plansdataList[temindex].planDescription,
                            id: subscriptionapiController
                                .plansdataList[temindex].id, plansData:  subscriptionapiController.plansdataList[
                                      temindex],));
                      },
                      child: subscriptionapiController.plansdataList.isEmpty
                          ? Container()
                          : Image(
                              image: cardimgae == ""
                                  ? NetworkImage(subscriptionapiController
                                      .plansdataList.first.cardImg)
                                  : NetworkImage(cardimgae),
                              height: 234,
                            ),
                    ),
                    ksizedbox20,
                    InkWell(
                      onTap: () {
                      




                        Get.to(
                          Payment(
                              image: subscriptionapiController
                                  .plansdataList[temindex].cardImg,
                              htext: subscriptionapiController
                                  .plansdataList[temindex].title,
                              text: subscriptionapiController
                                  .plansdataList[temindex].planDescription,
                              id: subscriptionapiController
                                  .plansdataList[temindex].id, plansData:  subscriptionapiController.plansdataList[
                                      temindex],),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 400,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFFF5C29),
                                Color(0xFFFFCD38),
                              ],
                            ),
                          ),
                          child: Text(
                            'Subscribe',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
