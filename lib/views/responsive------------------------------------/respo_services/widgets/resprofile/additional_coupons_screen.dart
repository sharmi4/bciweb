import 'package:flutter/material.dart';

import '../../../../../constant/constans.dart';
import '../../../mobile_wdgets/comomappbar.dart';

class MobileAdditionalCouponScreen extends StatefulWidget {
  const MobileAdditionalCouponScreen({super.key});

  @override
  State<MobileAdditionalCouponScreen> createState() => _MobileAdditionalCouponScreenState();
}

class _MobileAdditionalCouponScreenState extends State<MobileAdditionalCouponScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
          body: Column(
            children: [
               Padding(
                                 padding: const EdgeInsets.only(top:50),
                                 child: Container(
                                  
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:25),
                                        child: Row(
                                          children: [
                                            Text('Additional Coupons',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: kblue,
                                              fontWeight: FontWeight.bold
                                            ),)
                                          ],
                                        ),
                                      ),
                                    
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset('assets/images/aditioffersimage1.png',
                                            height: 110,fit: BoxFit.fitHeight,),
                                            ksizedbox40,
                                              Image.asset('assets/images/aditioffersimage1.png',
                                               height: 110,fit: BoxFit.fitHeight,),
                                               ksizedbox40,
                                                   Image.asset('assets/images/aditioffersimage2.png',
                                             height: 110,fit: BoxFit.fitHeight,),
                                             ksizedbox40,
                                              Image.asset('assets/images/aditioffersimage2.png',
                                               height: 110,fit: BoxFit.fitHeight,)
                                          ],
                                        ),
                                      ),
                                     
                                    ],
                                  ),
                                 ),
                               ),
            ],
          ),
    );
  }
}