import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_plus/share_plus.dart';

import '../../constant/constans.dart';
import '../../controller/setting_controller/setting_controller.dart';

class ProfileReferal extends StatefulWidget {
  const ProfileReferal({super.key});

  @override
  State<ProfileReferal> createState() => _ProfileReferalState();
}

class _ProfileReferalState extends State<ProfileReferal> {
    final apisettingController = Get.find<ApiSettingController>();
  @override
  Widget build(BuildContext context) {
    return Container(
                width: MediaQuery.of(context).size.width - 195,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Center(
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.74,
                            width: MediaQuery.of(context).size.width * 0.29,
                            decoration: BoxDecoration(
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kgrey)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        'assets/images/referalimage.png',
                                        height: 180,
                                        fit: BoxFit.fitHeight),
                                  ],
                                ),
                                ksizedbox10,
                                Text(
                                  'Referral Code',
                                  style: TextStyle(fontSize: 23, color: kblue),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 15),
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: kwhite,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              offset: Offset(0.0, 0.75),
                                              blurRadius: 2,
                                              color: kgrey)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            apisettingController
                                                .referralCode.value,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: kblue,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                FlutterClipboard.copy(
                                                        apisettingController
                                                            .referralCode.value)
                                                    .then(
                                                  (value) =>
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "Copy to clipboard",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .CENTER,
                                                          timeInSecForIosWeb: 1,
                                                          backgroundColor:
                                                              kblue,
                                                          textColor:
                                                              Colors.white,
                                                          fontSize: 16.0),
                                                  //print("code copied")
                                                );
                                              },
                                              child: Image.asset(
                                                'assets/images/Icon awesome-copy.png',
                                                height: 30,
                                                fit: BoxFit.fitHeight,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                             
                                ksizedbox40,
                                GestureDetector(
                                  onTap: () {
                                    String referralmsg =
                                        "Use my referral code ${apisettingController.referralCode.value} when you sign up, and we'll both receive fantastic rewards. Don't forget to click on the link below to download the app and start enjoying the perks right away!\n\n";

                                    Share.share('$referralmsg');
                                  },
                                  child: Container(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      decoration: BoxDecoration(
                                          color: korange,
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                offset: Offset(0.0, 0.75),
                                                blurRadius: 5,
                                                color: kyellow)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text('Share Now',
                                              style: TextStyle(
                                                  color: kwhite,
                                                  fontSize: 20)))),
                                )
                              ]),
                            )),
                      ),
                    )
                  ],
                ),
              );
  }
}