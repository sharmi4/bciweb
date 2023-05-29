import 'package:bciweb/views/authentication/widgets/formfield.dart';
import 'package:flutter/material.dart';


import '../../constant/constans.dart';

class ResidentialAddress extends StatefulWidget {
  const ResidentialAddress({super.key});

  @override
  State<ResidentialAddress> createState() => _ResidentialAddressState();
}

class _ResidentialAddressState extends State<ResidentialAddress> {
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
              children: [
                ksizedbox30,
                Text(
                  'Residential Address',
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
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Personal ID'),
                                  Icon(Icons.upload_sharp,color: kgrey,)
                                ],
                              ),
                            ),
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0xff707070))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Adhaar ID'),
                                  Icon(
                                    Icons.upload_sharp,
                                    color: kgrey,
                                  )
                                ],
                              ),
                            ),
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0xff707070))),
                          ),
                        )
                      ],
                    )),

                //   ksizedbox30,
                ksizedbox30,
                InkWell(
                  onTap: () {},
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
