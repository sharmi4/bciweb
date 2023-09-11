import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

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
    if (authprofileController.planid != "") {
      plansController.getPlanDetails(id: authprofileController.planid.value);
    } else {}
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
            padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
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
                              Image.network(
                                plansController.subscriptionplan.first.cardImg,
                                height: 200,
                                width: 400,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                left: 15,
                                top: 130,
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
                                top: 155,
                                left: 80,
                                child: Text(
                                  authprofileController.profileData.first.name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    plansController.subscriptionplan.isEmpty
                        ? const Text("")
                        : Text(plansController
                            .subscriptionplan.first.planDescription),
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
