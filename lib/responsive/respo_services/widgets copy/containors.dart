import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/constans.dart';

class offercontainermob extends StatelessWidget {
  String image;
  String title;
  String description;
   offercontainermob({
    required this.image,
    required this.description,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.9,
     
    decoration: BoxDecoration(
         color: kblue,
         borderRadius: BorderRadius.circular(10)
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(image,
              fit: BoxFit.fitHeight,height: 100,)),
          ),
          kwidth10,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ksizedbox10,
              Text(
                title,
                style: TextStyle(fontSize: 14, color: kwhite),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 14, color: kwhite),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                title,
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

  servicecontainermob({
    required this.description,
    required this.image,
    required this.title,
    super.key,
  });
 String image;
 String title;
 String description;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: ktextblue,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ksizedbox30,
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
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(image,fit:BoxFit.fitHeight,height: 100,)),
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
