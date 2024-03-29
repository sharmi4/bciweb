import 'package:bciweb/views/business-------------------------------------/respo_business_notification/respo_business_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/constans.dart';
import '../../business-------------------------------------/responsive_business/home_respo/busimess_home_respo.dart';

class AppBarMob extends StatelessWidget {
  const AppBarMob({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange,
                Colors.deepOrangeAccent,
              ],
            ),
          ),
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
                        Get.offAll(BusinesHomeRespo());
                      //  Get.offAll(Subscribe1());
                    },
                    child: Icon(
                      Icons.search,
                      color: kblue,
                      size: 17,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                  
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {
                      //  Get.offAll(BusinesHomeRespo());
                      },
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
                        child: InkWell(
                          onTap: () {
                            Get.offAll( RespoBusinessNotification());
                          },
                          child: Icon(
                            Icons.notifications,
                            color: kblue,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
             
              ])),
        ]);
  }
}
