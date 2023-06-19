import 'package:bciweb/constant/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';

class ResortBooking extends StatelessWidget {
  const ResortBooking({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          RegisterCommonContainer(),
          Stack(
            children: [
              Container(
                  color: Colors.black,
                  width: size.width,
                  child: Image.asset(
                    'assets/images/Group 39748.png',
                    opacity: const AlwaysStoppedAnimation(2),
                  )),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Center(
                      child:
                          Text('Choose Hotel :)').text.bold.white.xl6.make()))
            ],
          ),
          Row(
            children: [
              Container(
                //   color: kblue,
                height: size.height * 0.6,
                width: size.width * 0.3,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/hotel3.png',
                      width: size.width,
                    ),
                    ksizedbox10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/images/hotel2.png',
                          width: size.width * 0.1,
                        ),

                        ///  kwidth5,
                        Image.asset(
                          'assets/images/hotel1.png',
                          width: size.width * 0.1,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: size.height * 0.6,
                //    width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Alagoa Resort').text.blue900.xl5.semiBold.make(),
                    Text('''Betalbatim, Goa  1.8 km from Betalbatim Beach''')
                        .text
                        .blue900
                        .xl2
                        .thin
                        .make(),
                    Text('Raiting').text.blue900.xl2.semiBold.make().p1(),
                    Text('Per Night')
                        .text
                        .blue900
                        .xl2
                        .semiBold
                        .thin
                        .make()
                        .p1(),
                    Text('₹ 3,550 ').text.blue900.xl2.make().p1(),
                    Text('₹ 2,806 ').text.orange500.xl2.make().p1(),
                    Text(' + ₹ 573 taxes & fees ').text.gray500.xl2.make().p1(),
                    Text(' Saving ₹ 744').text.orange500.thin.xl2.make().p1(),
                    Container(
                      height: 50,
                      width: 160,
                      child: Center(
                          child:
                              Text('Book Now').text.semiBold.xl2.white.make()),
                      decoration: BoxDecoration(
                          color: kblue,
                          borderRadius: BorderRadius.circular(15)),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              children: [
                Text('About Alagoa Resort').text.blue900.xl5.semiBold.make(),
                Text(
                  'Close to Betalbatim Beach, this hotel in Goa comes with a pool, ',
                  textAlign: TextAlign.center,
                ).text.blue900.xl2.semiBold.make().p1(),
                Text(
                  ' lawn, bar, restaurant & well-appointed rooms.',
                  textAlign: TextAlign.center,
                ).text.blue900.xl2.semiBold.make().p1(),
                ksizedbox30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    hotelcontainers(
                      img: 'assets/images/hoteld.png',
                      text1: 'Food ',
                      text2: 'And Drinking',
                    ),
                    hotelcontainers(
                        img: 'assets/images/hotele.png',
                        text1: 'Location ',
                        text2: '& Surroundings'),
                    hotelcontainers(
                        img: 'assets/images/hotela.png',
                        text1: 'Property ',
                        text2: 'Highlights'),
                    hotelcontainers(
                        img: 'assets/images/hotelb.png',
                        text1: 'Room details ',
                        text2: 'and Amenities'),
                    hotelcontainers(
                        img: 'assets/images/hotelc.png',
                        text1: 'Activities ',
                        text2: '& Nearby Attractions'),
                    hotelcontainers(
                        img: 'assets/images/hotelf.png',
                        text1: 'How to Reach ',
                        text2: 'the Property')
                  ],
                )
              ],
            ),
            width: size.width,
            height: 340,
            color: Colors.grey[200],
          ),
          Text('User Ratings & Reviews').text.blue900.xl5.semiBold.make(),
          Text(
            'Important information that you need to know before you book!',
            textAlign: TextAlign.center,
          ).text.blue900.xl2.semiBold.make().p1(),
          ksizedbox30,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
             child:Column(children: [],) ,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15)),
              width: size.width,
              height: 300,
            ),
          ),
          RegisterCommonBottom()
        ],
      )),
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
    );
  }
}

class hotelcontainers extends StatelessWidget {
  const hotelcontainers({
    super.key,
    required this.img,
    required this.text1,
    required this.text2,
  });
  final String img;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img,
            height: 30,
          ),
          Text(text1).text.sm.semiBold.white.make().p4(),
          Text(text2).text.sm.semiBold.white.make(),
        ],
      ),
      decoration:
          BoxDecoration(color: kblue, borderRadius: BorderRadius.circular(15)),
    );
  }
}
