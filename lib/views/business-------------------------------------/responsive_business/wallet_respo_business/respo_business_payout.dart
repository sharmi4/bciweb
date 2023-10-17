import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:websafe_svg/websafe_svg.dart';

class RespoBusinessPayout extends StatelessWidget {
   RespoBusinessPayout({super.key});
  var amountController = TextEditingController();

  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarMob(),
        preferredSize: Size(double.infinity, 40),
      ),
      drawer: DrawerBusiness(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),

            child:WebsafeSvg.asset("assets/images/payment_vec_image.svg",height: size.height*0.4,),
           
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
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
          const SizedBox(
            height: 50,
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(20.0),
              child: profileController.isLoading.isTrue
                  ? Container(
                      height: 55,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: kOrange),
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
                        width: size.width,
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
    );
  }
}
