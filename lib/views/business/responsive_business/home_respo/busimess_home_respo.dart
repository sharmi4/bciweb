import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/responsive/mobile_wdgets/comomappbar.dart';
import '../drawer_business.dart';

class BusinesHomeRespo extends StatefulWidget {
  const BusinesHomeRespo({super.key});

  @override
  State<BusinesHomeRespo> createState() => _BusinesHomeRespoState();
}

class _BusinesHomeRespoState extends State<BusinesHomeRespo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      drawer: DrawerBusiness(),
      body: Column(
        children: [Text('data')],
      ),
    );
  }
}
