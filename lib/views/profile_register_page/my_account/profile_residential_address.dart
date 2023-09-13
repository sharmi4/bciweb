import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../constant/constans.dart';
import '../../../controller/auth_controller/auth_profile_controller.dart';
import '../../../controller/profile_controller.dart';
import '../../../models/create_account_model.dart';

class ProfileResidentialAddressScreen extends StatefulWidget {
  const ProfileResidentialAddressScreen({super.key});

  @override
  State<ProfileResidentialAddressScreen> createState() =>
      _ProfileResidentialAddressScreenState();
}

class _ProfileResidentialAddressScreenState
    extends State<ProfileResidentialAddressScreen> {
  final authprofileController = Get.find<AuthProfileController>();
  final profileController = Get.find<ProfileController>();

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
  var pincoderesidentialController = TextEditingController();
  var idproofresidentialController = TextEditingController();

  dynamic imageprofile;
  dynamic aadharimage;
  dynamic panimage;

  bool isMarried = false;
  bool isUnmarried = false;

  setDefauld() async {
    await authprofileController.getProfile();
    subNameController.text = authprofileController.profileData.first.name;
    subEmailController.text = authprofileController.profileData.first.email;
    subMobileController.text = authprofileController.profileData.first.mobile;

    if (authprofileController.profileData.isNotEmpty) {

     resibnameController.text=
     authprofileController.profileData.first.officialAddress.buildingName;

      residoornumberController.text =
      authprofileController.profileData.first.officialAddress.doorNo;

      resibcityController.text =
      authprofileController.profileData.first.officialAddress.city;

      idproofresidentialController.text =
      authprofileController.profileData.first.officialAddress.proofIdNo;

      pincoderesidentialController.text =
      authprofileController.profileData.first.officialAddress.pincode;

      resiaddressController.text =
      authprofileController.profileData.first.officialAddress.address;
          
      resistateController.text =
      authprofileController.profileData.first.officialAddress.state;

 
    }
  }

  @override
  void initState() {
    super.initState();
    setDefauld();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 50),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: residoornumberController,
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
                    controller: resibnameController,
                    decoration: InputDecoration(
                        hintText: 'Building Name',
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
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 50),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: resiaddressController,
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
                    controller: resibcityController,
                    decoration: InputDecoration(
                        hintText: 'City',
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
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 50),
                    child: TextField(
                        keyboardType: TextInputType.number,
                      controller: idproofresidentialController,
                      decoration: InputDecoration(
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
                    controller: pincoderesidentialController,
                    decoration: InputDecoration(
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
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 50),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    controller: resistateController,
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
            () => Padding(
              padding: const EdgeInsets.only(top: 20, left: 40),
              child: profileController.isLoading.isTrue
                  ? InkWell(
                      onTap: () {
                        AddressModel addressModel = AddressModel(
                          aadhrId: "",
                          address: resiaddressController.text,
                          buildingName: resibnameController.text,
                          city: resibcityController.text,
                          doorNo: residoornumberController.text,
                          personalId: idproofresidentialController.text,
                          state: resistateController.text,
                          pincode: pincoderesidentialController.text,
                        );
                        authprofileController.updateRecidencyAddress(
                            residentialAddress: addressModel);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 40),
                        child: Container(
                            height: 50,
                            width: size.width * 0.36,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border:
                                    Border.all(color: const Color(0xffFF9021)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xffFF5003),
                                    blurRadius: 2.0,
                                  ),
                                ]),
                            child: CircularProgressIndicator(color: kwhite)),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        AddressModel addressModel = AddressModel(
                          aadhrId: "",
                          address: resiaddressController.text,
                          buildingName: resibnameController.text,
                          city: resibcityController.text,
                          doorNo: residoornumberController.text,
                          personalId: idproofresidentialController.text,
                          state: resistateController.text,
                          pincode: pincoderesidentialController.text,
                        );
                        authprofileController.updateRecidencyAddress(
                            residentialAddress: addressModel);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 40),
                        child: Container(
                          height: 50,
                          width: size.width * 0.36,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border:
                                  Border.all(color: const Color(0xffFF9021)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xffFF5003),
                                  blurRadius: 2.0,
                                ),
                              ]),
                          child: const Center(
                            child: Text(
                              "Submit",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
