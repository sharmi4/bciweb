import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/setting_controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../mobile_wdgets/comomappbar.dart';

class MobilePartnerScreen extends StatefulWidget {
  const MobilePartnerScreen({super.key});

  @override
  State<MobilePartnerScreen> createState() => _MobilePartnerScreenState();
}

class _MobilePartnerScreenState extends State<MobilePartnerScreen> {
  var settingController = Get.find<ApiSettingController>();
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settingController.ourPartner();
  }
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      body:  GetBuilder<ApiSettingController>(builder: (_) {
        return  settingController.ourPartnersData.isNotEmpty? GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: settingController.ourPartnersData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 410,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2, color: Colors.grey.withOpacity(0.5))
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                            height: 90,
                            child: Image.network(
                              settingController.ourPartnersData[index].image,
                              fit: BoxFit.fill,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7, top: 2),
                        child: Container(
                          width: size.width,
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              settingController.ourPartnersData[index].title,
                              style: primaryFont.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 7, top: 2, right: 3),
                        child: Text(
                          settingController.ourPartnersData[index].description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: primaryFont.copyWith(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 35,
                              
                              decoration: BoxDecoration(
                                  color: kblue,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.grey.withOpacity(0.5))
                                  ],
                                  borderRadius: BorderRadius.circular(45)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 7),
                                child: Row(
                                  children: [
                                    Text("Locaion",style: primaryFont.copyWith(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 12),),
                                    InkWell(
                                        onTap: () {
                                          launchUrl(Uri.parse(settingController
                                              .ourPartnersData[index].mapUrl));
                                        },
                                        child: const Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }): Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/ourpartnernotavailableimage.png'),
                      ksizedbox20,
                      Text('No Memberships',
                      style: TextStyle(
                        fontSize: 20,
                        color: kblue,
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
              
              );
      }),
    );
  }
}