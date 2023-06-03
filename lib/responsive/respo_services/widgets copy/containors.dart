import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/constans.dart';

class offercontainermob extends StatelessWidget {
  const offercontainermob({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.9,
      color: kblue,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/NoPath - Copy (7).png'),
          ),
          kwidth10,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ksizedbox10,
              Text(
                'JK Stores Offer For ',
                style: TextStyle(fontSize: 19, color: kwhite),
              ),
              Text(
                'Casual Shirts',
                style: TextStyle(fontSize: 19, color: kwhite),
              ),
              Text(
                '25% Offer',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                '5 Days Only',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              ksizedbox10
            ],
          )
        ],
      ),
    );
  }
}

class servicecontainermob extends StatelessWidget {
  const servicecontainermob({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 180,
                child: Column(
                  children: [
                    Text(
                      'New Shopping Get In New Coupons availables into more coupons.',
                      style: TextStyle(
                        color: ktextblue,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ksizedbox10,
                    Container(
                      decoration: BoxDecoration(
                          color: kblue, borderRadius: BorderRadius.circular(4)),
                      child: Center(
                          child: Text(
                        'Click Now',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kwhite),
                      )),
                      height: 20,
                      width: 90,
                    )
                  ],
                )),
            Container(
              height: 150,
              child: Image.asset('assets/images/NoPath - Copy (3).png'),
            )
          ],
        ),
      ),
      height: size.height * 0.4,
      width: size.width * 0.7,
      decoration: BoxDecoration(
          color: kyellow, borderRadius: BorderRadius.circular(10)),
    );
  }
}
