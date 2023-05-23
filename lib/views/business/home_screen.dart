// import 'package:bciweb/constant/constans.dart';
// import 'package:bciweb/controller/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class BusinessHomeScreen extends StatefulWidget {
//   const BusinessHomeScreen({super.key});

//   @override
//   State<BusinessHomeScreen> createState() => _BusinessHomeScreenState();
// }

// class _BusinessHomeScreenState extends State<BusinessHomeScreen> {
//   final _homeController = Get.find<HomeController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//           child: Stack(
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.6,
//                 decoration: BoxDecoration(color: kblue),
//                 child: Column(
//                   children: [
//                     ksizedbox10,
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 7),
//                           child: Image.asset(
//                             'assets/images/phoneimage.png',
//                             height: 15,
//                             fit: BoxFit.fitHeight,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text(
//                             '+91 98765 43210',
//                             style: TextStyle(color: kwhite, fontSize: 13),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 45),
//                           child: Icon(
//                             Icons.mail,
//                             color: kwhite,
//                             size: 15,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 5),
//                           child: Text(
//                             'info@gmail.com',
//                             style: TextStyle(color: kwhite, fontSize: 13),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 45),
//                           child: Icon(
//                             Icons.location_on,
//                             size: 15,
//                             color: kwhite,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 5),
//                           child: Text(
//                             'Chennai, Tamilnadu - 600026',
//                             style: TextStyle(fontSize: 13, color: kwhite),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               // Positioned(
//               // left: -2,
//               //   top: 0,
//               //   child: ClipPath(
//               //     clipper: SideCutClipper(),
//               //     child: Container(
//               //       height: 20,
//               //       width: 40  ,
//               //       color: kwhite,

