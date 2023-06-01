import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../constant/constans.dart';

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
          Image.asset(
            'assets/images/Mask Group 10.png',
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                'Alagoa Resort'.text.bold.xl3.blue900.make(),
                ksizedbox10,
                Text('Betalbatim, Goa | 1.8 km from Betalbatim Beach')
                    .text
                    .xl
                    .thin
                    .blue900
                    .make(),
                ksizedbox10,
                VxBox(
                        child:
                            Text('Explore Now').text.xl.thin.white.make().px2())
                    .color(Vx.orange500)
                    .roundedLg
                    .p16
                    .make()
                    .px2()
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
                    VxBox(
                            child: Text('Book Now')
                                .text
                                .semiBold
                                .thin
                                .white
                                .make()
                                .px2())
                        .color(Vx.orange500)
                        .roundedLg
                        .p12
                        .make()
                        .px2()
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
