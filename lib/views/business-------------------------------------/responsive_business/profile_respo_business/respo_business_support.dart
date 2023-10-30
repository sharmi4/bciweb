import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/controller/setting_controller/setting_controller.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:url_launcher/url_launcher.dart';

class RespoBusinessSupport extends StatefulWidget {
  const RespoBusinessSupport({super.key});

  @override
  State<RespoBusinessSupport> createState() => _RespoBusinessSupportState();
}

class _RespoBusinessSupportState extends State<RespoBusinessSupport> {
  final profileController = Get.find<AuthProfileController>();
  final settingsController = Get.find<ApiSettingController>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDefault();
    profileController.supportAdminDetail();
  }

  setDefault() async {
    await profileController.getProfile();
    nameController.text = profileController.profileData.first.name;
    phoneController.text = profileController.profileData.first.mobile;
    emailController.text = profileController.profileData.first.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


appBar: PreferredSize(
        child: AppBarMob(),
        preferredSize: Size(double.infinity, 40),
      ),
      drawer: DrawerBusiness(),



      body: GetBuilder<ProfileController>(builder: (_) {
        return ListView(
          children: [
            ksizedbox40,
          Column(
            children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xffF2F1F1)),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: nameController,
                    decoration: const InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Name",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xffF2F1F1)),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Mobile",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xffF2F1F1)),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xffF2F1F1)),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: titleController,
                    decoration: const InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Title",
                        hintStyle: TextStyle(
                          color: Color(0xff6E6D6E),
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xffF2F1F1)),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: descriptionController,
                    maxLines: 100,
                    decoration: const InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Description",
                        hintStyle: TextStyle(
                          color: Color(0xff6E6D6E),
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: InkWell(
                onTap: () {
                  settingsController.createSupport(
                      title: titleController.text,
                      message: descriptionController.text);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xff003366)),
                  child: const Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 20, color: Color(0xffF9F8FD)),
                    ),
                  ),
                ),
              ),
            ),
            ksizedbox20,
            profileController.contactDetailsData != null
                ? Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: Row(
                          children: [
                            const Column(
                              children: [
                                Text(
                                  'Contact Admin :',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff443C3C)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            profileController
                                    .contactDetailsData!.appPhone.isEmpty
                                ? const Text("")
                                : InkWell(
                                    onTap: () {
                                      launch(
                                          "tel:${profileController.contactDetailsData!.appPhone}");
                                    },
                                    child: Text(
                                        profileController
                                            .contactDetailsData!.appPhone,
                                        style: TextStyle(
                                            fontSize: 15, color: kblue)),
                                  ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Admin Email :',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff443C3C)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 29,
                                ),
                                profileController
                                        .contactDetailsData!.appEmail.isEmpty
                                    ? const Text("")
                                    : Container(
                                        child: Text(
                                            profileController
                                                .contactDetailsData!.appEmail,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 15, color: kblue)),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Admin Address :',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff443C3C)),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                profileController
                                        .contactDetailsData!.appEmail.isEmpty
                                    ? const Text("")
                                    : Container(
                                        width: 200,
                                        child: Text(
                                            profileController
                                                .contactDetailsData!.appAddress,
                                            maxLines: 4,
                                            style: TextStyle(
                                                fontSize: 15, color: kblue)),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(),
          ]),
        ]);
      }),
    );
  }
}
