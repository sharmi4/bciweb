import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

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
    return Padding(
                padding: const EdgeInsets.only(top: 50),
                child: GetBuilder<ApiSettingController>(builder: (_) {
                  return Container(
                      width: MediaQuery.of(context).size.width - 195,
                      child: GridView.builder(
                          itemCount:
                              apisettingController.ourPartnersData.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 40,
                                  crossAxisSpacing: 50,
                                  childAspectRatio: 2),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 70, right: 70),
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(color: kblue),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(apisettingController
                                          .ourPartnersData[index].image)),
                                ),
                              ),
                            );
                          }));
                }),
              );
  }
}