import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/constans.dart';

class DrawerBusiness extends StatelessWidget {
  const DrawerBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kblue,
      shadowColor: kOrange,
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 10),
          child: Row(
            children: [
              TextButton(
                  onPressed: () {
                 //   Get.to(MobileHome());
                  },
                  child: Text(
                    'HOME',
                    style: TextStyle(fontSize: 16, color: kwhite),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
