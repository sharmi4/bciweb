import 'package:bciweb/constant/constans.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';

import '../mobile_wdgets/mobile_common_bottom/bottom.dart';
import '../responsive_subscription/responsive_subscription.dart';
import '../mobile_wdgets/drawer.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrangeAccent])),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 43,
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 3),
                child: Row(children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: kwhite,
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 2,
                              color: kgrey)
                        ]),
                    child: InkWell(
                        onTap: () {
                          // Get.offAll(Subscribe1());
                        },
                        child: Icon(
                          Icons.search,
                          color: kblue,
                          size: 17,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: kwhite,
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                offset: Offset(0.0, 0.75),
                                blurRadius: 2,
                                color: kgrey)
                          ]),
                      child: Icon(
                        Icons.notifications,
                        color: kblue,
                        size: 17,
                      ),
                    ),
                  ),
                ])),
          ]),
      drawer: MobileDrawer(),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 250,
                width: size.width,
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: 250,
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
                        ].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Stack(children: [
                                Container(
                                    width: size.width,
                                    height: 700,
                                    child: Image.asset(
                                      i["image"]!,
                                      fit: BoxFit.fill,
                                    )),
                                Container(
                                  width: size.width,
                                  height: 700,
                                  color: Colors.black38.withOpacity(0.3),
                                ),
                              ]);
                            },
                          );
                        }).toList(),
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
                                Row(
                                  children: [
                                    Text(
                                      'BOOK',
                                      style: TextStyle(
                                          color: kOrange, fontSize: 20),
                                    ),
                                    Text(
                                      ' YOUR FLIGHT',
                                      style: TextStyle(
                                          fontSize: 20, color: kwhite),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            ksizedbox20,
                            Text(
                              'Learn what is a Flight Itinerary for visa, why do Embassies \nask for it and How you can Reserve a Flight Ticket \nwithout Paying for the actual Travel Ticket.',
                              style: TextStyle(
                                  fontSize: 13, color: kwhite.withOpacity(0.7)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 30,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        // Get.toNamed('/services');
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
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child:
                                                    Icon(Icons.arrow_forward),
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
                                        // Get.toNamed('/subscribe');},
                                      },
                                      child: Container(
                                        height: 38,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            color: kblue,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                'SUBSCRIBE',
                                                style: TextStyle(color: kwhite),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
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
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),ksizedbox20,
              Text(
              "WELCOME TO BCI",
              style: TextStyle(
                  fontSize: 29, fontWeight: FontWeight.bold, color: kblue),
            ),ksizedbox20,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '''      Benze Club International invites one and all of you to join our First-of-its-kind HOSPITALITY HUB-BCI, an Elite Global Network of verified-prestigious members & verified true merchants.                                                                                                         
      We are also expanding our tie-up-affiliations to global, where 
  Members can transact and get offers & discounts from all leading 
  INDIAN-INTERNATIONAL brands in Hotels, Restaurants, Clubs, Resorts, Theme parks, service apartments, Super markets,
  Textiles, Jewellery, adventure sports and explore a new world of family Entertainment and Hospitality. 
       We are having our club houses at Chennai Bolleneni Hill 
  side-Sholinganallur-OMR, Chennai-Anna Nagar, Trichy, Ottanchathiram, Kovai, Kodaikanal...
       We are in the process of expanding our network to Pan India-Global with tie-ups with all other leading brands of hotels, clubs, resorts & restaurants; We are having our overseas offices in UAE.
  
  ''',
                style: TextStyle(fontSize: 13,color: kblue),
                textAlign: TextAlign.center,
              ),
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/images/homebackground.png',
                  height: 750,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 65),
                        child: Text(
                          '3  STEPS  OR  THE  PERFECT  CLUB',
                          style: TextStyle(fontSize: 16, color: kOrange),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 9, left: 50),
                        child: Text(
                          'FIND  BEST  MEMBERSHIPS',
                          style: TextStyle(
                              fontSize: 22,
                              color: kblue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 70,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'To find the best membership programs, it"s important to consider \nwhat you"re looking for in a membership. Here are some general \ntips to help you find a membership that suits your needs:',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 140,
                    right: 0,
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 12),
                          child: Row(children: [
                            Image.asset('assets/images/apartmentimage.png'),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'HOTELS & SERVICES',
                                    style: TextStyle(
                                        color: kblue,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 6, left: 22),
                                  child: Text(
                                      'BCI Prestigious Members Can Access \nour Amazing Discounts Coupons \n@ Our Associate Hotels / Resorts \n/ Spas / Saloons / Services Apartments \n/ Marriage Halls / Tours & Travels.'),
                                ),
                              ],
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 12),
                          child: Row(children: [
                            Image.asset('assets/images/bazarimage.png'),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                children: [
                                  Text(
                                    'ESSENTIAL BAZZAR',
                                    style: TextStyle(
                                        color: kblue,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 22, top: 6),
                                    child: Text(
                                        'BCI Prestigious Members Can \nAccess our Amazing Discounts \nCoupons @ Our Associate Provision \n/Restaurant /jewellery / Textile \n/Complimentary Coupon.'),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, top: 20),
                          child: Row(children: [
                            Image.asset('assets/images/serviceimage.png'),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'A TO Z UTILITY SERVICE & \n    ONLINE DISCOUNTS',
                                    style: TextStyle(
                                        color: kblue,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 22, top: 6),
                                  child: Text(
                                      'BCI Prestigious Members Can \nAccess our Amazing Discounts \nCoupons @ Our Associate Utility \nService Providers /Online Shopping \n/ Online Recharge /Online Cinema \nTickets.'),
                                ),
                              ],
                            ),
                          ]),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          'BCI INDIA INFORMA',
                          style: TextStyle(
                              fontSize: 22,
                              color: kblue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 11),
                        child: Container(
                          height: 7,
                          width: 50,
                          color: kOrange,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          'Since 2 Decade BCI INDIA \nIs Servicing In India"s first \nfamily entertainment club\n,Have about 45000 \nMembers. Now We Are \nProviding New And \nVibrate Management Is \nExcited To Offer Our \nMembers The Best Multi\n-Clubbing Experience Of \nLife Time.',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                            'BCI INDIA in the Google play store makes world of \nopportunities and services, offers, value added mutual \nbenefits to members & vendors. Now we are \nExpanding Our Business Operations All over India, we \nare estimating about 1 Million Members to subscribe \nwithin Couple of Years, in The Way Of All Digital, Social, \nMedia, Member 2 Member, Vendors 2 Members & Etc.'),
                      )
                    ],
                  ),
                ),
                Positioned(
                    right: -1,
                    top: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Image.asset(
                        'assets/images/homebackground2.png',
                        height: 200,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/homebackground3.png',
                    height: 750,
                    fit: BoxFit.fitHeight,
                  ),
                  Positioned(
                      top: 50,
                      left: 100,
                      child: Text(
                        'WHY CHOOSE US',
                        style: TextStyle(fontSize: 25, color: kwhite),
                      )),
                  Positioned(
                      left: 170,
                      top: 90,
                      child: Container(
                        height: 6,
                        width: 60,
                        color: kOrange,
                      )),
                  Positioned(
                      left: 30,
                      top: 100,
                      child: Text(
                        'Adding booking services to your website or \napp can help streamline your business and make \nit easier for your customers to book your services',
                        style: TextStyle(fontSize: 15, color: kwhite),
                      )),
                  Positioned(
                      top: 200,
                      left: 60,
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 150,
                                width: 250,
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
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 15),
                                      child: Text(
                                        'Online booking hotels is the process \nof reserving a room or multiple rooms at a hotel for a specific period of time, usually for a vacation, business trip, \nor other travel purposes.',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 50),
                                child: Container(
                                  height: 140,
                                  width: 250,
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
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        child: Text(
                                          'World-class service refers to exceptional and unparalleled service quality that sets a business apart from its competitors.',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 50),
                                child: Container(
                                  height: 140,
                                  width: 250,
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
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 15),
                                        child: Text(
                                          'A best price guarantee is a promise made by a business or service provider to offer the lowest possible price for their product or service.',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                  Positioned(
                      top: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 160, top: 110),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: kOrange,
                              child: Image.asset(
                                'assets/icons/starbutton.png',
                                height: 25,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 160, top: 156),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: kOrange,
                              child: Image.asset(
                                'assets/icons/worldbutton.png',
                                height: 25,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 140, left: 170),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: kOrange,
                                  child: Image.asset(
                                    'assets/icons/likebutton.png',
                                    height: 25,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            ksizedbox30,
            Stack(
              children: [
                Image.asset(
                  'assets/images/homebackground4.png',
                  height: 650,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                    top: 15,
                    left: 10,
                    child: Image.asset(
                      'assets/images/homebackgroundimage.png',
                      height: 380,
                      fit: BoxFit.fitHeight,
                    )),
                Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            'FIND  BEST  BUSINESS',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: kblue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 291, top: 300),
                          child: Container(
                            height: 8,
                            width: 60,
                            color: kOrange,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 20),
                          child: Text(
                            'Starting a business requires financial investment. \nConsider the potential costs, profits,and funding \noptions for your business.',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                          padding: const EdgeInsets.only(top: 20, left: 2),
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
                          padding: const EdgeInsets.only(top: 20, left: 68),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'VENDOR FOCUS 2 INCREASE SALES',
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
                          padding: const EdgeInsets.only(top: 20, left: 81),
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
                          padding: const EdgeInsets.only(top: 20, left: 61),
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
            Stack(children: [
              Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/homebackground5.png',
                    fit: BoxFit.cover,
                  )),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Text(
                                    "11K",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: kblue,
                                        height: 2,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "AMAZING BUSINESS",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: kblue,
                                        height: 2,
                                        fontSize: 10.5,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 40, left: 7),
                              child: Dash(
                                  direction: Axis.vertical,
                                  length: 60,
                                  dashLength: 15,
                                  dashColor: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 15),
                              child: Column(
                                children: [
                                  Text(
                                    "41K",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: kblue,
                                        height: 2,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "AMAZING MEMBERS",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: kblue,
                                        height: 2,
                                        fontSize: 10.5,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 40, left: 9),
                              child: Dash(
                                  direction: Axis.vertical,
                                  length: 60,
                                  dashLength: 15,
                                  dashColor: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 15),
                              child: Column(
                                children: [
                                  Text(
                                    "3K",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: kblue,
                                        height: 2,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "TOTAL SUPPORT",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: kblue,
                                        height: 2,
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 40, left: 11),
                              child: Dash(
                                  direction: Axis.vertical,
                                  length: 60,
                                  dashLength: 15,
                                  dashColor: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 11, top: 15),
                              child: Column(
                                children: [
                                  Text(
                                    "77K",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: kblue,
                                        height: 2,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "TOTAL USERS",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: kblue,
                                        height: 2,
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ]),
            Stack(children: [
              Image.asset(
                'assets/images/homebackground6.png',
                height: 140,
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Paid Ads Avalibales',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: kblue),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kblue,
                                  minimumSize: Size(200, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {},
                              child: Text(
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
            Stack(
              children: [
                Container(
                    height: 1000,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/homebackground5.png',
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  left: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'TESTIMONIALS',
                              style: TextStyle(
                                color: kOrange,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 5),
                        child: Text(
                          'What Our Clients Say About Us',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 15),
                        child: Column(
                          children: [
                            Container(
                              height: 215,
                              width: 250,
                              decoration: BoxDecoration(
                                  color: kwhite,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Image.asset(
                                        'assets/images/rajarani.png'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      'Raja Rani',
                                      style:
                                          TextStyle(fontSize: 15, color: kblue),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 4),
                                    child: Text(
                                      'Online booking hotels is the process \nof reserving a room or multiple rooms at a hotel for a specific period of time, usually for a vacation, business trip, \nor other travel purposes.',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Image.asset(
                                        'assets/icons/reviewstar.png'),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 1, top: 20),
                              child: Container(
                                height: 215,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: kwhite,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child:
                                          Image.asset('assets/images/mp.png'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Mp',
                                        style: TextStyle(
                                            fontSize: 15, color: kblue),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 7),
                                      child: Text(
                                        'Online booking hotels is the process \nof reserving a room or multiple rooms at a hotel for a specific period of time, usually for a vacation, business trip, \nor other travel purposes.',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Image.asset(
                                          'assets/icons/reviewstar.png'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2, top: 20),
                              child: Container(
                                height: 210,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: kwhite,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child:
                                          Image.asset('assets/images/nick.png'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Nick Mshow',
                                        style: TextStyle(
                                            fontSize: 15, color: kblue),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 7),
                                      child: Text(
                                        'Online booking hotels is the process \nof reserving a room or multiple rooms at a hotel for a specific period of time, usually for a vacation, business trip, \nor other travel purposes.',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Image.asset(
                                          'assets/icons/reviewstar.png'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2, top: 20),
                              child: Container(
                                height: 220,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: kwhite,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Image.asset(
                                          'assets/images/sunda.png'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Sunda',
                                        style: TextStyle(
                                            fontSize: 15, color: kblue),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 7),
                                      child: Text(
                                        'Online booking hotels is the process \nof reserving a room or multiple rooms at a hotel for a specific period of time, usually for a vacation, business trip, \nor other travel purposes.',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Image.asset(
                                          'assets/icons/reviewstar.png'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                color: korange,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30, left: 7),
                          child: Image.asset(
                            'assets/images/waveimage.png',
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Text(
                                  'Benze App Avaliable in Google Play',
                                  style: TextStyle(fontSize: 17, color: kwhite),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 6, right: 0),
                                child: Text(
                                  'Store and iPhone App Store',
                                  style: TextStyle(fontSize: 17, color: kwhite),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 0, top: 10),
                                child: Image.asset(
                                  'assets/images/playgoogle.png',
                                  height: 90,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            MobileCommonBottom()
          ],
        ),
      ]),
    );
  }
}
