import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/models/bank_account_no_model.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class RespoBusinessBankDetails extends StatefulWidget {
  const RespoBusinessBankDetails({super.key});

  @override
  State<RespoBusinessBankDetails> createState() => _RespoBusinessBankDetailsState();
}

class _RespoBusinessBankDetailsState extends State<RespoBusinessBankDetails> {



  var bankNameController = TextEditingController();
  var bankAccountNameController = TextEditingController();
  var bankAccountNumberController = TextEditingController();
  var accountTypeController = TextEditingController();
  var ifscCodeController = TextEditingController();


  final profileController = Get.find<AuthProfileController>();


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


  // File? image;

  // Future pickerimage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imagetemp = File(image.path);
  //     setState(() {
  //       this.image = imagetemp;
  //     });
  //   } catch (e) {
  //     print('Failed to pick image:$e');
  //   }
  // }

  // Future imagepic() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (image == null) return;
  //     final imagetemp = File(image.path);
  //     setState(() {
  //       this.image = imagetemp;
  //     });
  //   } catch (e) {
  //     print('Failed to pick image:$e');
  //   }
  // }

  bool passwordvisible = false;
  bool conpasswordvisible = false;





  @override
  Widget build(BuildContext context) {
    return Scaffold( 
 appBar: PreferredSize(
        child: AppBarMob(),
        preferredSize: Size(double.infinity, 40),
      ),
      drawer: DrawerBusiness(),

      body: ListView(
        children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
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
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
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
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
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
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
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
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
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
        ksizedbox30,
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Obx(
            () => profileController.isLoading.isTrue
                ? Container(
                    height: 55,
                    width: double.infinity,
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
                      width: double.infinity,
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
    ),  ]),);
  }
}