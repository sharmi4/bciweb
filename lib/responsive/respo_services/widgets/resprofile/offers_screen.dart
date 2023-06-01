import 'package:flutter/material.dart';

import '../../../../constant/constans.dart';
import '../../../mobile_wdgets/comomappbar.dart';

class MobileOffersScreen extends StatefulWidget {
  const MobileOffersScreen({super.key});

  @override
  State<MobileOffersScreen> createState() => _MobileOffersScreenState();
}

class _MobileOffersScreenState extends State<MobileOffersScreen> {
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
                                        padding: const EdgeInsets.only(left: 40),
                                        child: Row(
                                          children: [
                                            Text('Member Offer',textAlign: TextAlign.start,
                                            style:TextStyle(fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: kblue)),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 40,top:40,right: 40),
                                            child: Container(
                                              height: 130,
                                          
                                              decoration: BoxDecoration(
                                                color: Color(0xff594A99),
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text('Best Deals \nof Today',
                                                    style: TextStyle(
                                                      height: 1.7,
                                                      fontSize: 19,
                                                      color: kwhite
                                                    ),),
                                                  ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(right:15),
                                                     child: Image.asset('assets/images/offersimage.png',fit:BoxFit.fitHeight,
                                                     height: 110,),
                                                   )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 40,right: 40,top:40),
                                            child: Container(
                                              height: 130,
                                              
                                              decoration: BoxDecoration(
                                                color:kyellow,
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                   Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text('Best Deals \nof Today',
                                                    style: TextStyle(
                                                      height: 1.7,
                                                      fontSize: 19,
                                                      color: kwhite
                                                    ),),
                                                  ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(right:15),
                                                     child: Image.asset('assets/images/offersimage.png',fit:BoxFit.fitHeight,
                                                     height: 110,),
                                                   )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                         Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 40,top:40,right: 40),
                                            child: Container(
                                              height: 130,
                                              decoration: BoxDecoration(
                                                color:Color(0xff0A7A0D),
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                   Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text('Best Deals \nof Today',
                                                    style: TextStyle(
                                                      height: 1.7,
                                                      fontSize: 19,
                                                      color: kwhite
                                                    ),),
                                                  ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(right:15),
                                                     child: Image.asset('assets/images/offersimage.png',fit:BoxFit.fitHeight,
                                                     height: 110,),
                                                   )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right:40,left: 40,top:40),
                                            child: Container(
                                              height: 130,
                                              decoration: BoxDecoration(
                                                color:kblue,
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                   Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text('Best Deals \nof Today',
                                                    style: TextStyle(
                                                      height: 1.7,
                                                      fontSize: 19,
                                                      color: kwhite
                                                    ),),
                                                  ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(right:15),
                                                     child: Image.asset('assets/images/offersimage.png',fit:BoxFit.fitHeight,
                                                     height: 110,),
                                                   )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                  ],
                                ),
                               ),
                             ),
            ],
          ),
    );
  }
}