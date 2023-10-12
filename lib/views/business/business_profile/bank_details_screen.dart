
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../constant/constans.dart';
import '../../../controller/profile_controller.dart';
import '../../../models/business_model/business_updatebank_details_model.dart';

class BusinessBankDetailsScreen extends StatefulWidget {
  const BusinessBankDetailsScreen({super.key});

  @override
  State<BusinessBankDetailsScreen> createState() => _BusinessBankDetailsScreenState();
}

class _BusinessBankDetailsScreenState extends State<BusinessBankDetailsScreen> {
  var bankNameController = TextEditingController();
  var bankAccountNameController = TextEditingController();
  var bankAccountNumberController = TextEditingController();
  var accountTypeController = TextEditingController();
  var ifscCodeController = TextEditingController();

  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    setDefault();
  }

  setDefault() async {
    await profileController.getProfile();
    profileController.update();
    if (profileController.profileData.isNotEmpty) {
      bankAccountNameController.text =
          profileController.profileData.first.bankAccountName;
      bankAccountNumberController.text =
          profileController.profileData.first.bankAccountNumber;
      bankNameController.text = profileController.profileData.first.bankName;
      accountTypeController.text =
          profileController.profileData.first.accountType;
      ifscCodeController.text = profileController.profileData.first.ifscCode;
    }
  }

  File? image;

  Future pickerimage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imagetemp = File(image.path);
      setState(() {
        this.image = imagetemp;
      });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

  Future imagepic() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imagetemp = File(image.path);
      setState(() {
        this.image = imagetemp;
      });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

  bool passwordvisible = false;
  bool conpasswordvisible = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ksizedbox30,
        ksizedbox40,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 50,
              width: size.width*0.25,
              child: TextField(
                textCapitalization: TextCapitalization.words,
                controller: bankNameController,
                // readOnly: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                ],
                decoration: InputDecoration(
                    labelText: 'Bank Name',
                    hintStyle: TextStyle(fontSize: 16, color: kblue),
                    border: const OutlineInputBorder()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Container(
                  height: 55,
                  width: size.width*0.25,
                  child: TextField(
            textCapitalization: TextCapitalization.words,
            controller: bankAccountNameController,
            // readOnly: true,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
            ],
            decoration: InputDecoration(
                labelText: 'Bank Account Name',
                hintStyle: TextStyle(fontSize: 16, color: kblue),
                border: const OutlineInputBorder()),
                  ),
                ),
          ),
        ],
      ),

      
      ksizedbox40,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 50,
              width: size.width*0.25,
              child: TextField(
                controller: accountTypeController,
                // readOnly: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                ],
                decoration: InputDecoration(
                    labelText: ' Account Type',
                    hintStyle: TextStyle(fontSize: 16, color: kblue),
                    border: const OutlineInputBorder()),
              ),
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(left: 150),
             child: Container(
                   height: 50,
                   width: size.width*0.25,
                   child: TextField(
                     controller: bankAccountNumberController,
                     // readOnly: true,
             keyboardType: TextInputType.phone,
                     inputFormatters: [
              LengthLimitingTextInputFormatter(16),
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                     ],
                     decoration: InputDecoration(
                labelText: 'Bank Account Number',
                hintStyle: TextStyle(fontSize: 16, color: kblue),
                border: const OutlineInputBorder()),
                   ),
                 ),
           ),
        ],
      ),
     
      ksizedbox40,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 50,
              width: size.width*0.25,
              child: TextField(
                controller: ifscCodeController,
                // readOnly: true,
                textCapitalization: TextCapitalization.characters,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                ],
                decoration: InputDecoration(
                    labelText: 'IFSC code',
                    hintStyle: TextStyle(fontSize: 16, color: kblue),
                    border: const OutlineInputBorder()),
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Obx(
                  () => profileController.isLoading.isTrue
                      ? Container(
                height: 55,
                width: size.width*0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: kOrange),
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
                      : InkWell(
                onTap: () {
                  UpdateBankModel updateBankModel = UpdateBankModel(
                      accountType: accountTypeController.text,
                      bankAccountName: bankAccountNameController.text,
                      bankAccountNumber: bankAccountNumberController.text,
                      bankName: bankNameController.text,
                      ifscCode: ifscCodeController.text);
                  profileController.updateBankAccount(
                      merchantUpdateModel: updateBankModel);
                },
                child: Container(
                  height: 55,
                  width: size.width*0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kOrange),
                  alignment: Alignment.center,
                  child: Text(
                    "Save",
                    style: primaryFont.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ),
                ),
            ),
        ],
      ),
    
     
    ]);
  }
}
