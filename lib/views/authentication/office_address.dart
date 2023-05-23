import 'package:bciweb/views/authentication/widgets/formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../constant/constans.dart';

class OfficeAddress extends StatefulWidget {
  const OfficeAddress({super.key});

  @override
  State<OfficeAddress> createState() => _OfficeAddressState();
}

class _OfficeAddressState extends State<OfficeAddress> {
  @override
  Widget build(BuildContext context) {
  //  bool isChecked = false;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Container(
            child: Column(
              children: [ksizedbox30,
                Text(
                  'Office Address',
                  style: TextStyle(
                      fontSize: 30, color: kblue, fontWeight: FontWeight.w700),
                ),
                ksizedbox10,
                Text(
                  'Please fill the details Address',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      //   decoration: TextDecoration.underline,
                      color: kblue),
                ),
                Container(
                    width: size.width * 0.3,
                    child: Column(
                      children: [
                        Formfield(
                          text: 'Door No',
                        ),
                        Formfield(
                          text: 'Building Name',
                        ),
                        Formfield(
                          text: 'Address',
                        ),
                        Formfield(
                          text: 'City',
                        ),
                       Formfield(
                          text: 'State',
                        ),
                      ],
                    )),
                
             //   ksizedbox30,
                ksizedbox30,
                InkWell(
                  onTap: () {Get.toNamed('/residential-address');},
                  child: Container(
                    width: size.width * 0.3,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      border: Border.all(color: const Color(0xffFFBF7E)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFFF5C29),
                          blurRadius: 3.0,
                        )
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFFF5C29),
                          Color(0xFFFFCD38),
                        ],
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ksizedbox10,
              
              ],
            ),
          )),
          Expanded(
            child: Container(
              color: kblue,
              child: Image.asset(
                'assets/images/6.png',
                height: size.height,
              ),
            ),
          )
        ],
      ),
    );
  }
}
