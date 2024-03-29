import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/members/bookins/hotels/resort_details_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../controller/hotel_controller/hotel_controller.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';

class ResortBooking extends StatefulWidget {
  final String userIp;
  final String resultIndex;
  final String hotelcode;
  final String searchtoken;
  const ResortBooking({super.key,
   required this.userIp, 
   required this.resultIndex, 
   required this.hotelcode, 
   required this.searchtoken});


  @override
  State<ResortBooking> createState() => _ResortBookingState();
}

class _ResortBookingState extends State<ResortBooking> {
    @override
  void initState() {
    super.initState();
    hotelController.hotelInfo(
        userIp: widget.userIp,
        resultIndex: widget.resultIndex,
        hotelCode: widget.hotelcode,
        searchToken: widget.searchtoken);
    hotelController.getHotelRoomApiServices(
        userIp: widget.userIp,
        resultIndex: widget.resultIndex,
        hotelCode: widget.hotelcode,
        searchToken: widget.searchtoken);
  }
    final hotelController = Get.find<HotelController>();
  List hotelsimage = [
    'assets/images/hotelimage1.jpg',
    'assets/images/hotelimage2.jpg',
    'assets/images/hotelimage3.jpg',
    'assets/images/hotelimage4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SelectionArea(
      child: Scaffold(
        body: ListView(
            children:[ GetBuilder<HotelController>(
              builder: (context) {
                return Container(
                 
                  child: Column(
                        children: [
                  RegisterCommonContainer(),
                  Stack(
                    children: [
                      Container(
                          color: Colors.black,
                          width: size.width,
                          child: Image.asset(
                            'assets/images/Group 39748.png',
                            opacity: const AlwaysStoppedAnimation(2),
                          )),
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Center(
                              child: Text(
                            'Choose Hotel :)',
                            style: TextStyle(
                                fontSize: 45,
                                color: kwhite,
                                fontWeight: FontWeight.bold),
                          )))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      children: [
                      hotelController.searchHotelData.isEmpty?Text('No Found Data '):  Container(
                          //   color: kblue,
                          height: size.height * 0.8,
                          width: size.width * 0.3,
                          child: Column(
                            children: [
                              Image.network(
                                hotelController.searchHotelData.first.hotelPicture,
                                width: size.width,
                              ),
                              ksizedbox10,
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.network(
                                      hotelController.searchHotelData.first.hotelPicture,
                                      height: 140,
                                      fit: BoxFit.fitHeight,
                                      // width: size.width * 0.1,
                                    ),
                
                                    ///  kwidth5,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Image.network(
                                        hotelController.searchHotelData.first.hotelPicture,
                                         height: 140,
                                        fit: BoxFit.fitHeight,
                                        // width: size.width * 0.1,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: hotelController.hotelRoomsData.isEmpty
                                ? const Text('')
                                : Container(
                                    height: 50,
                                    child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: hotelController.hotelRoomsData.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return ListTile(
                                          title: Text(hotelController
                                              .hotelRoomsData
                                              .first
                                              .hotelRoomsDetails[index]
                                              .amenity
                                              .first
                                              .toString()),
                                        );
                                      },
                                    ),
                                  ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: size.height * 0.6,
                            //    width: size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,                      
                              children: [
                               hotelController.hotelRoomsData.isEmpty?Text(''): Text(
                                  hotelController.hotelRoomsData.first.hotelRoomsDetails.first.roomDescription,
                                  style: TextStyle(
                                      fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                                       Padding(
                            padding: const EdgeInsets.only(right: 10, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Image.asset('assets/images/Group 5822(1).png'),
                                Obx(
                                  () => SizedBox(
                                    height: 58,
                                    width: 200,
                                    child: hotelController.isLoading.isTrue
                                        ? ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: kblue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                            ),
                                            onPressed: () {
                                              // hotelController.blockroomapi(
                                              //     userIp: widget.userIp,
                                              //     resultIndex: widget.resultIndex,
                                              //     hotelCode: widget.hotelCode,
                                              //     hotelName: hotelController
                                              //         .hotelInfoData.first.hotelName,
                                              //     searchToken: widget.searchToken,
                                              //     hotelRoomsDetail: hotelController
                                              //         .hotelRoomsData
                                              //         .first
                                              //         .hotelRoomsDetails
                                              //         .first);
                                              // Get.to(Sucssesspage());
                                              // Get.to(BusinessGenerate_otp
                                              // ());
                                            },
                                            child: const CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: kblue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                            ),
                                            onPressed: () {
                                              hotelController.blockroomapi(
                                                  userIp: widget.userIp,
                                                  hotelInfoData: hotelController
                                                      .hotelInfoData.first,
                                                  resultIndex: widget.resultIndex,
                                                  hotelCode: widget.hotelcode,
                                                  hotelName: hotelController
                                                      .hotelInfoData.first.hotelName,
                                                  searchToken: widget.searchtoken,
                                                  hotelRoomsDetail: hotelController
                                                      .hotelRoomsData
                                                      .first
                                                      .hotelRoomsDetails
                                                      .first);
                                              // Get.to(Sucssesspage());
                                              // Get.to(BusinessGenerate_otp
                                              // ());
                                            },
                                            child: const Text(
                                              'Book Now',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),]
                            )
                          )
                            )
                      ],
                    ),
                  ),
                  ksizedbox10,
                  Container(
                    child: Column(
                      children: [
                        ksizedbox10,
                        Text(
                          'About Alagoa Resort',
                          style: TextStyle(
                              fontSize: 25, color: kblue, fontWeight: FontWeight.bold),
                        ),
                        ksizedbox10,
                        Text(
                          'Close to Betalbatim Beach, this hotel in Goa comes with a pool, ',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: kblue),
                        ),
                        Text(
                          ' lawn, bar, restaurant & well-appointed rooms.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: kblue),
                        ),
                        ksizedbox30,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            hotelcontainers(
                              img: 'assets/images/hoteld.png',
                              text1: 'Food ',
                              text2: 'And Drinking',
                            ),
                            hotelcontainers(
                                img: 'assets/images/hotele.png',
                                text1: 'Location ',
                                text2: '& Surroundings'),
                            hotelcontainers(
                                img: 'assets/images/hotela.png',
                                text1: 'Property ',
                                text2: 'Highlights'),
                            hotelcontainers(
                                img: 'assets/images/hotelb.png',
                                text1: 'Room details ',
                                text2: 'and Amenities'),
                            hotelcontainers(
                                img: 'assets/images/hotelc.png',
                                text1: 'Activities ',
                                text2: '& Nearby Attractions'),
                            hotelcontainers(
                                img: 'assets/images/hotelf.png',
                                text1: 'How to Reach ',
                                text2: 'the Property')
                          ],
                        )
                      ],
                    ),
                    width: size.width,
                    height: 330,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                  ),
                  ksizedbox10,
                  Text(
                    'User Ratings & Reviews',
                    style: TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold, color: kblue),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Important information that you need to know before you book!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 19, color: kblue),
                    ),
                  ),
                  ksizedbox30,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, top: 10, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Outstanding excellent',
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: kblue,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Rated 5.0 by Lipsha Subhalagna . Family Traveller . Dec 01, 2022',
                                  style: TextStyle(fontSize: 15.5, color: kblue),
                                ),
                                ksizedbox10,
                                Text(
                                  'The best stay till the date. We have planned for goa visit for our anniversary. And as we have 2 years toddler so can"t go to the crowded area so our goal was set that we will chill and will spend some quality time with peace. Hence we book this eco resort with not much expectations. But guess what the room is too big, food was toooooo yum like you will just fall for it. The main thing is beach is just 5 min not like random beach it"s the most cleanest beach of goa, lazy person like me that is bingo. Coming to the party we didn"t even imagine there will different event every nights, there was dj, there was live singing event and you can dance along, so happening it became in night. Coming to the staff part they are so humble, so friendly so respectful. Special thanks to antony if any day you are reading this post. For babies to toddler they have too many toys also. How can i forget pool it"s also too clean. The room the space the natures you will just fall for it from morning to night it"s just so beautiful. Thank you for making our stay good.',
                                  style: TextStyle(
                                      height: 1.3, color: kblue, fontSize: 15.5),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    'Do you find this helpful?',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)),
                      width: size.width,
                      height: 228,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, top: 10, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Outstanding excellent',
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: kblue,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Rated 5.0 by Lipsha Subhalagna . Family Traveller . Dec 01, 2022',
                                  style: TextStyle(fontSize: 15.5, color: kblue),
                                ),
                                ksizedbox10,
                                Text(
                                  'The best stay till the date. We have planned for goa visit for our anniversary. And as we have 2 years toddler so can"t go to the crowded area so our goal was set that we will chill and will spend some quality time with peace. Hence we book this eco resort with not much expectations. But guess what the room is too big, food was toooooo yum like you will just fall for it. The main thing is beach is just 5 min not like random beach it"s the most cleanest beach of goa, lazy person like me that is bingo. Coming to the party we didn"t even imagine there will different event every nights, there was dj, there was live singing event and you can dance along, so happening it became in night. Coming to the staff part they are so humble, so friendly so respectful. Special thanks to antony if any day you are reading this post. For babies to toddler they have too many toys also. How can i forget pool it"s also too clean. The room the space the natures you will just fall for it from morning to night it"s just so beautiful. Thank you for making our stay good.',
                                  style: TextStyle(
                                      height: 1.3, color: kblue, fontSize: 15.5),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    'Do you find this helpful?',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: kblue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)),
                      width: size.width,
                      height: 228,
                    ),
                  ),
                  ksizedbox30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Similar Hotels',
                        style: TextStyle(
                            fontSize: 25, color: kblue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    height: 350,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: hotelsimage.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 20, bottom: 10),
                            child: Container(
                              height: 50,
                              width: 260,
                              decoration: BoxDecoration(
                                  color: kwhite,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        offset: Offset(0.0, 0.75),
                                        blurRadius: 4,
                                        color: kgrey)
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: Image.asset(hotelsimage[index].toString()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 2),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Alagoa Resort',
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '(4.5)',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: korange,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10, top: 3),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '₹ 2,807',
                                          style: TextStyle(
                                              color: korange,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Per Night',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 1),
                                          child: Text(
                                            'Free Breakfast Available at Higher \nPrice',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(
                                              ResortDetailsScreen(
                                                hotelCode: '',
                                                resultIndex: '',
                                                userIp: '',
                                                searchToken: '',
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: korange,
                                                borderRadius: BorderRadius.circular(5)),
                                            child: Center(
                                              child: Text(
                                                'View',
                                                style: TextStyle(color: kwhite),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  ksizedbox10,
                  RegisterCommonBottom()
                        ],
                      ),
                );
              }
            )]
            ),
        appBar: PreferredSize(
            child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      ),
    );
  }
}

class hotelcontainers extends StatelessWidget {
  const hotelcontainers({
    super.key,
    required this.img,
    required this.text1,
    required this.text2,
  });
  final String img;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img,
            height: 30,
          ),
          Text(text1).text.sm.semiBold.white.make().p4(),
          Text(text2).text.sm.semiBold.white.make(),
        ],
      ),
      decoration:
          BoxDecoration(color: kblue, borderRadius: BorderRadius.circular(15)),
    );
  }
}
