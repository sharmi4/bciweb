import 'package:bciweb/controller/setting_controller/setting_controller.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/drawer.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../constant/constans.dart';
import '../../../mobile_wdgets/comomappbar.dart';

class MobileReferalScreen extends StatefulWidget {
  const MobileReferalScreen({super.key});

  @override
  State<MobileReferalScreen> createState() => _MobileReferalScreenState();
}

class _MobileReferalScreenState extends State<MobileReferalScreen> {
     final apisettingController = Get.find<ApiSettingController>();
  var mobilereferalCOntroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar:
          PreferredSize(child: AppBarMob(), preferredSize: Size.fromHeight(50)),
      drawer: MobileDrawer(),
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics:const BouncingScrollPhysics(),
          children: [
            ksizedbox40,
            ksizedbox30,
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
                      fontSize: 28, fontWeight: FontWeight.w600, color: kblue),
                ),
              ),
            ),
            Obx( () =>
               Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: kblue)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(apisettingController.referralCode.value,style: TextStyle(
                           fontSize: 20, color: kblue, fontWeight: FontWeight.w500),),
                        InkWell(
                          onTap: (){
                            FlutterClipboard.copy(apisettingController.referralCode.value).then(
                                                  (value) =>
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "Copy to clipboard",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .CENTER,
                                                          timeInSecForIosWeb: 1,
                                                          backgroundColor:
                                                              kblue,
                                                          textColor:
                                                              Colors.white,
                                                          fontSize: 16.0),
                                                  //print("code copied")
                                                );
                          },
                          child: Image.asset('assets/images/Icon awesome-copy.png')),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // authController.referralcode();
            //     String referralmsg = "Use my referral code $refferal when you sign up, and we'll both receive fantastic rewards. Don't forget to click on the link below to download the app and start enjoying the perks right away!\n\nhttps://drive.google.com/file/d/15HzAlb_iTWgtX_VN34_TXTQ4BS7KWnOR/view?usp=sharing";
            //     Share.share('$referralmsg');

            ksizedbox30,
            Row(
              children: [
                Text(
                  'Referral Count :  ',
                  style: TextStyle(
                      fontSize: 26,
                      color: kblue,
                      fontWeight: FontWeight.w600),
                ),
                Referal_containors(),kwidth10,  Referal_containors() ,kwidth10, Referal_containors()
              ],
            ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: InkWell(
                onTap: () {
                  String referralmsg = "Use my referral code ${apisettingController.referralCode.value} when you sign up, and we'll both receive fantastic rewards. Don't forget to click on the link below to download the app and start enjoying the perks right away!\n\n";
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
class Referal_containors extends StatelessWidget {
  const Referal_containors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        '0',
        style: TextStyle(
            color: kwhite,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      )),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: korange),
    );
  }
}