import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../constant/constans.dart';
import '../../../controller/auth_controller/auth_profile_controller.dart';
import '../../../models/create_account_model.dart';

class ProfileOfficeAddreass extends StatefulWidget {
  const ProfileOfficeAddreass({super.key});

  @override
  State<ProfileOfficeAddreass> createState() => _ProfileOfficeAddreassState();
}

class _ProfileOfficeAddreassState extends State<ProfileOfficeAddreass> {
  final authprofileController = Get.find<AuthProfileController>();

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
  var subNameController = TextEditingController();
  var subEmailController = TextEditingController();
  var subMobileController = TextEditingController();
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

      setState(
        () {
          isMarried = authprofileController.profileData.first.isMarried == "0"
              ? false
              : true;
          isUnmarried = authprofileController.profileData.first.isMarried == "0"
              ? false
              : true;
          aadharimage = authprofileController.profileData.first.adharProof;
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    setDefauld();
  }

  bool isMarried = false;
  bool isUnmarried = false;
  int offersindex = 0;
  bool isLoading = false;
  dynamic aadharimage;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    controller: officedoornoController,
                    decoration: InputDecoration(
                        hintText: 'Door Number',
                        suffixIcon: Icon(Icons.edit),
                        fillColor: Color(0xffF9F8FD),
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: officebnameController,
                  decoration: InputDecoration(
                      hintText: 'Building Number',
                      suffixIcon: Icon(Icons.edit),
                      fillColor: Color(0xffF9F8FD),
                      border: OutlineInputBorder()),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    controller: officeaddresController,
                    decoration: InputDecoration(
                        hintText: 'Address',
                        suffixIcon: Icon(Icons.edit),
                        fillColor: Color(0xffF9F8FD),
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: officecityController,
                  decoration: InputDecoration(
                    hintText: 'City',
                    suffixIcon: Icon(Icons.edit),
                    fillColor: Color(0xffF9F8FD),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, top: 50),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: officestateController,
                  decoration: InputDecoration(
                      hintText: 'State',
                      suffixIcon: Icon(Icons.edit),
                      fillColor: Color(0xffF9F8FD),
                      border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => authprofileController.isLoading.isTrue
              ? Padding(
                  padding: const EdgeInsets.only(left: 50, top: 50),
                  child: Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: korange,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.36,
                                  45)),
                          onPressed: () {
                            AddressModel addressModel = AddressModel(
                              aadhrId: "",
                              address: officeaddresController.text,
                              buildingName: officebnameController.text,
                              city: officecityController.text,
                              doorNo: officedoornoController.text,
                              personalId: "",
                              state: officestateController.text,
                            );

                            authprofileController.updateOfficalAddress(
                                officialAddress: addressModel);
                          },
                          child: CircularProgressIndicator(color: kwhite))
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 50, top: 50),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: korange,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.36, 45)),
                        onPressed: () {
                          AddressModel addressModel = AddressModel(
                            aadhrId: "",
                            address: officeaddresController.text,
                            buildingName: officebnameController.text,
                            city: officecityController.text,
                            doorNo: officedoornoController.text,
                            personalId: "",
                            state: officestateController.text,
                          );

                          authprofileController.updateOfficalAddress(
                              officialAddress: addressModel);
                        },
                        child: Text(
                          'Update',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    ));
  }
}