//               //     )
//               //   ),
//               // ),
//               Positioned(
//                 right: 6,
//                 top: 0,
//                 child: Container(
//                   height: 50,
//                   width: MediaQuery.of(context).size.width * 0.52,
//                   color: kOrange,
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             'Follow Us :',
//                             style: TextStyle(color: kwhite, fontSize: 15),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Image.asset(
//                               'assets/images/facebook.png',
//                               height: 15,
//                               fit: BoxFit.fitHeight,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Image.asset(
//                               'assets/images/twitter.png',
//                               fit: BoxFit.fitHeight,
//                               height: 15,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Image.asset(
//                               'assets/images/linkedin.png',
//                               height: 15,
//                               fit: BoxFit.fitHeight,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Image.asset(
//                               'assets/images/instagram.png',
//                               height: 15,
//                               fit: BoxFit.fitHeight,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Image.asset(
//                               'assets/images/whatsappimage.png',
//                               height: 15,
//                               fit: BoxFit.fitHeight,
//                             ),
//                           )
//                         ]),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           preferredSize: Size(50, 40)),
//       body: ListView(children: [
//         Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 0, left: 0),
//               child: Row(
//                 children: [
//                   Container(
//                       height: 70,
//                       width: 170,
//                       color: Colors.deepOrange[50],
//                       child: Image.asset('assets/images/logo.png')),
//                   ClipPath(
//                     clipper: ClipClipper(),
//                     child: Container(
//                       height: 70,
//                       width: 60,
//                       color: Colors.deepOrange[50],
//                     ),
//                   ),
//                   Obx(
//                     () => Padding(
//                       padding: const EdgeInsets.only(left: 160),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           TextButton(
//                               onPressed: () {
//                                 _homeController.index(0);
//                                 _homeController.update();
//                               },
//                               child: Text(
//                                 'HOME',
//                                 style: TextStyle(
//                                     color: _homeController.index == 0
//                                         ? kOrange
//                                         : kblue),
//                               )),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 30),
//                             child: TextButton(
//                                 onPressed: () {
//                                   _homeController.index(1);
//                                   _homeController.update();
//                                 },
//                                 child: Text(
//                                   'ABOUT',
//                                   style: TextStyle(
//                                       color: _homeController.index == 1
//                                           ? kOrange
//                                           : kblue),
//                                 )),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 30),
//                             child: TextButton(
//                                 onPressed: () {
//                                   _homeController.index(2);
//                                   _homeController.update();
//                                 },
//                                 child: Text(
//                                   'SPECIALIZED',
//                                   style: TextStyle(
//                                       color: _homeController.index == 2
//                                           ? kOrange
//                                           : kblue),
//                                 )),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 30),
//                             child: TextButton(
//                                 onPressed: () {
//                                   _homeController.index(3);
//                                   _homeController.update();
//                                 },
//                                 child: Text(
//                                   'CONTACT',
//                                   style: TextStyle(
//                                       color: _homeController.index == 3
//                                           ? kOrange
//                                           : kblue),
//                                 )),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 230),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 30,
//                           width: 30,
//                           decoration: BoxDecoration(
//                               color: kwhite,
//                               shape: BoxShape.circle,
//                               boxShadow: <BoxShadow>[
//                                 BoxShadow(
//                                     offset: Offset(0.0, 0.75),
//                                     blurRadius: 2,
//                                     color: kgrey)
//                               ]),
//                           child: InkWell(
//                             onTap: () {
//                               Get.toNamed('/services');
//                             },
//                             child: Icon(
//                               Icons.search,
//                               color: kblue,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 30),
//                           child: Container(
//                             height: 30,
//                             width: 30,
//                             decoration: BoxDecoration(
//                                 color: kwhite,
//                                 shape: BoxShape.circle,
//                                 boxShadow: <BoxShadow>[
//                                   BoxShadow(
//                                       offset: Offset(0.0, 0.75),
//                                       blurRadius: 2,
//                                       color: kgrey)
//                                 ]),
//                             child: InkWell(
//                                 onTap: () {
//                                   Get.toNamed('/subscribe');
//                                 },
//                                 child: Icon(
//                                   Icons.notifications,
//                                   color: kblue,
//                                 )),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 30),
//                           child: InkWell(
//                             onTap: () => Get.toNamed('/landing-screen'),
//                             child: Container(
//                               height: 35,
//                               width: 120,
//                               decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                       colors: [korange, kyellow]),
//                                   borderRadius: BorderRadius.circular(15)),
//                               child: Center(
//                                   child: Text(
//                                 'Register Now',
//                                 style: TextStyle(fontSize: 15, color: kwhite),
//                               )),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Stack(
//               children: [
//                 Image.asset(
//                   'assets/images/homeflaight.png',
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   left: 40,
//                   top: 200,
//                   child: Row(
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             'BOOK',
//                             style: TextStyle(color: kOrange, fontSize: 45),
//                           ),
//                           Text(
//                             ' YOUR FLIGHT',
//                             style: TextStyle(fontSize: 45, color: kwhite),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                     top: 265,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 40),
//                       child: Text(
//                         'Learn what is a Flight Itinerary for visa, why do Embassies \nask for it and How you can Reserve a Flight Ticket \nwithout Paying for the actual Travel Ticket.',
//                         style: TextStyle(
//                             fontSize: 17, color: kwhite.withOpacity(0.7)),
//                       ),
//                     )),
//                 Positioned(
//                     top: 375,
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 30),
//                           child: Container(
//                             height: 38,
//                             width: 130,
//                             decoration: BoxDecoration(
//                                 color: kwhite,
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Row(
//                                 children: [
//                                   Text('BOOK NOW'),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Icon(Icons.arrow_forward),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 30),
//                           child: Container(
//                             height: 38,
//                             width: 130,
//                             decoration: BoxDecoration(
//                                 color: kblue,
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     'SUBSCRIBE',
//                                     style: TextStyle(color: kwhite),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Icon(
//                                       Icons.arrow_forward,
//                                       color: kwhite,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ))
//               ],
//             ),
//             ksizedbox40,
//             Stack(
//               children: [
//                 Image.asset('assets/images/homebackground.png'),
//                 Positioned(
//                   left: 400,
//                   top: 50,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         '3  STEPS  OR  THE  PERFECT  CLUB',
//                         style: TextStyle(fontSize: 22, color: kOrange),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 9),
//                         child: Text(
//                           'FIND  BEST  MEMBERSHIPS',
//                           style: TextStyle(
//                               fontSize: 33,
//                               color: kblue,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: 150,
//                   left: 370,
//                   child: Column(
//                     children: [
//                       Text(
//                         'To find the best membership programs, it"s important to consider what you"re ',
//                         style: TextStyle(fontSize: 17),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 6),
//                         child: Text(
//                           'looking for in a membership. Here are some general tips to help you find a',
//                           style: TextStyle(fontSize: 17),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 6),
//                         child: Text(
//                           'membership that suits your needs:',
//                           style: TextStyle(fontSize: 17),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                     top: 320,
//                     left: 230,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Image.asset('assets/images/apartmentimage.png'),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 240),
//                               child:
//                                   Image.asset('assets/images/bazarimage.png'),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 240),
//                               child:
//                                   Image.asset('assets/images/serviceimage.png'),
//                             )
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 20),
//                               child: Text(
//                                 'HOTELS & SERVICES',
//                                 style: TextStyle(
//                                     color: kblue,
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 180, top: 20),
//                               child: Text(
//                                 'ESSENTIAL BAZZAR',
//                                 style: TextStyle(
//                                     color: kblue,
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 120, top: 20),
//                               child: Text(
//                                 'A TO Z UTILITY SERVICE & \n    ONLINE DISCOUNTS',
//                                 style: TextStyle(
//                                     color: kblue,
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(right: 0, top: 10),
//                               child: Text(
//                                   'BCI Prestigious Members Can Access our \nAmazing Discounts Coupons @ Our \nAssociate Hotels / Resorts / Spas / \nSaloons / Services Apartments / Marriage \nHalls / Tours & Travels.'),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 40, top: 10),
//                               child: Text(
//                                   'BCI Prestigious Members Can Access our \nAmazing Discounts Coupons @ Our \nAssociate Provision / Restaurant / \nJewellery / Textile / Complimentary \nCoupon.'),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 40, top: 10),
//                               child: Text(
//                                   'BCI Prestigious Members Can Access our \nAmazing Discounts Coupons @ Our \nAssociate Utility Service Providers / \nOnline Shopping / Online Recharge / \nOnline Cinema Tickets.'),
//                             )
//                           ],
//                         )
//                       ],
//                     )),
//               ],
//             ),
//             Stack(
//               children: [
//                 Container(
//                   height: 460,
//                   width: MediaQuery.of(context).size.width,
//                   color: kgrey.withOpacity(0.1),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 210, top: 40),
//                         child: Text(
//                           'BCI INDIA INFORMA',
//                           style: TextStyle(
//                               fontSize: 27,
//                               color: kblue,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20, left: 210),
//                         child: Text(
//                           'Since 2 Decade BCI INDIA Is Servicing In India"s \nfirst family entertainment club, Have about 45000 \nMembers. Now We Are Providing New And Vibrate \nManagement Is Excited To Offer Our Members The \nBest Multi-Clubbing Experience Of Life Time.',
//                           style: TextStyle(fontSize: 15),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 40, left: 210),
//                         child: Text(
//                             'BCI INDIA in the Google play store makes world of \nopportunities and services, offers, value added mutual \nbenefits to members & vendors. Now we are \nExpanding Our Business Operations All over India, we \nare estimating about 1 Million Members to subscribe \nwithin Couple of Years, in The Way Of All Digital, Social, \nMedia, Member 2 Member, Vendors 2 Members & Etc.'),
//                       )
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                     right: -1,
//                     top: 80,
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 80),
//                       child: Image.asset(
//                         'assets/images/homebackground2.png',
//                         height: 400,
//                       ),
//                     ))
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: Stack(
//                 children: [
//                   Image.asset('assets/images/homebackground3.png'),
//                   Positioned(
//                       top: 70,
//                       left: 460,
//                       child: Text(
//                         'WHY CHOOSE US',
//                         style: TextStyle(fontSize: 55, color: kwhite),
//                       )),
//                   Positioned(
//                       left: 680,
//                       top: 140,
//                       child: Container(
//                         height: 6,
//                         width: 60,
//                         color: kOrange,
//                       )),
//                   Positioned(
//                       left: 400,
//                       top: 180,
//                       child: Text(
//                         'Adding booking services to your website or app can help streamline your business \n         and make it easier for your customers to book your services',
//                         style: TextStyle(fontSize: 17, color: kwhite),
//                       )),
//                   Positioned(
//                       top: 300,
//                       left: 150,
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Container(
//                                 height: 140,
//                                 width: 250,
//                                 decoration: BoxDecoration(
//                                     color: kwhite,
//                                     borderRadius: BorderRadius.circular(5)),
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 30),
//                                       child: Text(
//                                         'ONLINE BOOKING',
//                                         style: TextStyle(
//                                             fontSize: 15, color: kblue),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 10, top: 15),
//                                       child: Text(
//                                         'Online booking hotels is the process \nof reserving a room or multiple rooms at a hotel for a specific period of time, usually for a vacation, business trip, \nor other travel purposes.',
//                                         style: TextStyle(fontSize: 12),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 150),
//                                 child: Container(
//                                   height: 140,
//                                   width: 250,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       color: kwhite),
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 30),
//                                         child: Text(
//                                           'WORLD CLASS SERVICE',
//                                           style: TextStyle(
//                                               fontSize: 15, color: kblue),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 10, top: 15),
//                                         child: Text(
//                                           'World-class service refers to exceptional and unparalleled service quality that sets a business apart from its competitors.',
//                                           style: TextStyle(fontSize: 12),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 150),
//                                 child: Container(
//                                   height: 140,
//                                   width: 250,
//                                   decoration: BoxDecoration(
//                                       color: kwhite,
//                                       borderRadius: BorderRadius.circular(5)),
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 30),
//                                         child: Text(
//                                           'BEST PRICE GUARANTEE',
//                                           style: TextStyle(
//                                               fontSize: 15, color: kblue),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 10, top: 15),
//                                         child: Text(
//                                           'A best price guarantee is a promise made by a business or service provider to offer the lowest possible price for their product or service.',
//                                           style: TextStyle(fontSize: 12),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       )),
//                   CircleAvatar(
//                     backgroundColor: kwhite,
//                     child: Image.asset(''),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ]),
//     );
//   }
// }

// class ClipClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);

//     return path;
//   }

//   @override
//   dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
// }
