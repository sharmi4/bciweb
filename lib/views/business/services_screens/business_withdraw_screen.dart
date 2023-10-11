
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constant/constans.dart';
import '../../../registerhomescreen/business_comm_homecontainer.dart';
import '../../members/common_widget/business_common_screen.dart';

class EnterAmountForWithdrawalScreen extends StatefulWidget {
  const EnterAmountForWithdrawalScreen({super.key});

  @override
  State<EnterAmountForWithdrawalScreen> createState() =>
      _EnterAmountForWithdrawalScreenState();
}

class _EnterAmountForWithdrawalScreenState
    extends State<EnterAmountForWithdrawalScreen> {
  var amountController = TextEditingController();

  final profileController = Get.find<AuthProfileController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
            appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BusinessCommonScreen(),
              BusinessCommonhomeContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),
      body: ListView(
        children: [
              Stack(
                  children: [
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/images/walletbackgroundimage.png',
                      fit: BoxFit.cover,)),
                    Positioned(
                      top:0,
                      left:0,
                      right:0,
                      bottom:0,
                      child: Center(
                        child: Text('Withdraw Wallet',
                           style: displayfont,
                                                  
                        ),
                      ))
                  ],
                ),
                ksizedbox40,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width*0.3,
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  decoration: InputDecoration(
                      hintText: 'Enter your amount',
                      hintStyle: TextStyle(fontSize: 18, color: kblue),
                      prefix: Text(
                        "₹ ",
                        style: primaryFont.copyWith(),
                      ),
                      border: const OutlineInputBorder()),
                ),
              ),
              ksizedbox40,
               Obx(
        () => Padding(
          padding: const EdgeInsets.all(20.0),
          child: profileController.isLoading.isTrue
              ? Container(
                  height: 55,
                  width: size.width*0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40), color: kOrange),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : InkWell(
                  onTap: () {
                    if (amountController.text.isNotEmpty) {
                      profileController.withdrawAmountFromWallet(
                          amount: amountController.text);
                    }
                  },
                  child: Container(
                    height: 55,
                    width: size.width*0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: kOrange),
                    alignment: Alignment.center,
                    child: Text(
                      "Withdraw",
                      style: primaryFont.copyWith(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
        ),
      ),
            ],
          ),
        
         
        ],
      ),
    );
  }
}
