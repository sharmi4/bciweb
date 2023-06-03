import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/constans.dart';

class Respooffers_container extends StatelessWidget {
  const Respooffers_container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(125, 158, 158, 158).withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: kwhite,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      width: size.width*0.8,
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
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Casual Shirts',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                '25% Offer',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              Text(
                '5 Days Only',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              ksizedbox10,
            ],
          ),
        ],
      ),
    );
  }
}