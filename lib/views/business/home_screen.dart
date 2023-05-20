import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
class BusinessHomeScreen extends StatefulWidget {
  const BusinessHomeScreen({super.key});

  @override
  State<BusinessHomeScreen> createState() => _BusinessHomeScreenState();
}

class _BusinessHomeScreenState extends State<BusinessHomeScreen> {
  final _homeController=Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.6,
            decoration: BoxDecoration(
              color: kblue
            ),
            child: Column(
              children: [
                ksizedbox10,
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Image.asset('assets/images/phoneimage.png',height: 15,fit: BoxFit.fitHeight,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('+91 98765 43210',
                      style: TextStyle(color: kwhite,fontSize: 13),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Icon(Icons.mail,color: kwhite,size: 15,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('info@gmail.com',style: TextStyle(color: kwhite,fontSize: 13),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Icon(Icons.location_on,size: 15,color: kwhite,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('Chennai, Tamilnadu - 600026',style: TextStyle(fontSize: 13,color: kwhite),),
                    )
                  ],
                )
              ],
            ),
          ),
          // Positioned(
          // left: -2,
          //   top: 0,
          //   child: ClipPath(
          //     clipper: SideCutClipper(),
          //     child: Container(
          //       height: 20,
          //       width: 40  ,
          //       color: kwhite,
                
          //     )
          //   ),
          // ),
          Positioned(
            right: 6,
            top: 0,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width*0.52,
              color: kOrange,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Text('Follow Us :',style: TextStyle(color: kwhite,fontSize: 15),),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset('assets/images/facebook.png',height: 15,fit: BoxFit.fitHeight,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset('assets/images/twitter.png',fit: BoxFit.fitHeight,height: 15,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset('assets/images/linkedin.png',height: 15,fit: BoxFit.fitHeight,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset('assets/images/instagram.png',height: 15,fit: BoxFit.fitHeight,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset('assets/images/whatsappimage.png',height: 15,fit: BoxFit.fitHeight,),
                  )
              
                ]),
              ),
            ),
          )
        ],
        
       ), preferredSize: Size(50, 
       40)),
       body: ListView(
         children:[ Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0,left: 0),
              child: Row(
                children: [
                  Container(
                    height: 70,width: 170,color:Colors.deepOrange[50],
                    child: Image.asset('assets/images/logo.png') 
                  ),
                  ClipPath(
                    clipper: ClipClipper(),
                    child: Container(height: 70,width: 60,color:Colors.deepOrange[50],
                    ),
                  ),
          
             Obx(()=>
                Padding(
                 padding: const EdgeInsets.only(left: 160),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     TextButton(onPressed: (){
                     _homeController.index(0);
                     _homeController.update();
                     }, 
                     child: Text('HOME',style: TextStyle(
                      color: _homeController.index==0?kOrange:kblue
                     ),)),
                     Padding(
                       padding: const EdgeInsets.only(left: 30),
                       child: TextButton(onPressed: (){
                                   _homeController.index(1);
                                   _homeController.update();
                                  }, 
                                  child: Text('ABOUT',style: TextStyle(
                      color: _homeController.index==1?kOrange:kblue
                     ),)),
                     ),
                 Padding(
                   padding: const EdgeInsets.only(left: 30),
                   child: TextButton(onPressed: (){
                    _homeController.index(2);
                    _homeController.update();
                   }, 
                   child: Text('SPECIALIZED',style: TextStyle(
                      color: _homeController.index==2?kOrange:kblue
                     ),)),
                 ),
                  
                 Padding(
                   padding: const EdgeInsets.only(left: 30),
                   child: TextButton(onPressed: (){
                    _homeController.index(3);
                    _homeController.update();
                   }, 
                   child: Text('CONTACT',style: TextStyle(
                      color: _homeController.index==3?kOrange:kblue
                     ),)),
                 )
                   ],
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 230),
               child: Row(
                     
                 children: [
                   Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                     color: kwhite,
                     shape: BoxShape.circle,
                     boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0.0, 0.75),
                        blurRadius: 2,
                        color: kgrey
                      )
                     ]
                    ),
                    child: Icon(Icons.search,color: kblue,),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 30),
                     child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                         color: kwhite,
                         shape: BoxShape.circle,
                         boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0.0, 0.75),
                            blurRadius: 2,
                            color: kgrey
                          )
                         ]
                      ),
                      
                      child: Icon(Icons.notifications,color: kblue,),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 30),
                     child: Container(
                      height: 35,
                      width:120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors:[
                          korange,
                          kyellow
                        ]),
                        borderRadius: BorderRadius.circular(15)
                              
                      ),
                      child: Center(child: Text('Register Now',
                      style: TextStyle(fontSize: 15,color: kwhite),)),
                     ),
                   )
                 ],
               ),
             ),
           
                   
                ],
              ),
            ),
       
            Stack(
              children: [
                  Image.asset('assets/images/homeflaight.png',fit: BoxFit.cover,),
                  Positioned(
                  left: 30,
                    top:200 ,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text('BOOK',style: TextStyle(color: kOrange,fontSize: 45),),
                            Text(' YOUR FLIGHT',style: TextStyle(fontSize: 45,color: kwhite),)
                          ],
                        ),
                       
                      ],
                    ),
                  ),
                  Positioned(
                    top: 260,
                    child: 
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text('Learn what is a Flight Itinerary for visa, why do Embassies \nask for it and How you can Reserve a Flight Ticket \nwithout Paying for the actual Travel Ticket.',
                              style: TextStyle(fontSize: 17,color: kwhite.withOpacity(0.7)),),
                            )
                        
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
class ClipClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {

    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
