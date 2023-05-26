import 'dart:js_util';

import 'package:bciweb/constant/constans.dart';
import 'package:flutter/material.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:kblue,
      shadowColor: kOrange,
    child: ListView(
    
      children: [
        Row(
          children: [
           // Image.asset('')
          ],
        ),
        ksizedbox40,
        Padding(
          padding: const EdgeInsets.only(top: 150,left: 10),
          child: Row(
            children: [
              TextButton(onPressed: (){}, 
              child: Text('HOME',
              style: TextStyle(
                fontSize: 16,
                color: kwhite
              ),))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7,left: 10,right: 10),
          child: Divider(
            color: kgrey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15,left: 10),
          child: Row(
            children: [
              TextButton(onPressed: (){}, 
              child: Text('ABOUT',
              style: TextStyle(
                fontSize: 16,
                color: kwhite
              ),)),
            ],
          ),
        ),
                Padding(
                  padding: const EdgeInsets.only(top: 7,left: 10,right: 10),
                  child: Divider(
                          color: kgrey,
                        ),
                ),
        Padding(
          padding: const EdgeInsets.only(top: 10,left: 10),
          child: Row(
            children: [
              TextButton(onPressed: (){}, 
              child: Text('SPECIALIZED',
              style: TextStyle(
                fontSize: 16,
                color: kwhite
              ),))
            ],
          ),
        ),
                Padding(
                  padding: const EdgeInsets.only(top: 7,left: 10,right: 10),
                  child: Divider(
                          color: kgrey,
                        ),
                ),
        Padding(
          padding: const EdgeInsets.only(top: 10,left: 10),
          child: Row(
            children: [
              TextButton(onPressed: (){}, 
              child: Text('CONTACT',
              style: TextStyle(
                fontSize: 16,
                color: kwhite
              ),))
            ],
          ),
        ),
                Padding(
                  padding: const EdgeInsets.only(top: 7,left: 10,right: 10),
                  child: Divider(
                          color: kgrey,
                        ),
                ),
               
                 Padding(
                   padding: const EdgeInsets.only(top: 100),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Container(
                             height: 30,
                             width: 110,
                             decoration: BoxDecoration(
                               gradient: LinearGradient(colors: [
                                 kyellow,
                                 kOrange
                               ]),
                               borderRadius: BorderRadius.circular(8)
                             ),
                             child: Center(
                               child: Text('REGISTER',style: TextStyle(
                                 color: kwhite
                               ),),
                             ),
                           )
                         ],
                       ),
                 ),
    
      Padding(
        padding: const EdgeInsets.only(top: 150,left: 20),
        child: Row(
         
          children: [
            Image.asset('assets/images/phoneimage.png',
        height: 15,fit: BoxFit.fitHeight,),
         Padding(
           padding: const EdgeInsets.only(left: 13),
           child: Text('+91 8939 804 805 ',
           style: TextStyle(color: kwhite,fontSize: 12),),
         ),
        ]),
      ),
       Padding(
                      padding: const EdgeInsets.only(left: 20,top: 7),
                      child: Row(
                        children: [
                          Icon(Icons.mail,color: kwhite,size: 15,),
                           Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Text('customercare@bcipvtltd.com',style: TextStyle(color: kwhite,fontSize: 13),),
                    ),
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left: 20,top: 7),
                      child: Row(
                        children: [
                          Icon(Icons.location_on,size: 15,color: kwhite,),
                                              Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text('Chennai, Tamilnadu - 600026',style: TextStyle(fontSize: 13,color: kwhite),),
                    )
                        ],
                      ),
                    ),
                   Padding(
                padding: const EdgeInsets.only(left: 23,top: 10),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text('Follow Us :',style: TextStyle(color: kwhite,fontSize: 13),),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Image.asset('assets/images/facebook.png',height: 15,fit: BoxFit.fitHeight,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Image.asset('assets/images/twitter.png',fit: BoxFit.fitHeight,height: 15,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Image.asset('assets/images/linkedin.png',height: 15,fit: BoxFit.fitHeight,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Image.asset('assets/images/instagram.png',height: 15,fit: BoxFit.fitHeight,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Image.asset('assets/images/whatsappimage.png',height: 15,fit: BoxFit.fitHeight,),
                  )
              
                ]),
              ),
      ],
    ),
    );
  }
}