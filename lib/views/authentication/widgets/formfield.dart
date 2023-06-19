import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constant/constans.dart';

class Formfield extends StatelessWidget {
Formfield({super.key, required this.text,required this.controller});
final String text;
TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
               controller: controller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Address can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      isCollapsed: false,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      hintText: text,
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              );
  }
}