import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  var pincodeController = TextEditingController();
  var idproofController = TextEditingController();

  setDefauld() async {
    await authprofileController.getProfile();
    subNameController.text = authprofileController.profileData.first.name;
    subEmailController.text = authprofileController.profileData.first.email;
    subMobileController.text = authprofileController.profileData.first.mobile;

    if (authprofileController.profileData.isNotEmpty) {
      officebnameController.text =
          authprofileController.profileData.first.officialAddress.buildingName;

      officecityController.text =
          authprofileController.profileData.first.officialAddress.city;

      idproofController.text =
          authprofileController.profileData.first.officialAddress.proofIdNo;

      pincodeController.text =
          authprofileController.profileData.first.officialAddress.pincode;

      officeaddresController.text =
          authprofileController.profileData.first.officialAddress.address;

      officestateController.text =
          authprofileController.profileData.first.officialAddress.state;
      officedoornoController.text =
          authprofileController.profileData.first.officialAddress.doorNo;
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
                    decoration:const InputDecoration(
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
                    keyboardType: TextInputType.number,
                  controller: officebnameController,
                  decoration:const InputDecoration(
                      hintText: 'Building Number',
                      suffixIcon: Icon(Icons.edit),
                      fillColor: Color(0xffF9F8FD),
                      border: OutlineInputBorder()),
                ),
              ),
            ),
          ],
        ),
//////////////////

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
                  child: TextField(
                     keyboardType: TextInputType.number,
                    controller: idproofController,
                    decoration:const InputDecoration(
                        hintText: 'Proof Id No',
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
                  keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(6),
                                        FilteringTextInputFormatter.digitsOnly,
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'\s')),
                                      ],
                  controller: pincodeController,
                  decoration:const InputDecoration(
                    hintText: 'Pincode',
                    suffixIcon: Icon(Icons.edit),
                    fillColor: Color(0xffF9F8FD),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),

///////////////////
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
                    decoration:const InputDecoration(
                      hintText: 'Address',
                      suffixIcon: Icon(Icons.edit),
                      fillColor: Color(0xffF9F8FD),
                      border: OutlineInputBorder(),
                    ),
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
                  decoration:const InputDecoration(
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
                  decoration:const InputDecoration(
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
                                MediaQuery.of(context).size.width * 0.36, 45)),
                        onPressed: () {
                          AddressModel addressModel = AddressModel(
                            aadhrId: "",
                            address: officeaddresController.text,
                            buildingName: officebnameController.text,
                            city: officecityController.text,
                            doorNo: officedoornoController.text,
                            personalId: idproofController.text,
                            state: officestateController.text,
                            pincode: pincodeController.text,
                          );

                          authprofileController.updateOfficalAddress(
                              officialAddress: addressModel);
                        },
                        child: CircularProgressIndicator(color: kwhite),
                      )
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
                          print(
                              '-----------------------id---------------------------------------');
                          AddressModel addressModel = AddressModel(
                            aadhrId: "",
                            address: officeaddresController.text,
                            buildingName: officebnameController.text,
                            city: officecityController.text,
                            doorNo: officedoornoController.text,
                            personalId: idproofController.text,
                            state: officestateController.text,
                            pincode: pincodeController.text,
                          );

                          authprofileController.updateOfficalAddress(
                              officialAddress: addressModel);
                        },
                        child:const Text(
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
