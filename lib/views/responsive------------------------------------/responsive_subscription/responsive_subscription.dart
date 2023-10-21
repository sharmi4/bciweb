import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/plans_controller.dart';
import 'package:bciweb/controller/subscription_controller/subscription_controller.dart';
import 'package:bciweb/views/responsive------------------------------------/responsive_subscription/respo_otc_payment_scereen.dart';
import 'package:bciweb/views/responsive------------------------------------/responsive_subscription/responsive_otc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../controller/subscribe_controllers.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';

class Subscribe1 extends StatefulWidget {
  const Subscribe1({super.key});

  @override
  State<Subscribe1> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe1> {
  // final settingsController = Get.find<SettingsController>();
  final plansController = Get.find<PlanController>();

  @override
  void initState() {
    super.initState();
    callApis();
  }

  String cardimgae = '';
  int temindex = 0;

  callApis() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // setDefauld();
      //  subscripeController.getcouponsList();

      settingsController.getplansList();
    });
  }

  final settingsController = Get.find<SubscriptionApiController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrangeAccent])),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 43,
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 3),
                child: Row(children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: kwhite,
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 2,
                              color: kgrey)
                        ]),
                    child: InkWell(
                        onTap: () {
                          Get.to(Subscribe1());
                        },
                        child: Icon(
                          Icons.search,
                          color: kblue,
                          size: 17,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Container(
                      height: 20,
                      width: 20,
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
                        size: 17,
                      ),
                    ),
                  ),
                ])),
          ]),
      body: GetBuilder<SubscriptionApiController>(builder: (_) {
        return settingsController.plansdataList.isEmpty
            ? Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/offersnotavailableimage.png"),
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
            : ListView(
                physics: const BouncingScrollPhysics(),
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "All Select Membership Cards\nChoose Anything",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                          color: Color(0xff003366)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 4, crossAxisCount: 2),
                      itemCount: settingsController.plansdataList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                temindex = index;
                                cardimgae = settingsController
                                    .plansdataList[index].cardImg;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 166,
                              decoration: BoxDecoration(
                                  color: temindex == index
                                      ? const Color(0xffFF9021)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: temindex == index
                                          ? Colors.transparent
                                          : const Color(0xff003366)),
                                  boxShadow: [
                                    if (temindex == index)
                                      const BoxShadow(
                                        color: Color(0xffFF9021),
                                        offset: Offset(0, 1),
                                        blurRadius: 5.0,
                                      ),
                                  ]),
                              child: Center(
                                child: Text(
                                  settingsController.plansdataList[index].title,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: temindex == index
                                          ? Colors.white
                                          : const Color(0xff003366)),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  settingsController.plansdataList.isEmpty
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.to(RespoOtcPayment(
                                      plansData: settingsController.plansdataList[
                                          settingsController.index.value],
                                    ));
                                  },
                                  child: Image(
                                image: cardimgae == ""
                                    ? NetworkImage(settingsController
                                        .plansdataList.first.cardImg)
                                    : NetworkImage(cardimgae),
                                height: 234,
                              )),
                            ],
                          ),
                        ),
                  if (settingsController.plansdataList.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          Get.to(RespoOtcPayment(
                            plansData: settingsController
                                .plansdataList[settingsController.index.value],
                          ));
                        },
                        child: Container(
                          width: size.width,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                            border: Border.all(color: const Color(0xffFFBF7E)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFFFF5C29),
                                blurRadius: 3.0,
                              )
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFFF5C29),
                                Color(0xFFFFCD38),
                              ],
                            ),
                          ),
                          child: const Text(
                            'Subscribe',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                ],
              );
      }),
    );
  }
}
