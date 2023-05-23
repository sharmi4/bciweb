import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:flutter/material.dart';

import '../../registerhomescreen/common_reg_appbar';

class RegisterWalletScreen extends StatefulWidget {
  const RegisterWalletScreen({super.key});

  @override
  State<RegisterWalletScreen> createState() => _RegisterWalletScreenState();
}

class _RegisterWalletScreenState extends State<RegisterWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: RegisterCommonAppbar(), preferredSize: Size(double.infinity, 40)),
          body: ListView(
            children:[ Column(
              children: [
                RegisterCommonContainer(),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/Group 39755.png',
                    ),
                    fit: BoxFit.cover)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 125),
                    child: Text('Wallet Us',textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: kwhite),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 40),
                  child: Row(
                    children: [
                      Text('Total Wallet',
                      style: TextStyle(
                        fontSize: 32,
                        color: kblue,
                
                      ),)
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width*0.6,
                      decoration:BoxDecoration(
                        color: kOrange
                      ),
                    )
                  ],
                )
              ],
            ),
            ]
          ),
    );
  }
}