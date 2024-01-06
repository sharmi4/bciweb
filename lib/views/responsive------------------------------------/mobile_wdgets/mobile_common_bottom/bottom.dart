import 'package:bciweb/views/responsive------------------------------------/privacypolicy/privacy_respo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../constant/constans.dart';

class MobileCommonBottom extends StatefulWidget {
  const MobileCommonBottom({super.key});

  @override
  State<MobileCommonBottom> createState() => _MobileCommonBottomState();
}

class _MobileCommonBottomState extends State<MobileCommonBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kblue,
      child: Padding(
        padding:const EdgeInsets.only(bottom: 20,left: 10,right: 10,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Privacy & Policy",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xffEF5323),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const RespoPrivacyPolicy());
                  },
                  child:const Text(
                    "Disclaimer",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const RespoDisclimer());
                  },
                  child: const Text(
                    "Privacy",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
               const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const RespoRepresentation());
                  },
                  child:const Text(
                    "Representation",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const SarviceAgrement());
                  },
                  child: const Text(
                    "Service Agreement",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const Tccc());
                  },
                  child:const Text(
                    "T & C",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contact Us",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xffEF5323),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                      const Icon(Icons.call,size: 17,color: Colors.white,),
                   const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: (){
                        launchUrl(Uri.parse("tel:9884551551"));
                      },
                      child: Text(
                        "+91  9884 551 551",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                     const Icon(Icons.call,size: 17,color: Colors.white,),
                   const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: (){
                        launchUrl(Uri.parse("tel:9884660660"));
                      },
                      child: Text(
                        "+91  9884 660 660",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                   const Icon(Icons.email,size: 17,color: Colors.white,),
                   const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: (){

                        launchUrl(Uri.parse("mailto:customercare@bcipvtltd.com"));

                      },
                      child: const Text(
                        "customercare@bcipvtltd.com",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
