import 'package:bciweb/constant/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../controller/auth_controller/auth_profile_controller.dart';
import '../../../../controller/holiday_booking_controller.dart';
import '../../../../controller/holiday_controller.dart';
import '../../../../controller/profile_controller.dart';
import '../../../../models/holiday_packages_models/get_package_details_model.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';

class HolidaysScreen extends StatefulWidget {
   String packageId;
   HolidaysScreen({super.key, required this.packageId});

  @override
  State<HolidaysScreen> createState() => _HolidaysScreenState();
}

class _HolidaysScreenState extends State<HolidaysScreen> {
  int holidayindex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var packagenameController=TextEditingController();
  
    final holidaycontroller=Get.find<HolidayController>();
    final holiday2controller=Get.find<Holiday2Controller>();
    final holiday3controller=Get.find<Holiday3Controller>();
    
  final holidayPackageController = Get.find<HolidayPackageController>();
  final profileController = Get.find<AuthProfileController>();

  final cityOfDepController = TextEditingController();
  final dateOfDepController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.getProfile();
  }
    final getPackageDetailsData=Get.find<GetPackageDetailsData>();
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
          child: Column(children: [
        RegisterCommonContainer(),
        Container(
          height: 500,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/5545.png',
                width: size.width,
              ),
              Positioned(
                  bottom: 180,
                  top: 0,
                  left: 0,
                  right: 0,
                  // top: 0,
                  child: Center(
                      child: Text('Turn Your Dream Holiday\n Into A Reality')
                          .text
                          .bold
                          .xl6
                          .white
                          .make())),
              Positioned(
                top: 360,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, top: 0),
                  child: Container(
                    height: 100,
                    child: Container(
                      height: 95,
                      width: MediaQuery.of(context).size.width * 0.94,
                      decoration: BoxDecoration(
                        color: kwhite,
                        border: Border.all(
                          color: kOrange, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Incredible Mauritius (EX - Delhi)',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Starting From',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 19.5),
                                  ),
                                ),
                                Text(
                                  '₹82990',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    'Per Person On Twin Sharing',
                                    style: TextStyle(fontSize: 13.5),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      //child: YourChildWidget(),  // Replace with your actual child widget
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 50, top: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.57,
                      decoration: BoxDecoration(color: kOrange),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          holidayindex = 0;
                                        });
                                      },
                                      child: Text(
                                        'OVERVIEW',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: kwhite
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          holidayindex = 1;
                                        });
                                      },
                                      child: Text(
                                        'HOTEL DETAILS',
                                        style: TextStyle(color: kwhite),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          holidayindex = 2;
                                        });
                                      },
                                      child: Text('DAY WISE ITINERARY',
                                      style: TextStyle(
                                        color: kwhite))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          holidayindex = 3;
                                        });
                                      },
                                      child: Text('ADDITIONAL INFO',
                                      style: TextStyle(
                                        color: kwhite
                                      ),)),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10, right: 10, top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Container(
                                    height: 2,
                                    width: 68,
                                    color: holidayindex == 0 ? kwhite : kOrange,
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  width: 100,
                                  color: holidayindex == 1 ? kwhite : kOrange,
                                ),
                                Container(
                                  height: 2,
                                  width: MediaQuery.of(context).size.width * 0.1,
                                       color: holidayindex == 2 ? kwhite : kOrange,
                                ),
                                Container(
                                  height: 2,
                                  width: MediaQuery.of(context).size.width * 0.1,
                                      color: holidayindex == 3 ? kwhite : kOrange,
                                )
                              ],
                            ),
                          ),
                        
                            

                        ],
                      ),
                    ),
                  ),if(holidayindex==0)
                   Container(
                    
                     width: MediaQuery.of(context).size.width*0.57,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black
                                ),

                              ),
                              
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10),
                                    child: Image.asset(
                                      'assets/images/overviewimage.png'
                                    ),
                                  ),
                                  ksizedbox10,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:10),
                                        child: Text('Package Overview',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600
                                        ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width*0.33,
                                          child: Divider(
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
                                    child: Column(
                                      children: [
                                        Text('There are many variations of passages of Lorem Ipsum available, but the majority have sufferedalteration in some form, by injected humour, or randomised words which don"t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn"t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet',
                                        maxLines: 5,)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 17),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Flight Details',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600
                                        ),),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 32),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width*0.34,
                                            child: Divider(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                                    child: Container(
                                      height: 125,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                         color: kwhite,
                                         border: Border.all(
                                          color: Colors.black
                                         )
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 45,
                                            width: MediaQuery.of(context).size.width*0.6,
                                            color: kyellow,
                                            child: Row(
                                            
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  child: Text('Sector',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: kwhite,
                                                    fontWeight: FontWeight.w600
                                                  ),),
                                                ),
                                                Container(
                                                  width: 100,
                                                  child: Text('Airline',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: kwhite
                                                  ),),
                                                ),
                                                Container(
                                                  width: 150,
                                                  child: Text('Departure Time',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: kwhite,
                                                    fontWeight: FontWeight.w600
                                                  ),),
                                                ),
                                                Container(
                                                  width: 100,
                                                  child: Text('Arrival Time',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: kwhite,
                                                    fontWeight: FontWeight.w600
                                                  ),),
                                                )
                                              ],
                                            ),
                                          ),
                                          ksizedbox10,
                                          Container(
                                             width: MediaQuery.of(context).size.width*0.6,
                                            child: Row(
                                              
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    child: Text('DEL-MRU',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                     
                                                      fontWeight: FontWeight.w600
                                                    ),),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: Text('MK745',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                     
                                                    ),),
                                                  ),
                                                  Container(
                                                    width: 150,
                                                    child: Text('08:00',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    
                                                      fontWeight: FontWeight.w600
                                                    ),),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: Text('14:00',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    
                                                      fontWeight: FontWeight.w600
                                                    ),),
                                                  )
                                                ],
                                              ),
                                          ),
                                          Divider(
                                           color: Colors.black,

                                          ),
                                          ksizedbox10,
                                          Container(
                                             width: MediaQuery.of(context).size.width*0.6,
                                            child: Row(
                                             
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    child: Text('DEL-MRU',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                     
                                                      fontWeight: FontWeight.w600
                                                    ),),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: Text('MK745',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                     
                                                    ),),
                                                  ),
                                                  Container(
                                                    width: 150,
                                                    child: Text('08:00',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    
                                                      fontWeight: FontWeight.w600
                                                    ),),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: Text('14:00',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    
                                                      fontWeight: FontWeight.w600
                                                    ),),
                                                  ),
                                                  
                                                ],
                                              ),
                                          ),
                                         
                                        ],
                                      ),
                                    ),
                                  ),
                                   
                                  Padding(
                                    padding: const EdgeInsets.only(left:10),
                                    child: Column(
                                                 crossAxisAlignment: CrossAxisAlignment.start,                  
                                      children: [
                                        Padding(
                                    padding: const EdgeInsets.only(top: 17),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Inclusions',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600
                                        ),),
                      //                    HtmlContentViewer(
                      //   htmlContent: holidayPackageController.getPackageDetailsData.first.inclusion,
                      //   initialContentHeight:
                      //       MediaQuery.of(context).size.height,
                      //   initialContentWidth: MediaQuery.of(context).size.width,
                      // ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 36),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width*0.353,
                                            child: Divider(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  ksizedbox10,
                                        Text('◈ Accommodation with breakfast for 06 Nights in Mauritius at Villas Mon Plaisir or similar'),
                                        Text('◈ Daily Breakfast & Dinner.'),
                                        Text('◈ North Island Tour'),
                                        Text('◈ South Island Tour.'),
                                        Text('◈ Ile Aux Cerfs Tour and Undersea Walk'),
                                        Text('◈ Return airport transfers'),
                                        Text('◈ All Transfers and Tours on a sharing basis'),
                                        Text('◈ Limited Time Offer : Complimentary 02 Lunches.'),
                                        Text('◈ Return economy airfare on Air Mauritius (Ex-Del) .')
                                      ],
                                    ),
                                  ),
                                    Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 17),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Inclusions',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600
                                        ),),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 36),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width*0.353,
                                            child: Divider(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 10,top: 10),
                                     child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('◈ VISA fees is not included in the cost of the package.'),
                                        Text('◈ Tipping'),
                                        Text('◈ 5% GST and 5% TCS.'),
                                        Text('◈ Insurance.'),
                                        Text('◈ Any other expenses which are not mentioned at the included section.'),
                                        Text('◈ Extra PCR Tests as per the airline requirement on departure.'),
                                        Text('◈ Entrances to the sightseeing points not included unless specifically mentioned in the Itinerary.'),
                                        Text('◈ Early check in or late checkout charges'),
                                        Text('◈ Camera or Video permits'),
                                         Text('◈ Expenses of a personal nature.'),
                                          Text('◈ Any Increase in the fuel surcharge or any kind of taxes levied by the respective'),
                                           Text('◈ government or statutory bodies'),
                                            Text('◈ Any Increase in the rate of exchange leading to an increase in all land arrangements which may come in to effect prior to departure'),
                                             Text('◈ Cost of extension of the validity or deviation from the route of the tour.Porterage, laundry, wines & alcoholic beverages, mineral water (unless specified), '),
                                              Text('◈ telephone charges, shopping, all items of personal nature and also food and drinks not forming the part of the group menus. '),
                                               Text('◈ Any extra expenses incurred for changing the route due to any unforeseen circumstances, forced majuire instances, natural calamities, political disturbances,strikes etc'),
                                               
                                      ],
                                                                       ),
                                   )

                                ],
                              ),
                            ),

                   if(holidayindex==1)
                      Container(
                    
                     width: MediaQuery.of(context).size.width*0.57,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black
                                ),

                              ),
                              
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10),
                                    child: Image.asset(
                                      'assets/images/munnar1.jpg'
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 17),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Hotel Details',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600
                                        ),),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width*0.33,
                                            child: Divider(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('VILLAS MON PLAISIR or similar',
                                        style: TextStyle(
                                          color: korange,
                                          fontWeight: FontWeight.bold
                                        ),),
                                        Row(
                                          children: [
                                            Icon(Icons.star,
                                            color: kyellow,),
                                             Icon(Icons.star,
                                             color: kyellow,),
                                              Icon(Icons.star,
                                              color: kyellow,),
                                               Icon(Icons.star,
                                               color: kyellow,), 
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 10),
                                    child: Row(
                                      children: [
                                        Text('Property Location:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        ),),
                                      ],
                                    ),
                                  ),
                                  
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                  child: Column(
                                    children: [
                                      Text('When you stay at Villas Mon Plaisir in Pointe Aux Piments, you"ll be on the beach,a 5-minute drive from Turtle Bay and 7 minutes from Trou aux Biches Beach.This beach hotel is 7.1 mi (11.4 km) from Grand Bay Beach and 8.9 mi (14.3 km) from Pereybere Beach',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.8 ),),
                                     
                                    ],
                                  ),
                                ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 20),
                                    child: Row(
                                      children: [
                                        Text('Rooms:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        ),),
                                      ],
                                    ),
                                  ),
                                    Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                  child: Column(
                                    children: [
                                      Text('Make yourself at home in one of the 48 air-conditioned rooms featuring refrigerators and plasma televisions. Rooms have private balconies. Complimentary wireless Internet access keeps you connected, and satellite programming is available for your entertainment. Private bathrooms with showers feature complimentary toiletries and hair dryers',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.8 ),),
                                     
                                    ],
                                  ),
                                ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 20),
                                    child: Row(
                                      children: [
                                        Text('Amenities: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        ),),
                                      ],
                                    ),
                                  ),
                                   Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                  child: Column(
                                    children: [
                                      Text('Pamper yourself with a visit to the spa, which offers massages, body treatments, and facials. Additional features at this hotel include complimentary wireless Internet access,tour/ticket assistance, and barbecue grills.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.8 ),),
                                     
                                    ],
                                  ),
                                ),
                                 Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 20),
                                    child: Row(
                                      children: [
                                        Text('Dining:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        ),),
                                      ],
                                    ),
                                  ),
                                   Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                  child: Column(
                                    children: [
                                      Text('Grab a bite at one of the hotel"s 2 restaurants, or stay in and take advantage of the room service (during limited hours). Quench your thirst with your favorite drink at the bar/lounge',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.8 ),),
                                     
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 20),
                                    child: Row(
                                      children: [
                                        Text('Business, Other Amenities:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        ),),
                                      ],
                                    ),
                                  ),
                                   Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                  child: Column(
                                    children: [
                                      Text('Featured amenities include complimentary newspapers in the lobby, dry cleaning/laundry services, and a 24-hour front desk. A roundtrip airport shuttle is provided for a surcharge (available 24 hours), and free self parking is available onsite',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.8 ),),
                                     
                                    ],
                                  ),
                                ),
                                ]
                              )
                      ),

                    if(holidayindex==2)
                     Container(
                    
                     width: MediaQuery.of(context).size.width*0.57,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black
                                ),

                              ),
                              
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10),
                                    child: Image.asset(
                                      'assets/images/munnar2.jpg'
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 17),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Day Wise Itineary',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600
                                        ),),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width*0.31,
                                            child: Divider(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  ksizedbox10,
                                  Row(
                                    children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.195,
                                          child: Divider(
                                            color:kyellow,
                                          ),
                                        ),
                                      Text('Day 01',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: korange
                                      ),),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.21,
                                          child: Divider(
                                            color: kyellow,
                                          ),
                                        )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                    child: Column(
                                      children: [
                                        Text('There is more to Mauritius than just an island. It has a fascinating colonial past, a distinctive biodiversity,and really lovely weather. Blessed with a variety of beautiful beaches, a breathtaking coastline, and a thriving coral reef system. When you arrive in Mauritius, a member of our staff will greet you and take you to your accommodation. Check-in, unwind, and then enjoy the remainder of the day as you please. After dinner, retire to your room for an overnight stay',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          height: 1.3 ))
                                      ],
                                    ),
                                  ),
                                   ksizedbox20,
                                   Row(
                                    children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.195,
                                          child: Divider(
                                            color:kyellow,
                                          ),
                                        ),
                                      Text('Day 02',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: korange
                                      ),),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.21,
                                          child: Divider(
                                            color: kyellow,
                                          ),
                                        )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                    child: Column(
                                      children: [
                                        Text('Go on a full-day tour of Mauritius" South Island after breakfast. See the model ship factory at Curepipe and the crater of Trou Aux Cerfs. Go to Grand Bassin, where there is a Shiva temple and a sacred lake for Hindus in Mauritius. For a unique experience, travel via Plaine Champagne & Black River Gorges and stop at the 23- colored Nature Park. Return to the hotel after the day is done, eat dinner, and retire for the night. *Note :Wear comfortable shoes and warm clothes.',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          height: 1.3 ))
                                      ],
                                    ),
                                  ),
                                   ksizedbox20,
                                   Row(
                                    children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.195,
                                          child: Divider(
                                            color:kyellow,
                                          ),
                                        ),
                                      Text('Day 03',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: korange
                                      ),),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.21,
                                          child: Divider(
                                            color: kyellow,
                                          ),
                                        )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                    child: Column(
                                      children: [
                                        Text('Ile Aux Cerfs is perhaps one of Mauritius" most picturesque locations. It is an emerald-colored lagoon on the east coast of this lovely island. Begin your excursion to the area"s sandy beaches, stunning lagoon, and large range of tourist-friendly beach activities after a full breakfast at the hotel. Nothing compares to a swim in the ocean"s clear waters',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          height: 1.3 ))
                                      ],
                                    ),
                                  ),
                                  ksizedbox20,
                                   Row(
                                    children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.195,
                                          child: Divider(
                                            color:kyellow,
                                          ),
                                        ),
                                      Text('Day 04',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: korange
                                      ),),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.21,
                                          child: Divider(
                                            color: kyellow,
                                          ),
                                        )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                    child: Column(
                                      children: [
                                        Text('Go to a full-day tour of North Island after a leisurely breakfast. Port Louis, the charming capital of Mauritius,is situated on the north island. The Chap de Mars Racetrack, the second-oldest racetrack in the world, is located there. Driving to Port Louis, we stop at Marie Reine de Paix and then see the city"s citadel and surrounding area. After seeing the Champ de Mars racetrack, we go to Le Caudan Waterfront, which has about 170 stores where you can get all the mementos of Mauritius.',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          height: 1.3 ))
                                      ],
                                    ),
                                  ),
                                                                    ksizedbox20,
                                   Row(
                                    children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.195,
                                          child: Divider(
                                            color:kyellow,
                                          ),
                                        ),
                                      Text('Day 05',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: korange
                                      ),),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.21,
                                          child: Divider(
                                            color: kyellow,
                                          ),
                                        )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                    child: Column(
                                      children: [
                                        Text('After a filling breakfast today, head to the Casela Bird Park (optional tour, additional supplement applicable). Experience the sizable outdoor entertainment park with camel rides, zip lines, safari tours,restaurants, and shopping. Your admission ticket contains The Tulawaka Gold Coaster',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          height: 1.3 ))
                                      ],
                                    ),
                                  ),
                                   ksizedbox20,
                                   Row(
                                    children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.195,
                                          child: Divider(
                                            color:kyellow,
                                          ),
                                        ),
                                      Text('Day 06',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: korange
                                      ),),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.21,
                                          child: Divider(
                                            color: kyellow,
                                          ),
                                        )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                    child: Column(
                                      children: [
                                        Text('After a filling breakfast, you have the day to yourself today. You have the option of relaxing back at the hotel or touring the magnificent island. We recommend to choose the Sunset Catamaran Cruise (optional tour,additional supplement applicable). A catamaran is a vessel that has two identically sized hulls that are supported by a platform.',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          height: 1.3 ))
                                      ],
                                    ),
                                  ),
                                  ksizedbox20,
                                   Row(
                                    children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.195,
                                          child: Divider(
                                            color:kyellow,
                                          ),
                                        ),
                                      Text('Day 07',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: korange
                                      ),),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.21,
                                          child: Divider(
                                            color: kyellow,
                                          ),
                                        )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                    child: Column(
                                      children: [
                                        Text('Wake up in the morning, have a scrumptious breakfast and pack your bags for your departure. Complete the check-out formalities and get ready to leave to the Mauritius airport to catch a suitable flight back home. Reach your desired destination and end the trip with unforgettable memories.',
                                        style: TextStyle(
                                         
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          height: 1.3 ))
                                      ],
                                    ),
                                  ),
                                  ksizedbox20,
                                ]
                              )
                     ),
                     if(holidayindex==3)
                      Container(
                    
                     width: MediaQuery.of(context).size.width*0.57,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black
                                ),

                              ),
                              
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10),
                                    child: Image.asset(
                                      'assets/images/munnar3.jpg'
                                    ),
                                  ),
                                   Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 17),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Additinal Information',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600
                                        ),),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 33),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width*0.283,
                                            child: Divider(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30,left:10),
                                    child: Row(
                                      children: [
                                        Text('Travel Validity ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:10,top:6),
                                    child: Row(
                                      children: [
                                        Text('The deal is valid for travel till Friday, 30 Sep 2023. ')
                                      ],
                                    ),
                                  ),

                                    Padding(
                                    padding: const EdgeInsets.only(top: 30,left:10),
                                    child: Row(
                                      children: [
                                        Text('High Season ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:10,top:6),
                                    child: Row(
                                      children: [
                                        Text('Prices can fluctuate during peak season dates.')
                                      ],
                                    ),
                                  ),
                                    Padding(
                                    padding: const EdgeInsets.only(top: 30,left:10),
                                    child: Row(
                                      children: [
                                        Text('Guaranteed Dates ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),)
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 5),
                                    child: Row(
                                      
                                      children: [
                                        Text('Your selected travel dates are guaranteed. In the unlikely event of seats sold out, we \nguarantee +/- 1/2 days from your preferred dates.',
                                        style: TextStyle(
                                          height: 1.6
                                        ),)
                                      ],
                                    ),
                                  ),
                                   Padding(
                                    padding: const EdgeInsets.only(top: 30,left:10),
                                    child: Row(
                                      children: [
                                        Text('Easy Cancellation ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),)
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 5),
                                    child: Row(
                                      
                                      children: [
                                        Text('*31 days or more prior to departure date, Initial Booking Amount and additional amount\nof visa fee will be forfeited (in case visa has been applied).*Between 30–16 days : 75% of\ntotal tour cost will be charged as penalty. *Less than 15 days: 100% of total tour cost will\nbe charges as penalty',
                                        style: TextStyle(
                                          height: 1.6
                                        ),)
                                      ],
                                    ),
                                  ),
                                    Padding(
                                    padding: const EdgeInsets.only(top: 30,left:10),
                                    child: Row(
                                      children: [
                                        Text('Visa Easy',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),)
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 5),
                                    child: Row(
                                      
                                      children: [
                                        Text('Visa assistance will be provided by our visa specialists.',
                                        style: TextStyle(
                                          height: 1.6
                                        ),)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30,left:10),
                                    child: Row(
                                      children: [
                                        Text('Booking Policy ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),)
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 5),
                                    child: Row(
                                      
                                      children: [
                                        Text('Initial Booking Amount - INR 30,000 per person or cancellation charges whichever is\nhigher (non-refundable and non-transferable)30 days prior to the departure date - 50%\nof the remaining tour cost.15 days prior to the departure date - 100% of the tour cost \nrequired.',
                                        style: TextStyle(
                                          height: 1.6
                                        ),)
                                      ],
                                    ),
                                  )
                                ]
                              )
                      )


                ],
              ),

              
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 0),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(color: kOrange),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: [
                          Text('Want to go for a memorable holidays?',
                          style: TextStyle(
                            color: kwhite,
                            fontSize: 18.5
                          ),),
                          Padding(
                            padding: const EdgeInsets.only(top:4),
                            child: Text('Provide your details to know best holidays deals',
                            style: TextStyle(
                              color: kwhite,
                              fontSize: 14
                            ),),
                          )
                        ],
                      ),
                    
                    ),
                    Container(
                      height: 830,
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: kwhite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:10,left:15),
                            child: Text('Package Name',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            ),),
                          ),
                          ksizedbox10,
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width*0.25,
                              child: TextField(
                                controller: packagenameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder()
                                ),
                              ),
                            ),
                          ),
                          ksizedbox10,
                             Padding(
                            padding: const EdgeInsets.only(top:10,left:15),
                            child: Text('City of Departure',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            ),),
                          ),
                          ksizedbox10,
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width*0.25,
                              child: TextField(
                                controller: cityOfDepController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder()
                                ),
                              ),
                            ),
                          ),
                           ksizedbox10,
                             Padding(
                            padding: const EdgeInsets.only(top:10,left:15),
                            child: Text('Date of Departure',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            ),),
                          ),
                          ksizedbox10,
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width*0.25,
                              child: TextField(
                                controller: dateOfDepController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder()
                                ),
                              ),
                            ),
                          ),
                          ksizedbox20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Adult'),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8),
                                    child: Container(
                                      height: 30,
                                      width: 105,
                                      decoration: BoxDecoration(
                                        color: kwhite,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            offset: Offset(0.0, 0.75),
                                            blurRadius: 1,
                                            color: kgrey
                                          )
                                        ]
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: IconButton(onPressed: (){holidayPackageController.adult--;
                                              holidaycontroller.decrement();
                                              holidaycontroller.update();
                                            }, 
                                            icon: Icon(Icons.remove,
                                            size: 14,)),
                                          ),
                                          Container(
                                            height: 50,
                                            width: 22,
                                            decoration: BoxDecoration(
                                              color: korange
                                            ),
                                            child: Center(
                                            child: Obx(()=> Text('${holidaycontroller.cout.value}')),
                                            ),
                                          ),
                                           Padding(
                                             padding: const EdgeInsets.only(bottom: 10),
                                             child: IconButton(onPressed: (){
                                              holidaycontroller.increament();
                                              holidaycontroller.update();
                                             }, 
                                              icon: Icon(Icons.add,
                                              size: 14,)),
                                           ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Child '),
                                  
                                  Padding(
                                    padding: const EdgeInsets.only(top:8),
                                    child: Container(
                                      height: 30,
                                      width: 105,
                                      decoration: BoxDecoration(
                                        color: kwhite,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            offset: Offset(0.0, 0.75),
                                            blurRadius: 1,
                                            color: kgrey
                                          )
                                        ]
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: IconButton(onPressed: (){
                                              holiday2controller.decrement();
                                              holiday2controller.update();
                                            }, 
                                            icon: Icon(Icons.remove,
                                            size: 14,)),
                                          ),
                                          Container(
                                            height: 50,
                                            width: 22,
                                            decoration: BoxDecoration(
                                              color: korange
                                            ),
                                            child: Center(
                                            child: Obx(()=> Text('${holiday2controller.cout.value}')),
                                            ),
                                          ),
                                           Padding(
                                             padding: const EdgeInsets.only(bottom: 10),
                                             child: IconButton(onPressed: (){
                                              holiday2controller.increament();
                                              holiday2controller.update();
                                             }, 
                                            icon: Icon(Icons.add,
                                            size: 14,)),
                                           ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                                   Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Infant'),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8),
                                    child: Container(
                                      height: 30,
                                      width: 105,
                                      decoration: BoxDecoration(
                                        color: kwhite,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            offset: Offset(0.0, 0.75),
                                            blurRadius: 1,
                                            color: kgrey
                                          )
                                        ]
                                      ),
                                      
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          IconButton(onPressed: (){
                                            holiday3controller.decrement();
                                            holiday3controller.update();
                                          }, 
                                          icon: Icon(Icons.remove,
                                          size: 14,)),
                                          Container(
                                            height: 50,
                                            width: 22,
                                            decoration: BoxDecoration(
                                              color: korange
                                            ),
                                            child: Center(
                                            child: Obx(()=> Text('${holiday3controller.cout.value}')),
                                            ),
                                          ),
                                           IconButton(onPressed: (){
                                            holiday3controller.increament();
                                            holiday3controller.update();
                                           }, 
                                          icon: Icon(Icons.add,
                                          size: 14,)),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          ksizedbox10,
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Row(
                              children: [
                                Text('Contact Details',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500
                                ),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:15,left:10),
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width*0.25,
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: 'Your Name',
                                  border: OutlineInputBorder(
                          
                                  )
                                ),
                          
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:15,left:10),
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width*0.25,
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                          
                                  )
                                ),
                          
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:15,left:10),
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width*0.25,
                              child: TextField(
                                controller:  mobileController,
                                decoration: InputDecoration(
                                  hintText: 'Phone Number',
                                  border: OutlineInputBorder(
                          
                                  )
                                ),
                          
                              ),
                            ),
                          ),
                          ksizedbox20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(    onTap: (){
                    print("---------testing enquiry--------------");
                    print(widget.packageId);
                    print(profileController.profileData);
                    print(cityOfDepController.text);
                    print(dateOfDepController.text);
                    print(nameController.text);
                    print(emailController.text);
                    print(mobileController.text);
                         holidayPackageController.createEnquiry(
                          packageid: widget.packageId, 
                          vendorid:"107", //profileController.profileData.first.id.toString(),
                          cityofdeparture: cityOfDepController.text, 
                          dateofdeparture: dateOfDepController.text, 
                          adultcount: holidayPackageController.adult.value.toString(), 
                          childcount: holidayPackageController.child.value.toString(), 
                          infantcount:  holidayPackageController.infant.value.toString(), 
                          name: nameController.text, 
                          email: emailController.text, 
                          mobile: mobileController.text, 
                          status: "pending",
                          );
                  },
                                child: Container(
                                  height: 45,
                                  width:MediaQuery.of(context).size.width*0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:korange
                                  ),
                                  child:Center(
                                    child:Text('Send Query',
                                    style:TextStyle(
                                      color:kwhite
                                    ))
                                  )
                                ),
                              )
                            ],
                          ),
                          ksizedbox10,
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Row(
                              children: [
                                Icon(Icons.schedule,
                                color:korange),
                                Text('Duration :6 Nights & 7 Days')
                              ],
                            ),
                          ),
                          ksizedbox10,
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Row(
                              children: [
                                Icon(Icons.add_location,
                                color:korange),
                                Text('Places to Visit :06N Mauritius')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:20,left:10),
                            child: Row(
                              children:[
                                Text('Packages Include',
                                style:TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500
                                ))
                              ]
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:10,top:15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:[
                                Icon(Icons.flight_sharp,
                                color:kgrey),
                                Icon(Icons.hotel,
                                color:kgrey),
                                Icon(Icons.explore,
                                color:kgrey),
                                Icon(Icons.car_crash,
                                color:kgrey),
                                Icon(Icons.set_meal,
                                color:kgrey)
                              ]
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:[
                                Text('Flight',
                                style:TextStyle(
                                  color:kgrey
                                )),
                                 Text('Hotel',
                                 style: TextStyle(
                                  color:kgrey
                                 ),),
                                  Text('Sightseeing',
                                  style: TextStyle(
                                    color:kgrey
                                  ),),
                                   Text('Car',
                                   style: TextStyle(
                                    color:kgrey
                                   ),),
                                   Text('Meals',
                                   style:TextStyle(
                                    color:kgrey
                                   ))
                              ]
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
       

        ksizedbox40,
        RegisterCommonBottom()
      ])),
    );
  }
}
