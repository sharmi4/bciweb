import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant/constans.dart';
import '../../controller/setting_controller/setting_controller.dart';

class ProfilePartners extends StatefulWidget {
  const ProfilePartners({super.key});

  @override
  State<ProfilePartners> createState() => _ProfilePartnersState();
}

class _ProfilePartnersState extends State<ProfilePartners> {
  final apisettingController = Get.find<ApiSettingController>();
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Padding(
                padding: const EdgeInsets.only(top: 50),
                child: GetBuilder<ApiSettingController>(builder: (_) {
                  return Container(
                      width: MediaQuery.of(context).size.width - 195,
                      child: apisettingController.ourPartnersData.isNotEmpty? Container(
                        height: size.height,
                        child: GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: apisettingController.ourPartnersData.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 2.1),
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
                                apisettingController.ourPartnersData[index].image,
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
                                apisettingController.ourPartnersData[index].title,
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
                            apisettingController.ourPartnersData[index].description,
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
                                            launchUrl(Uri.parse(apisettingController
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
                                  }),
                      ): Center(
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
              
              )
                          );
                }),
              );
  }
}