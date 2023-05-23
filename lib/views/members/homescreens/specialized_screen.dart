import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/widget/appbar.dart';
import 'package:flutter/material.dart';

import '../common.dart';
import '../commoncontainer.dart';

class SpecializedScreen extends StatefulWidget {
  // ignore: constant_identifier_names
static const Namedroutes='/specializedscreen';
  

  @override
  State<SpecializedScreen> createState() => _SpecializedScreenState();
}

class _SpecializedScreenState extends State<SpecializedScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: PreferredSize(child: CommonScreen(), 
     preferredSize:Size(double.infinity, 
             40)),
      body: ListView(
        //physics:ScrollPhysics(),
        children:[ CommonContainer(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(image:AssetImage('assets/images/speclbackground.png',),fit: BoxFit.fill )
          ),
          child:Center(child: Text('SPECIALIZED US',
          style: TextStyle(fontSize: 30,color: kwhite),)) ),
          
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('SERVICES',style: TextStyle(fontSize: 21.5,color: kOrange,
                fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25,),
            child: Text('FIND THE SPECIALIZED US YOU NEED',textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35,color: kblue,
            fontWeight: FontWeight.bold,),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text('Membership features are the benefits or privileges that a member of a particular \ngroup or organization receives. These features can vary widely depending on the \ntype of membership and the goals and objectives of the \norganization. Some common membership features include:',
               textAlign: TextAlign.center,style: TextStyle(height: 2),),           
              ],
            ),
          ),
          ksizedbox30,
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Container(
                        height: 220,
                        width: 230,
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 1,
                              color: kgrey
                            )
                          ],
                           color: kwhite,
                          ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Image.asset('assets/images/packages.png',height: 50,fit: BoxFit.fitHeight,),
                            ),
                            ksizedbox20,
                            Text('SUBSCRIBE PACKAGES',
                            style: TextStyle(color: kblue,fontWeight: FontWeight.bold),),
                            ksizedbox20,
                            Text('These packages can include a range \nof features and benefits, such as',textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13,height: 1.2),)
                          ],
                        ),
                      ),
                      Container(
                        height: 220,
                        width: 230,
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 1,
                              color: kgrey
                            )
                          ],
                           color: kwhite,
                          ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Image.asset('assets/images/membership.png',height: 50,fit: BoxFit.fitHeight,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text('MEMBERSHIPS',style: TextStyle(color: kblue,fontWeight: FontWeight.bold)),
                            ),
                            ksizedbox20,
                            Text('Memberships are typically offered by \norganizations or groups as a way for \nindividuals to gain access to specific \nbenefits or privileges.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13,height: 1.2),)
                          ],
                        ),
                      ),
                      Container(
                        height: 220,
                        width: 230,
                          decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 1,
                              color: kgrey
                            )
                          ],
                           color: kwhite,
                          ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Image.asset('assets/images/coupons.png',height: 50,fit: BoxFit.fitHeight,),
                            ),
                            ksizedbox20,
                            Text('COUPONS',style: TextStyle(color: kblue,fontWeight: FontWeight.bold)),
                            ksizedbox20,
                            Text('Coupons are a type of promotional \noffer that provides a discount or \nspecial deal on a product or service.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13,height: 1.2),)
                          ],
                        ),
                      ),
           ],
         ),
         ksizedbox30,
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             Container(
                        height: 215,
                        width: 230,
                          decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 1,
                              color: kgrey
                            )
                          ],
                           color: kwhite,
                          ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Image.asset(  'assets/images/booking.png',height: 50,fit: BoxFit.fitHeight,),
                            ),
                            ksizedbox20,
                            Text('BOOKINGS',style: TextStyle(color: kblue,fontWeight: FontWeight.bold)),
                            ksizedbox20,
                            Text('Bookings refer to the process of \nreserving or scheduling a particular \nservice, event, or accommodation.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13,height: 1.2),)
                          ],
                        ),
                      ),
                      Container(
                        height: 220,
                        width: 230,
                         
                          decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 1,
                              color: kgrey
                            )
                          ],
                           color: kwhite,
                          ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Image.asset( 'assets/images/offers.png',height: 50,fit: BoxFit.fitHeight,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text('OFFERS',style: TextStyle(color: kblue,fontWeight: FontWeight.bold)),
                            ),
                            ksizedbox20,
                            Text('Offers are promotions or deals that \ncompanies or businesses provide to \ntheir customers in order to incentivize \nthem to make a purchase or take. advantage of a specific service.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13,height: 1.2),)
                          ],
                        ),
                      ),
                      Container(
                        height: 220,
                        width: 230,
                          decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 1,
                              color: kgrey
                            )
                          ],
                           color: kwhite,
                          ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Image.asset(  'assets/images/wallets.png',height: 50,fit: BoxFit.fitHeight,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text('WALLETS',
                              style: TextStyle(color: kblue,fontWeight: FontWeight.bold),),
                            ),
                                                        Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text('Digital wallets are software \napplications that allow users to securely store and manage various \npayment methods, such as bank account information.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize:13,height: 1.2 ),),
                            )
                          ],
                        ),
                      ),
                        
          ],
         ),
        
         Padding(
           padding: const EdgeInsets.only(top: 50),
           child:
               Row(
                 children: [
                   Container(
                                    
                                    width: MediaQuery.of(context).size.width,
                                    color: kgrey.withOpacity(0.2),
                                    child: Row(
                                      children: [
                                        Row(
                                          children:[ Image.asset('assets/images/speclbackground2.png',
                                          height: 300,
                                          fit: BoxFit.cover,),
                                          ]
                                        ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30,left: 550),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('CLUB SERVICES',textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 30,
                      color: kblue,fontWeight: FontWeight.bold),),
                      ksizedbox10,
                      Container(
                        height: 7,
                        width: 60,color: kOrange,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text('Club services refer to the various \namenities and offerings provided by \nclubs to their members. These services \ncan vary widely depending on the type of \nclub and its focus, but may include.',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: kblue,
                          height: 2
                        ),),
                      ),
                      ksizedbox20,
                                      ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kblue,
                    minimumSize: Size(160, 40)
                  ),
                  onPressed: (){}, 
                child:Text('Subscribe Now',
                style: TextStyle(fontSize: 16),))
                    ],
                  ),
                ),

                                      ],
                                    ),
                                  ),
                

             ],
           ),
         ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/homebackground.png'))
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text('SERVICES',style: TextStyle(fontSize: 21.5,
                color: kOrange,
                fontWeight: FontWeight.bold),),
              ),
              ksizedbox20,
              Text('FIND THE SERVICES YOU NEED',
              style: TextStyle(fontSize: 35,color: kblue,fontWeight: FontWeight.bold),),
              ksizedbox20,
              Text('I"d be happy to help you find the services you need! Can you please provide me \nwith some more information about what type of services you are looking for? \nHere are some examples of services that people often search for',
              textAlign: TextAlign.center,
              style: TextStyle(height: 2),),
              ksizedbox30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 90,
                    width: 100,
                   decoration: BoxDecoration(
                     color: kOrange,
                     boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0.0, 0.75),
                        blurRadius: 5,
                        color: kOrange
                      )
                     ]
                   ),
                    child: Center(child: Text('01',
                    style: TextStyle(color: kwhite,
                    fontSize: 35
                    ),)),
                  ),
                                    Container(
                    height: 90,
                    width: 100,
                   decoration: BoxDecoration(
                     color: kyellow,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0.0, 0.75),
                        blurRadius: 5,
                        color:kyellow 
                      )
                    ]
                   ),
                    child: Center(child: Text('03',style: TextStyle(
                      color: kwhite,fontSize: 35
                    ),)),
                  )
                ],
              ),
              ksizedbox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('SUBSCRIBE',
                  style: TextStyle(
                    fontSize: 21,
                    color: kOrange,
                    fontWeight: FontWeight.bold
                  ),),
                  Text('PURCHASE',
                  style: TextStyle(
                    color: kyellow,
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                  ),),
                  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 100,
                    decoration: BoxDecoration(
                        color: kblue,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0.0, 0.75),
                            blurRadius: 5,
                            color: kblue
                          )
                        ]
                    ),
                   
                    child: Center(
                      child: Text('02',
                      style: TextStyle(fontSize: 35,
                      color: kwhite),),
                    ),
                  )
                ],
              ),
              ksizedbox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('MEMBERSHIPS',style: TextStyle(fontSize: 21,
                  color: kblue,
                  fontWeight: FontWeight.bold),)
                ],
              )
            ],
          ),
        ),
        ksizedbox40,
        Text('FREQUENTLY ASKED QUESTIONS',textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20,
        color: kblue),),
        Padding(
          padding: const EdgeInsets.only(left: 200,right: 200,
          top: 50),
          child: Container(
            alignment: Alignment.center,
            height: 110,
            width: MediaQuery.of(context).size.width*0.2,
            color: kgrey.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 300),
                      child: Text('Question number 01 goes in here?',
                      style: TextStyle(color: Color(0xff2980B9),
                      fontSize: 15.5),),
                    ),
                                   Icon(Icons.expand_less)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 80),
                child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut pretium pretium tempor. Ut eget imperdiet neque. \nIn volutpat ante semper diam molestie, et aliquam erat laoreet.',
                style: TextStyle(fontSize: 13),),
              )
            ]),
          ),
          
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30,left: 46,right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Question number 02 goes in here?',
              style: TextStyle(fontSize: 15.5,color: Color(0xff2980B9),),),
               Padding(
                 padding: const EdgeInsets.only(right: 50),
                 child: Icon(Icons.expand_more),
               )
            ],
          ),
        ),
         Padding(
          padding: const EdgeInsets.only(top: 30,left: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Question number 03 goes in here?',
              style: TextStyle(fontSize: 15.5,color: Color(0xff2980B9),),),
               Padding(
                 padding: const EdgeInsets.only(right: 50),
                 child: Icon(Icons.expand_more),
               )
            ],
          ),
        ),
                 Padding(
          padding: const EdgeInsets.only(top: 30,left: 46),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Question number 04 goes in here?',
              style: TextStyle(fontSize: 15.5,color: Color(0xff2980B9),),),
               Padding(
                 padding: const EdgeInsets.only(right: 50),
                 child: Icon(Icons.expand_more),
               )
            ],
          ),
        ),

        ]
      ),
    );
  }
}