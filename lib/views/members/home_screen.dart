import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/home_controller.dart';
import 'package:bciweb/controller/service_controller/home_controller.dart';
import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/routes/app_pages.dart';
import 'package:bciweb/views/members/widgets/alert_box_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/auth_controller/auth_profile_controller.dart';
import '../../registerhomescreen/common_reg_homescreen.dart';
import 'bookins/flight/booking_flight.dart';
import 'common_widget/common.dart';
import 'package:bciweb/views/members/widgets/alert_box_widgets.dart';
class MemberHomeScreen extends StatefulWidget {
  const MemberHomeScreen({super.key});

  @override
  State<MemberHomeScreen> createState() => _MemberHomeScreenState();
}
 
class _MemberHomeScreenState extends State<MemberHomeScreen> {
  final _homeController = Get.find<HomeServiceController>();

  final authProfileController = Get.find<AuthProfileController>();

  @override
  void initState() {
    super.initState();
    authProfileController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 110),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CommonScreen(),
              RegisterCommonContainer(),
            ],
          ),
          ),
      body: ListView(children: [
        Column(
          children: [
            // RegisterCommonContainer(),
            // CommonContainer(),
            Container(
              width: size.width,
              height: 600,
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: 600,
                    child: CarouselSlider(
                      items: [
                        {
                          "image": 'assets/images/homeflaight.png',
                          "name": "TEMPLES OF\nKNOWLEDGE",
                          "image_large": "assets/images/sliders/Slider.jpg",
                          "ad": "1",
                        },
                        {
                          "image": "assets/images/slider01.jpg",
                          "name": "TEMPLES OF\nBAKTHI",
                          "image_large": "assets/images/sliders/Slider2.jpg",
                          "ad": "1",
                        },
                      ].map(
                        (i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Stack(
                                children: [
                                  Container(
                                    width: size.width,
                                    height: 600,
                                    child: Image.asset(
                                      i["image"]!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    width: size.width,
                                    height: 600,
                                    color: Colors.black38.withOpacity(0.3),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ).toList(),
                      //       carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayInterval: const Duration(seconds: 6),
                        aspectRatio: 2.0,
                        initialPage: 2,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(BookingFlight());
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'BOOK',
                                      style: TextStyle(
                                          color: kOrange, fontSize: 45),
                                    ),
                                    Text(
                                      ' YOUR FLIGHT',
                                      style: TextStyle(
                                          fontSize: 45, color: kwhite),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ksizedbox30,
                          Text(
                            'Learn what is a Flight Itinerary for visa, why do Embassies \nask for it and How you can Reserve a Flight Ticket \nwithout Paying for the actual Travel Ticket.',
                            style: TextStyle(
                                fontSize: 17, color: kwhite.withOpacity(0.7)),
                          ),
                          ksizedbox30,
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: InkWell(
                                  onTap: () {
                                   paymentBottomSheet(context,32,'');
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: kwhite,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Text('BOOK NOW'),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Icon(Icons.arrow_forward),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: InkWell(
                                  onTap: () {
                                  Get.toNamed(Routes.Subscrib);
                                  },
                                  child: Container(
                                    height: 38,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: kblue,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            'SUBSCRIBE',
                                            style: TextStyle(color: kwhite),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Icon(
                                              Icons.arrow_forward,
                                              color: kwhite,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            ksizedbox40, ksizedbox40,
            Text(
              "WELCOME TO BCI",
              style: TextStyle(
                  fontSize: 29, fontWeight: FontWeight.bold, color: kblue),
            ),
            ksizedbox40,
            Container(
              width: size.width * 0.7,
              child: Column(
                children: [
                  Text(
                    'Benze Club International invites one and all of you to join our First-of-its-kind HOSPITALITY HUB-BCI, an Elite Global Network of verified-prestigious members & verified true merchants.We are also expanding our tie-up-affiliations to global, where Members can transact and get offers & discounts from all leading INDIAN-INTERNATIONAL brands in Hotels, Restaurants, Clubs, Resorts, Theme parks, service apartments, Super markets,Textiles, Jewellery, adventure sports and explore a new world of family Entertainment and Hospitality. We are having our club houses at Chennai Bolleneni Hill side-Sholinganallur-OMR, Chennai-Anna Nagar, Trichy, Ottanchathiram, Kovai, Kodaikanal...We are in the process of expanding our network to Pan India-Global with tie-ups with all other leading brands of hotels, clubs, resorts & restaurants; We are having our overseas offices in UAE.',
                    style: TextStyle(
                        fontSize: 18,
                        color: kblue,
                        height: 1.9,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ksizedbox40,
            Stack(
              children: [
                Image.asset('assets/images/homebackground.png'),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '3  STEPS  OR  THE  PERFECT  CLUB',
                        style: TextStyle(fontSize: 22, color: kOrange),
                      ),
                      Text(
                        'FIND  BEST  MEMBERSHIPS',
                        style: TextStyle(
                            fontSize: 33,
                            color: kblue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        'To find the best membership programs, it"s important to consider what you"re ',
                        style: TextStyle(fontSize: 17),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          'looking for in a membership. Here are some general tips to help you find a',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          'membership that suits your needs:',
                          style: TextStyle(fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 320,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/images/apartmentimage.png'),
                                ksizedbox10,
                                Text(
                                  'HOTELS & SERVICES',
                                  style: TextStyle(
                                      color: kblue,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                ksizedbox10,
                                const Text(
                                    'BCI Prestigious Members Can Access our \nAmazing Discounts Coupons @ Our \nAssociate Hotels / Resorts / Spas / \nSaloons / Services Apartments / Marriage \nHalls / Tours & Travels.'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/images/bazarimage.png'),
                                ksizedbox10,
                                Text(
                                  'ESSENTIAL BAZZAR',
                                  style: TextStyle(
                                      color: kblue,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                ksizedbox10,
                                const Text(
                                    'BCI Prestigious Members Can Access\nour Amazing Discounts Coupons @ Our\nAssociate Provision / Restaurant /\nJewellery / Textile / Complimentary\nCoupon.'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/images/serviceimage.png'),
                                ksizedbox10,
                                Text(
                                  'A TO Z UTILITY SERVICE & \n    ONLINE DISCOUNTS',
                                  style: TextStyle(
                                      color: kblue,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                ksizedbox10,
                                const Text(
                                    'BCI Prestigious Members Can Access our \nAmazing Discounts Coupons @ Our \nAssociate Utility Service Providers / \nOnline Shopping / Online Recharge / \nOnline Cinema Tickets.'),
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 460,
                  width: MediaQuery.of(context).size.width,
                  color: kgrey.withOpacity(0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 210, top: 40),
                        child: Text(
                          'BCI INDIA INFORMA',
                          style: TextStyle(
                              fontSize: 27,
                              color: kblue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 210),
                        child: Text(
                          'Since 2 Decade BCI INDIA Is Servicing In India"s \nfirst family entertainment club, Have about 45000 \nMembers. Now We Are Providing New And Vibrate \nManagement Is Excited To Offer Our Members The \nBest Multi-Clubbing Experience Of Life Time.',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 40, left: 210),
                        child: Text(
                          'BCI INDIA in the Google play store makes world of \nopportunities and services, offers, value added mutual \nbenefits to members & vendors. Now we are \nExpanding Our Business Operations All over India, we \nare estimating about 1 Million Members to subscribe \nwithin Couple of Years, in The Way Of All Digital, Social, \nMedia, Member 2 Member, Vendors 2 Members & Etc.',
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    right: -1,
                    top: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: Image.asset(
                        'assets/images/homebackground2.png',
                        height: 400,
                      ),
                    ))
              ],
            ),

            Stack(
              children: [
                Image.asset(
                  'assets/images/homebackground3.png',
                  width: size.width,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ksizedbox40, ksizedbox40,
                      Text(
                        'WHY CHOOSE US',
                        style: TextStyle(fontSize: 55, color: kwhite),
                        textAlign: TextAlign.center,
                      ),

                      Container(
                        height: 6,
                        width: 60,
                        color: kOrange,
                      ),
                      ksizedbox40,
                      Text(
                        'Adding booking services to your website or app can help streamline your business \n         and make it easier for your customers to book your services',
                        style: TextStyle(fontSize: 17, color: kwhite),
                      ),
                      ksizedbox20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Stack(
                            children: [
                              ksizedbox30,
                              Container(
                                height: 180,
                                width: 300,
                                decoration: BoxDecoration(
                                    color: kwhite,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Text(
                                        'ONLINE BOOKING',
                                        style: TextStyle(
                                            fontSize: 15, color: kblue),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 15),
                                      child: Text(
                                        'Online booking hotels is the process \nof reserving a room or multiple rooms at a hotel for a specific period of time, usually for a vacation, business trip, \nor other travel purposes.',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 2,
                                right: 10,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: kOrange,
                                  child: Image.asset(
                                    'assets/icons/starbutton.png',
                                    height: 25,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: Stack(
                              children: [
                                Container(
                                  height: 180,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: kwhite),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Text(
                                          'WORLD CLASS SERVICE',
                                          style: TextStyle(
                                              fontSize: 15, color: kblue),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, top: 15),
                                        child: Text(
                                          'World-class service refers to exceptional and unparalleled service quality that sets a business apart from its competitors.',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 2,
                                  right: 10,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: kOrange,
                                    child: Image.asset(
                                      'assets/icons/worldbutton.png',
                                      height: 25,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: Stack(
                              children: [
                                Container(
                                  height: 180,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: kwhite,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Text(
                                          'BEST PRICE GUARANTEE',
                                          style: TextStyle(
                                              fontSize: 15, color: kblue),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, top: 15),
                                        child: Text(
                                          'A best price guarantee is a promise made by a business or service provider to offer the lowest possible price for their product or service.',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 2,
                                  right: 10,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: kOrange,
                                    child: Image.asset(
                                      'assets/icons/likebutton.png',
                                      height: 25,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      //     Row(
                      //        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 248),
                      //       child: CircleAvatar(
                      //         radius: 25,
                      //         backgroundColor: kOrange,
                      //         child: Image.asset(
                      //           'assets/icons/starbutton.png',
                      //           height: 25,
                      //           fit: BoxFit.fitHeight,
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 350),
                      //       child: CircleAvatar(
                      //         radius: 25,
                      //         backgroundColor: kOrange,
                      //         child: Image.asset(
                      //           'assets/icons/worldbutton.png',
                      //           height: 25,
                      //           fit: BoxFit.fitHeight,
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 355),
                      //       child: CircleAvatar(
                      //         radius: 25,
                      //         backgroundColor: kOrange,
                      //         child: Image.asset(
                      //           'assets/icons/likebutton.png',
                      //           height: 25,
                      //           fit: BoxFit.fitHeight,
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
                // Positioned(
                //     top: 70,
                //     left: 0,right: 0,
                //     child: Text(
                //       'WHY CHOOSE US',
                //       style: TextStyle(fontSize: 55, color: kwhite),
                //   textAlign: TextAlign.center,  )),
                // Positioned(

                //     top: 140,
                //     child: Container(
                //       height: 6,
                //       width: 60,
                //       color: kOrange,
                //     )),
                // Positioned(
                //     left: 400,
                //     top: 180,
                //     child: Text(
                //       'Adding booking services to your website or app can help streamline your business \n         and make it easier for your customers to book your services',
                //       style: TextStyle(fontSize: 17, color: kwhite),
                //     )),
                // Positioned(
                //     top: 300,
                //     left: 150,
                //     child: Column(
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //           children: [
                //             Container(
                //               height: 150,
                //               width: 250,
                //               decoration: BoxDecoration(
                //                   color: kwhite,
                //                   borderRadius: BorderRadius.circular(5)),
                //               child: Column(
                //                 children: [
                //                   Padding(
                //                     padding: const EdgeInsets.only(top: 30),
                //                     child: Text(
                //                       'ONLINE BOOKING',
                //                       style: TextStyle(
                //                           fontSize: 15, color: kblue),
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(
                //                         left: 10, top: 15),
                //                     child: Text(
                //                       'Online booking hotels is the process \nof reserving a room or multiple rooms at a hotel for a specific period of time, usually for a vacation, business trip, \nor other travel purposes.',
                //                       style: TextStyle(fontSize: 12),
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(left: 150),
                //               child: Container(
                //                 height: 140,
                //                 width: 250,
                //                 decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(5),
                //                     color: kwhite),
                //                 child: Column(
                //                   children: [
                //                     Padding(
                //                       padding: const EdgeInsets.only(top: 30),
                //                       child: Text(
                //                         'WORLD CLASS SERVICE',
                //                         style: TextStyle(
                //                             fontSize: 15, color: kblue),
                //                       ),
                //                     ),
                //                     Padding(
                //                       padding: const EdgeInsets.only(
                //                           left: 10, top: 15),
                //                       child: Text(
                //                         'World-class service refers to exceptional and unparalleled service quality that sets a business apart from its competitors.',
                //                         style: TextStyle(fontSize: 12),
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(left: 150),
                //               child: Container(
                //                 height: 140,
                //                 width: 250,
                //                 decoration: BoxDecoration(
                //                     color: kwhite,
                //                     borderRadius: BorderRadius.circular(5)),
                //                 child: Column(
                //                   children: [
                //                     Padding(
                //                       padding: const EdgeInsets.only(top: 30),
                //                       child: Text(
                //                         'BEST PRICE GUARANTEE',
                //                         style: TextStyle(
                //                             fontSize: 15, color: kblue),
                //                       ),
                //                     ),
                //                     Padding(
                //                       padding: const EdgeInsets.only(
                //                           left: 10, top: 15),
                //                       child: Text(
                //                         'A best price guarantee is a promise made by a business or service provider to offer the lowest possible price for their product or service.',
                //                         style: TextStyle(fontSize: 12),
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             )
                //           ],
                //         )
                //       ],
                //     )),
                // Positioned(
                //     top: 265,
                //     child: Row(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(left: 248),
                //           child: CircleAvatar(
                //             radius: 25,
                //             backgroundColor: kOrange,
                //             child: Image.asset(
                //               'assets/icons/starbutton.png',
                //               height: 25,
                //               fit: BoxFit.fitHeight,
                //             ),
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.only(left: 350),
                //           child: CircleAvatar(
                //             radius: 25,
                //             backgroundColor: kOrange,
                //             child: Image.asset(
                //               'assets/icons/worldbutton.png',
                //               height: 25,
                //               fit: BoxFit.fitHeight,
                //             ),
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.only(left: 355),
                //           child: CircleAvatar(
                //             radius: 25,
                //             backgroundColor: kOrange,
                //             child: Image.asset(
                //               'assets/icons/likebutton.png',
                //               height: 25,
                //               fit: BoxFit.fitHeight,
                //             ),
                //           ),
                //         )
                //       ],
                //     ))
              ],
            ),
            Stack(
              children: [
                Image.asset('assets/images/homebackground4.png'),
                Positioned(
                    top: 0,
                    bottom: 0,
                    left: 50,
                    child: Image.asset(
                      'assets/images/homebackgroundimage.png',
                      height: 200,
                      fit: BoxFit.fitHeight,
                    )),
                Positioned(
                    right: 100,
                    //   right: 0,
                    top: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 256),
                          child: Text(
                            'FIND  BEST  BUSINESS',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: kblue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 550, top: 10),
                          child: Container(
                            height: 8,
                            width: 60,
                            color: kOrange,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 145, top: 20),
                          child: Container(
                            width: size.width * 0.3,
                            child: Text(
                              'Starting a business requires financial investment. Consider the  potential costs, profits, and funding options for your business.',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  height: 1),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, left: 423),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'THE ORIGINAL VISION',
                                style: TextStyle(
                                    fontSize: 16.5,
                                    color: kblue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kOrange,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 260),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'INCREASE ONBOARDING SPEEDY BUSINESS',
                                style: TextStyle(
                                    fontSize: 16.5,
                                    color: kblue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kOrange,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 320),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'VENDOR FOCUS TO INCREASING SALES',
                                style: TextStyle(
                                    fontSize: 16.5,
                                    color: kblue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kOrange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 338),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'SETTLEMENT & RECONCILIATION',
                                style: TextStyle(
                                    fontSize: 16.5,
                                    color: kblue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kOrange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'CUSTOMIZE YOUR BRAND & VALUE',
                                style: TextStyle(
                                    fontSize: 16.5,
                                    color: kblue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kOrange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            ksizedbox40,
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Column(
                          children: [
                            Text(
                              "11K",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: kblue,
                                  height: 2,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "AMAZING BUSINESS",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: kblue,
                                  height: 2,
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(),
                        child: Dash(
                            direction: Axis.vertical,
                            length: 130,
                            dashLength: 15,
                            dashColor: Colors.grey),
                      ),
                      Column(
                        children: [
                          Text(
                            "41K",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "AMAZING MEMBERS",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 16.5,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(),
                        child: Dash(
                            direction: Axis.vertical,
                            length: 130,
                            dashLength: 15,
                            dashColor: Colors.grey),
                      ),
                      Column(
                        children: [
                          Text(
                            "3K",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "TOTAL SUPPORT",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 16.5,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(),
                        child: Dash(
                            direction: Axis.vertical,
                            length: 130,
                            dashLength: 15,
                            dashColor: Colors.grey),
                      ),
                      Column(
                        children: [
                          Text(
                            "77K",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "TOTAL USERS",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 16.5,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ksizedbox30,
            Stack(children: [
              Image.asset('assets/images/homebackground6.png'),
              Padding(
                padding: const EdgeInsets.only(top: 150, right: 260),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Paid Ads Available',
                          style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: kblue),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kblue,
                                  minimumSize: const Size(200, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {},
                              child:const Text(
                                'Click Now',
                                style: TextStyle(fontSize: 20),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
            // Stack(
            //   children: [
            //     Container(
            //         height: 350,
            //         width: MediaQuery.of(context).size.width,
            //         child: Image.asset(
            //           'assets/images/homebackground5.png',
            //           fit: BoxFit.cover,
            //         )),
            //     Positioned(
            //       top: 0,
            //       left: 0,
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(left: 90),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text(
            //                   'TESTIMONIALS',
            //                   style: TextStyle(
            //                     color: kOrange,
            //                     fontSize: 30,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(left: 0, top: 5,right: 0),
            //             child: Text(
            //               'What Our Clients Say About Us',
            //               style: TextStyle(fontSize: 30),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(left: 20, top: 15),
            //             child: Row(
            //               children: [
            //                 Container(
            //                   height: 215,
            //                   width: 250,
            //                   decoration: BoxDecoration(
            //                       color: kwhite,
            //                       borderRadius: BorderRadius.circular(5)),
            //                   child: Column(
            //                     children: [
            //                       Padding(
            //                         padding: const EdgeInsets.only(top: 15),
            //                         child: Image.asset(
            //                             'assets/images/rajarani.png'),
            //                       ),
            //                       Padding(
            //                         padding: const EdgeInsets.only(top: 8),
            //                         child: Text(
            //                           'Raja Rani',
            //                           style:
            //                               TextStyle(fontSize: 15, color: kblue),
            //                         ),
            //                       ),
            //                       Padding(
            //                         padding:
            //                             const EdgeInsets.only(left: 10, top: 4),
            //                         child: Text(
            //                           'Online booking hotels is the process \nof reserving a room or multiple rooms at a hotel for a specific period of time, usually for a vacation, business trip, \nor other travel purposes.',
            //                           style: TextStyle(fontSize: 12),
            //                         ),
            //                       ),
            //                       Padding(
            //                         padding: const EdgeInsets.only(top: 10),
            //                         child: Image.asset(
            //                             'assets/icons/reviewstar.png'),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 50),
            //                   child: Container(
            //                     height: 215,
            //                     width: 250,
            //                     decoration: BoxDecoration(
            //                         color: kwhite,
            //                         borderRadius: BorderRadius.circular(5)),
            //                     child: Column(
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.only(top: 15),
            //                           child:
            //                               Image.asset('assets/images/mp.png'),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(top: 10),
            //                           child: Text(
            //                             'Mp',
            //                             style: TextStyle(
            //                                 fontSize: 15, color: kblue),
            //                           ),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(
            //                               left: 10, top: 7),
            //                           child: Text(
            //                             'Online booking hotels is the process \nof reserving a room or multiple rooms at a hotel for a specific period of time, usually for a vacation, business trip, \nor other travel purposes.',
            //                             style: TextStyle(fontSize: 12),
            //                           ),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(top: 5),
            //                           child: Image.asset(
            //                               'assets/icons/reviewstar.png'),
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 50),
            //                   child: Container(
            //                     height: 210,
            //                     width: 250,
            //                     decoration: BoxDecoration(
            //                         color: kwhite,
            //                         borderRadius: BorderRadius.circular(5)),
            //                     child: Column(
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.only(top: 15),
            //                           child:
            //                               Image.asset('assets/images/nick.png'),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(top: 10),
            //                           child: Text(
            //                             'Nick Mshow',
            //                             style: TextStyle(
            //                                 fontSize: 15, color: kblue),
            //                           ),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(
            //                               left: 10, top: 7),
            //                           child: Text(
            //                             'Online booking hotels is the process \nof reserving a room or multiple rooms at a hotel for a specific period of time, usually for a vacation, business trip, \nor other travel purposes.',
            //                             style: TextStyle(fontSize: 12),
            //                           ),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(top: 6),
            //                           child: Image.asset(
            //                               'assets/icons/reviewstar.png'),
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 50),
            //                   child: Container(
            //                     height: 220,
            //                     width: 250,
            //                     decoration: BoxDecoration(
            //                         color: kwhite,
            //                         borderRadius: BorderRadius.circular(5)),
            //                     child: Column(
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.only(top: 15),
            //                           child: Image.asset(
            //                               'assets/images/sunda.png'),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(top: 10),
            //                           child: Text(
            //                             'Sunda',
            //                             style: TextStyle(
            //                                 fontSize: 15, color: kblue),
            //                           ),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(
            //                               left: 10, top: 7),
            //                           child: Text(
            //                             'Online booking hotels is the process \nof reserving a room or multiple rooms at a hotel for a specific period of time, usually for a vacation, business trip, \nor other travel purposes.',
            //                             style: TextStyle(fontSize: 12),
            //                           ),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(top: 6),
            //                           child: Image.asset(
            //                               'assets/icons/reviewstar.png'),
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: kwhite,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '- - - - - - - Watch Our Story - - - - - - - - -',
                      style: TextStyle(
                          fontSize: 22,
                          color: kOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ksizedbox20,
                  Text(
                    'Unforgettable Subscrition Experiences \nGet Your Guide',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: kblue,
                        fontWeight: FontWeight.bold),
                  ),
                  ksizedbox30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kblue,
                              minimumSize:const Size(200, 47)),
                          onPressed: () {},
                          child:const Text(
                            'Contact Us',
                            style: TextStyle(fontSize: 18),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kOrange,
                                minimumSize:const Size(200, 47)),
                            onPressed: () {},
                            child:const Text(
                              'Book Now',
                              style: TextStyle(fontSize: 18),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                color: korange,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 30),
                          child: Image.asset(
                            'assets/images/waveimage.png',
                            height: 150,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Text(
                                  'Benze App Avaliable in Google Play',
                                  style: TextStyle(fontSize: 28, color: kwhite),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 6, right: 0),
                                child: Text(
                                  'Store and iPhone App Store',
                                  style: TextStyle(fontSize: 28, color: kwhite),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 150, top: 20),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                   launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=com.memberapp.bci"));
                                },
                                child: Image.asset(
                                  'assets/icons/MaskGroup26.png',
                                   height: 70,
                                   fit: BoxFit.fitHeight,
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  launchUrl(Uri.parse("https://apps.apple.com/in/app/bci-member/id6466208765"));
                                },
                                child: Image.asset(
                                  'assets/icons/MaskGroup25.png',
                                   height: 70,
                                   fit: BoxFit.fitHeight,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            const RegisterCommonBottom()
          ],
        ),
      ]),
    );
  }
}

class ClipClipper extends CustomClipper<Path> {
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
