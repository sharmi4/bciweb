import 'package:bciweb/constant/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../mobile_body/mobile_home.dart';
import '../comomappbar.dart';
import '../drawer.dart';

class MobilePaymentSuccess extends StatefulWidget {
  const MobilePaymentSuccess({super.key});

  @override
  State<MobilePaymentSuccess> createState() => _MobilePaymentSuccessState();
}

class _MobilePaymentSuccessState extends State<MobilePaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      drawer: MobileDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(child: Image.asset('assets/images/payment-successful.png',
            fit: BoxFit.fitHeight,height: 300,)),
          ),
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: InkWell(
              onTap: (){
                Get.to(MobileHome());
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width*0.4,
                decoration: BoxDecoration(
                  color: kOrange,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('OK',
                style: TextStyle(
                  fontSize: 18,
                  color: kwhite
                ),)),
              ),
            ),
          )
        ],
      ),
    );
  }
}