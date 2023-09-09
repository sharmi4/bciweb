
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constant/constans.dart';
import '../../controller/auth_controller/auth_profile_controller.dart';
import '../../controller/profile_controller.dart';
import '../../controller/profile_show_controller.dart';
import '../../controller/reg_profile_controller.dart';
import '../../controller/service_controller/home_controller.dart';
import '../../controller/setting_controller/setting_controller.dart';
import '../../controller/subscription_controller/subscription_controller.dart';

class ProfileSupport extends StatefulWidget {
  const ProfileSupport({super.key});

  @override
  State<ProfileSupport> createState() => _ProfileSupportState();
}

class _ProfileSupportState extends State<ProfileSupport> {
  var nameController = TextEditingController();
  var dobController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();
  var alternumberController = TextEditingController();
  var occupationController = TextEditingController();
  var fathernameController = TextEditingController();
  var mothernameController = TextEditingController();
  var wedingnameController = TextEditingController();
  var spousenameController = TextEditingController();
  var dateofbirthController = TextEditingController();
  var childrensController = TextEditingController();
  var referalCOntroller = TextEditingController();

  var subDescriptionController = TextEditingController();
  var subtitleController = TextEditingController();
  var adharController = TextEditingController();
  var gstnoController = TextEditingController();
  var pannoController = TextEditingController();
  var branchController = TextEditingController();
  var qualificationController = TextEditingController();
  var officebnameController = TextEditingController();
  var officedoornoController = TextEditingController();
  var officeaddressController = TextEditingController();
  var officeaddresController = TextEditingController();
  var officecityController = TextEditingController();
  var officestateController = TextEditingController();

  var resibnameController = TextEditingController();
  var residoornumberController = TextEditingController();
  var resibcityController = TextEditingController();
  var resistateController = TextEditingController();
  var resiperidController = TextEditingController();
  var resiadaridController = TextEditingController();
  var resiaddressController = TextEditingController();
  dynamic imageprofile;
  dynamic aadharimage;
  dynamic panimage;

  final subscriptionapiController = Get.find<SubscriptionApiController>();
  final reghomeController = Get.find<RegisterProfileController>();
  final regshowController = Get.find<ProfileShowController>();
  final authprofileController = Get.find<AuthProfileController>();
  final profileController = Get.find<ProfileController>();
  final subscripeController = Get.find<SubscriptionApiController>();
  final seriveoffersController = Get.find<HomeServiceController>();
  final apisettingController = Get.find<ApiSettingController>();

  
 setDefauld() async {
    await authprofileController.getProfile();
    subNameController.text = authprofileController.profileData.first.name;
    subEmailController.text = authprofileController.profileData.first.email;
    subMobileController.text = authprofileController.profileData.first.mobile;

    if (authprofileController.profileData.isNotEmpty) {
      nameController.text = authprofileController.profileData.first.name;
      numberController.text = authprofileController.profileData.first.mobile;
      alternumberController.text =
          authprofileController.profileData.first.alternateMobile;
      emailController.text = authprofileController.profileData.first.email;
      occupationController.text =
          authprofileController.profileData.first.occupation;
      qualificationController.text =
          authprofileController.profileData.first.qualification;
      fathernameController.text =
          authprofileController.profileData.first.fatherName;
      gstnoController.text = authprofileController.profileData.first.gstNo;
      pannoController.text = authprofileController.profileData.first.panNo;

      mothernameController.text =
          authprofileController.profileData.first.motherName;
      spousenameController.text =
          authprofileController.profileData.first.spouse;
      dateofbirthController.text = authprofileController.profileData.first.dob;
      officedoornoController.text =
          authprofileController.profileData.first.officialAddress.doorNo;
      officebnameController.text =
          authprofileController.profileData.first.officialAddress.buildingName;
      officeaddresController.text =
          authprofileController.profileData.first.officialAddress.address;

      officeaddresController.text =
          authprofileController.profileData.first.officialAddress.city;
      officestateController.text =
          authprofileController.profileData.first.officialAddress.state;

      setState(() {
        isMarried = authprofileController.profileData.first.isMarried == "0"
            ? false
            : true;
        isUnmarried = authprofileController.profileData.first.isMarried == "0"
            ? false
            : true;
        aadharimage = authprofileController.profileData.first.adharProof;
      });
    }
  }
 
 @override
  void initState() {
    super.initState();
    setDefauld();
    // setDefauld();
    // subscripeController.getcouponsList();
    // authprofileController.getProfile();
    // apisettingController.getwalletList();
    // apisettingController.generateReferralCode();
    // apisettingController.ourPartner();
    //callApis();
    // plansController.getPlanDetails(id: int.parse(authprofileController.planId.value));
  }
 
  bool isMarried = false;
  bool isUnmarried = false;
  var subNameController = TextEditingController();
  var subMobileController = TextEditingController();
  var subEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
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
                      decoration: InputDecoration(
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
                      decoration: InputDecoration(
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
                    decoration: InputDecoration(
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
                    decoration: InputDecoration(
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
                    decoration: InputDecoration(
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
                                // AddressModel addressModel =
                                //     AddressModel(
                                //         aadhrId:
                                //             resiadaridController.text,
                                //         address: resiaddressController
                                //             .text,
                                //         buildingName:
                                //             resibnameController.text,
                                //         city:
                                //             resibcityController.text,
                                //         doorNo:
                                //             residoornumberController
                                //                 .text,
                                //         personalId:
                                //             resiperidController.text,
                                //         state:
                                //             resistateController.text);
                                // authprofileController
                                //     .updateRecidencyAddress(
                                //         residentialAddress:
                                //             addressModel);
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
            ),
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
                            offset: Offset(0.0, 0.75),
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
                                  Text(
                                    'Contact Admin :',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      authprofileController
                                          .profileData.first.name,
                                      style:
                                          TextStyle(color: kblue, fontSize: 16),
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
                                  Text(
                                    'Admin Email :',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      authprofileController
                                          .profileData.first.email,
                                      style:
                                          TextStyle(color: kblue, fontSize: 16),
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
                                  Text(
                                    'Head Office Address :',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      authprofileController
                                          .profileData.first.address,
                                      style:
                                          TextStyle(color: kblue, fontSize: 16),
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
            )
          ],
        ),
      ),
    );
  }
}
