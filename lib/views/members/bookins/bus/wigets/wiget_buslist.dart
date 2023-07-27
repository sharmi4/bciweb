import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../constant/constans.dart';

class Buslist extends StatelessWidget {
  const Buslist({
    super.key,
   
  });

 // final Size size;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('National Travels')
                    .text
                    .semiBold
                    .blue900
                    .xl
                    .make(),
                Text('volvo Ac')
                    .text
                    .semiBold
                    .blue900
                    .sm
                    .make(),
              ],
            ),
            Text('13:20')
                .text
                .semiBold
                .blue900
                .xl
                .make(),
            Text('05h  00m')
                .text
                .semiBold
                .blue900
                .xl
                .make(),
            Text('04:30')
                .text
                .semiBold
                .blue900
                .xl
                .make(),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.asset(
                        'assets/images/Icon ionic-md-star.png'),
                    Image.asset(
                        'assets/images/Icon ionic-md-star.png'),
                    Image.asset(
                        'assets/images/Icon ionic-md-star.png'),
                    Image.asset(
                        'assets/images/Icon ionic-md-star.png')
                  ],
                ),
                Text('4.2 Rating')
                    .text
              
                    .blue900
                    .xs
                    .make(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('''250''').text.semiBold.blue900.xl.make(),
                Text('12 seats left').text.xs.make(),
                Container(
                  child: Center(
                      child: Text('cancelation policy')
                          .text
                          .xs
                          .white
                          .make()),
                  height: 15,
                  width: 90,
                  decoration: BoxDecoration(
                      color: kblue,
                      borderRadius: BorderRadius.circular(3)),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Center(
                      child: Text('Select Seat')
                          .text
                          .semiBold
                          .sm
                          .white
                          .make()),
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      color: korange,
                      borderRadius: BorderRadius.circular(16)),
                ),
                Container(
                  child: Center(
                      child: Text('cancelation policy')
                          .text
                          .xs
                          .white
                          .make()),
                  height: 15,
                  width: 90,
                  decoration: BoxDecoration(
                      color: kblue,
                      borderRadius: BorderRadius.circular(3)),
                )
              ],
            )
          ]),
      width: size.width * 0.8,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: kwhite,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 198, 198, 198)
                .withOpacity(0.3), // Shadow color
            spreadRadius: 1, // The spread radius of the shadow
            blurRadius: 5, // The blur radius of the shadow
            offset: Offset(0, 3), // The offset of the shadow
          ),
        ],
        border: Border.all(
          color: Colors.grey, // Border color
          width: 0.2, // Border width
        ),
      ),
    );
  }
}