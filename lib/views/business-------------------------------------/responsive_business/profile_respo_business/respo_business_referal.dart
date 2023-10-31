import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/setting_controller/setting_controller.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:share_plus/share_plus.dart';



class RespoBusinessReferal extends StatefulWidget {
  const RespoBusinessReferal({super.key});

  @override
  State<RespoBusinessReferal> createState() => _RespoBusinessReferalState();
}

class _RespoBusinessReferalState extends State<RespoBusinessReferal> {
  final settingsController = Get.find<ApiSettingController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settingsController.getwalletList();
    settingsController.generateReferralCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarMob(),
        preferredSize: Size(double.infinity, 40),
      ),
      drawer: DrawerBusiness(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ksizedbox40,
            const Image(
              image: AssetImage(
                "assets/images/pngwing.com (30).png",
              ),
              height: 300,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Referral Code',
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600, color: kblue),
                ),
              ),
            ),
            ksizedbox10,
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: kblue)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            settingsController.referralCode.value,
                            style: TextStyle(
                                fontSize: 16,
                                color: kblue,
                                fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                              onTap: () {
                                FlutterClipboard.copy(
                                        settingsController.referralCode.value)
                                    .then(
                                  (value) => Fluttertoast.showToast(
                                      msg: "Copy to clipboard",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: kblue,
                                      textColor: Colors.white,
                                      fontSize: 16.0),
                                  //print("code copied")
                                );
                              },
                              child: Image.asset(
                                  'assets/images/Icon awesome-copy.png')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // authController.referralcode();
            //     String referralmsg = "Use my referral code $refferal when you sign up, and we'll both receive fantastic rewards. Don't forget to click on the link below to download the app and start enjoying the perks right away!\n\nhttps://drive.google.com/file/d/15HzAlb_iTWgtX_VN34_TXTQ4BS7KWnOR/view?usp=sharing";
            //     Share.share('$referralmsg');

            ksizedbox30,
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    'Referral Count :  ',
                    style: TextStyle(
                        fontSize: 20,
                        color: kblue,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7), color: korange),
                    child: Center(
                        child: settingsController.getWalletData.isEmpty
                            ? const Text("")
                            : Text(
                                settingsController.getWalletData.first.referrals
                                    .totalReferrals
                                    .toString(),
                                style: TextStyle(
                                    color: kwhite,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              )),
                  ),
                ],
              ),
            ),
            ksizedbox20,
            ksizedbox20,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: InkWell(
                onTap: () {
                  String referralmsg =
                      "Use my referral code ${settingsController.referralCode.value} when you sign up, and we'll both receive fantastic rewards. Don't forget to click on the link below to download the app and start enjoying the perks right away!\n\n";
                  Share.share('$referralmsg');
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: const Color(0xffFFBF7E)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFFF5C29),
                        blurRadius: 3.0,
                      )
                    ],
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFFF5C29),
                        Color(0xFFFFCD38),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Invite",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            ksizedbox40
          ],
        ),
      ),
    );
  }
}
