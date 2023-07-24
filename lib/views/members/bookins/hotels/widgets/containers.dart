import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../constant/constans.dart';
import '../resort.dart';

class HottelbookingContainer extends StatelessWidget {
  const HottelbookingContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          kwidth10,
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/Mask Group 10.png',
              height: 140,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('3.8')
                        .text
                        .white
                        .semiBold
                        .make()
                        .box
                        .blue900
                        .roundedLg
                        .p8
                        .make(),
                    kwidth5,
                    Text('Very Good Raiting').text.semiBold.blue900.make()
                  ],
                ),
                ksizedbox10,
                Text('Alagoa Resort',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kOrange
                ),),
                
                ksizedbox10,
                Text('Betalbatim, Goa | 1.8 km from Betalbatim Beach',
                style: TextStyle(
                  fontSize: 15,
                  color: kblue
                ),),
                  
                ksizedbox10,
             InkWell(
              onTap: (){
             Get.to(   ResortBooking());
              },
               child: Container(
                height: 30,
                width: 120,
                decoration: BoxDecoration(
                    color: kOrange,
                    borderRadius: BorderRadius.circular(5)     
                ),
                child: Center(
                  child: Text('Couple  Friendly',
                  style: TextStyle(
                    color: kwhite
                  ),),
                ),
               ),
             )
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Per Night').text.white.make(),
                    Text('₹ 3,499').text.white.make(),
                    Text('₹ 2,490').text.white.make(),
                    Text('₹ 508 taxes & fees').text.white.make(),
                    Text('Saving ₹ 1,009').text.white.make(),
                  
                     Padding(
                       padding: const EdgeInsets.only(top: 1),
                       child: Container(
                        height: 22,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kOrange
                        ),
                        child: Center(
                          child: Text('Book Now',
                          style: TextStyle(
                            color: kwhite
                          ),),
                        ),
                       ),
                     )
//.px2()
                  ],
                ),
              ),
              color: kblue,
              width: size.width * 0.1,
              height: size.height,
            ),
          )
        ],
      ),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: kwhite,
          boxShadow: [
            new BoxShadow(
              color: Color.fromARGB(255, 186, 182, 182),
              blurRadius: 20.0,
            ),
          ]),
      // color: kwhite,
      width: size.width * 0.6,
      height: size.height * 0.3,
    );
  }
}
