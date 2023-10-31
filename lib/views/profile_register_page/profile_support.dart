import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constant/constans.dart';
import '../../controller/auth_controller/auth_profile_controller.dart';
import '../../controller/profile_controller.dart';
import '../../controller/setting_controller/setting_controller.dart';

class ProfileSupport extends StatefulWidget {
  const ProfileSupport({super.key});

  @override
  State<ProfileSupport> createState() => _ProfileSupportState();
}

class _ProfileSupportState extends State<ProfileSupport> {

  var subNameController = TextEditingController();
  var subMobileController = TextEditingController();
  var subEmailController = TextEditingController();
  var subtitleController = TextEditingController();
  var subDescriptionController = TextEditingController();
 
  final authprofileController = Get.find<AuthProfileController>();
  final profileController = Get.find<ProfileController>();
  final apisettingController = Get.find<ApiSettingController>();

 @override
  void initState() {
    super.initState();
    apisettingController.supportAdminDetail();
    setDefault();
  }

  setDefault() async {
    await authprofileController.getProfile();
    subNameController.text = authprofileController.profileData.first.name;
    subMobileController.text = authprofileController.profileData.first.mobile;
    subEmailController.text = authprofileController.profileData.first.email;
  }
 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: GetBuilder<ApiSettingController>(
        builder: (_) {
          return Container(
            width: MediaQuery.of(context).size.width - 195,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          color: kgrey.withOpacity(0.3),
                        ),
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          controller: subNameController,
                          decoration:const InputDecoration(
                              hintText: 'Your Name',
                              hintStyle: TextStyle(fontSize: 14.5),
                              border:
                                  OutlineInputBorder(borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 150),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          color: kgrey.withOpacity(0.3),
                        ),
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          controller: subMobileController,
                          decoration:const InputDecoration(
                              hintText: 'Mobile',
                              hintStyle: TextStyle(fontSize: 14.5),
                              border:
                                  OutlineInputBorder(borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 35),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: kgrey.withOpacity(0.3),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: subEmailController,
                        decoration:const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(fontSize: 14.5),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 150, top: 35),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: kgrey.withOpacity(0.3),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: subtitleController,
                        decoration:const InputDecoration(
                            hintText: 'Title',
                            hintStyle: TextStyle(fontSize: 14.5),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none)),
                      ),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 35),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.69,
                      decoration: BoxDecoration(
                        color: kgrey.withOpacity(0.3),
                      ),
                      child: TextField(
                        maxLines: 4,
                        controller: subDescriptionController,
                        decoration:const InputDecoration(
                            hintText: 'Description',
                            hintStyle: TextStyle(fontSize: 14.5),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none)),
                      ),
                    ),
                  )
                ]),
                ksizedbox30,
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: profileController.isLoading.isTrue
                        ? Container(
                            height: 50,
                            width: size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(color: const Color(0xffFF9021)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xffFF5003),
                                    blurRadius: 2.0,
                                  ),
                                ]),
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width * 0.7,
                                          45),
                                      backgroundColor: kblue),
                                  onPressed: () {
                                    
                                    apisettingController.createSupport(
                                        title: subtitleController.text,
                                        message: subDescriptionController.text);
                                  },
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(fontSize: 17, color: kwhite),
                                  )),
                            ],
                          ),
                  ),
                ),apisettingController.contactDetailsData!=null?
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 50),
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                            color: kwhite,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                offset:const Offset(0.0, 0.75),
                                blurRadius: 5,
                                color: kgrey,
                              )
                            ],
                            border:
                                Border.all(color: Colors.black.withOpacity(0.3))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20, left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Contact Admin :',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child:    apisettingController
                                        .contactDetailsData!.appPhone.isEmpty
                                    ? const Text("")
                                    : InkWell(
                                      onTap: (){
                                        launch("tel:${apisettingController.contactDetailsData!.appPhone}");
                                      },
                                      child: Text(
                                          apisettingController
                                              .contactDetailsData!.appPhone,
                                          style: TextStyle(
                                              fontSize: 15, color: kblue)),
                                    ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'Admin Email :',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                     Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: apisettingController.contactDetailsData!.appEmail.isEmpty?
                                        Text(''):
                                         Container(
                                            child: Text(
                                                apisettingController
                                                    .contactDetailsData!.appEmail,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 15, color: kblue)),
                                          ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            ksizedbox20,
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                     const Text(
                                        'Admin Address :',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: apisettingController.contactDetailsData!.appAddress.isEmpty?
                                        Text(''):
                                         Container(
                                            child: Text(
                                                apisettingController
                                                    .contactDetailsData!.appAddress,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 15, color: kblue)),
                                          ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ):Container()
              ],
            ),
          );
        }
      ),
    );
  }
}
