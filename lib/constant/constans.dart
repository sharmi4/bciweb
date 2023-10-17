import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const SizedBox ksizedbox20 = SizedBox(height: 20);
const SizedBox ksizedbox10 = SizedBox(height: 10);
const SizedBox ksizedbox30 = SizedBox(height: 30);
const SizedBox ksizedbox40 = SizedBox(height: 40);
const SizedBox kwidth10 = SizedBox(width: 10);
const SizedBox kwidth5 = SizedBox(width: 5);

Color kgrey = Colors.grey;
Color kblue = Color(0xFF003366);
Color knavblue = Color(0xFF000000);
Color kwhite = Colors.white;
Color korange = Color(0xFFFF5003);
Color kOrange = Color(0xFFff5003);

// Color kOrange = Color(0xFFFF5003);

Color kyellow = Color(0xFFff9021);

final kpeople = Image.asset('assets/images/profile.svg');
//final kimgadd = SvgPicture.asset('assets/images/add.svg');

Color ktextblue = Color(0xff003366);
// Color kOrange = Color(0xFFFF5003);

var primaryFont = TextStyle();

//fonts

var primarysmallFont = TextStyle(color: kblue, fontSize: 10);
var primarymediumFont =
    TextStyle(color: kblue, fontSize: 17, fontWeight: FontWeight.w900);
var displayfont =
    GoogleFonts.lato(fontSize: 40, fontWeight: FontWeight.bold, color: kwhite);

var kcontainer = BoxDecoration(
  color: kwhite,
  boxShadow: [
    BoxShadow(
      color:const Color.fromARGB(255, 190, 190, 190).withOpacity(0.5), // Shadow color
      spreadRadius: 1, // The spread radius of the shadow
      blurRadius: 5, // The blur radius of the shadow
      offset: const Offset(0, 3), // The offset of the shadow
    ),
  ],
  border: Border.all(
    color: Colors.grey, // Border color
    width: 0.2, // Border width
  ),
);
