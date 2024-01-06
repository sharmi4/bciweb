import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/members/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSucess extends StatefulWidget {
  const PaymentSucess({super.key});

  @override
  State<PaymentSucess> createState() => _PaymentSucessState();
}

class _PaymentSucessState extends State<PaymentSucess> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(child: Image.asset('assets/images/payment-successful.png')),
            ),
            ksizedbox40,
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: InkWell(
                onTap: (){
                  Get.to(MemberHomeScreen());
                },
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width*0.2,
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
      ),
    );
  }
}