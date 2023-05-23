import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/members/common.dart';
import 'package:bciweb/views/members/commoncontainer.dart';
import 'package:flutter/material.dart';
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: CommonScreen(), 
      preferredSize: Size(double.infinity, 
             40)),
             body: Column(
               children: [
                 CommonContainer(),
                 Container(
                  height: 235,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/contactbackground.png',),
                    fit: BoxFit.cover)
                  ),
                  child: Center(
                    child: Text('CONTACT US',
                    style: TextStyle(fontSize: 35,
                    color: kwhite),),
                  ),
                 )
               ],
             ),
             
    );
  }
}