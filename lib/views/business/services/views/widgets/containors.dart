import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/constans.dart';

class offercontainer extends StatelessWidget {
  const offercontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      width: size.width * 0.4,
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
                style: TextStyle(fontSize: 25, color: kwhite),
              ),
              Text(
                'Casual Shirts',
                style: TextStyle(fontSize: 25, color: kwhite),
              ),
              Text(
                '25% Offer',
                style: TextStyle(fontSize: 25, color: Colors.grey),
              ),
              Text(
                '5 Days Only',
                style: TextStyle(fontSize: 25, color: Colors.grey),
              ),
              ksizedbox10
            ],
          )
        ],
      ),
    );
  }
}

class servicecontainer extends StatelessWidget {
  String title;
  String image;
  String description;
 servicecontainer({
    super.key,
    required this.description,required this.image,required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 200,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:30),
                      child: Column(
                        children: [
                          Text(
                          description,
                            style: TextStyle(
                              height: 1,
                              color: ktextblue,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ksizedbox10,
                    Container(
                      decoration: BoxDecoration(
                          color: kblue, borderRadius: BorderRadius.circular(4)),
                      child: Center(
                          child: Text(
                      'Check Now',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kwhite),
                      )),
                      height: 20,
                      width: 100,
                    )
                  ],
                )),
            Container(
              height: 150,
              width:170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(image,fit: BoxFit.cover,)),
            )
          ],
        ),
      ),
      height: 160,
      width: 400,
      decoration: BoxDecoration(
          color: kyellow, borderRadius: BorderRadius.circular(10)),
    );
  }
}
