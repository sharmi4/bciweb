import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/views/members/subscribe/views/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../controller/subscribe_controllers.dart';
import '../../../../controller/subscription_controller/subscription_controller.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../common_widget/common.dart';

class Subscribe extends StatefulWidget { 
  // PlansData ? planesdata;
   Subscribe({super.key,});
 
  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  final settingsController = Get.find<SubscribeController>();
  final subscriptionapiController = Get.find<SubscriptionApiController>();


@override
void initState() {
  super.initState();
  subscriptionapiController.getplansList();
  // setDefault();
}
bool showContainer=false;
String cardimgae='';
int temindex=0;


int button=0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonScreen(),
              RegisterCommonContainer(),
            ],
          ), preferredSize:const Size(double.infinity, 110)),
      body:  GetBuilder<SubscriptionApiController>(
          builder: (_){
            
            return ListView(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // RegisterCommonContainer(),
              Container(
                child: Stack(
                  children: [
                    Image.asset('assets/images/Group 39757.png'),
                    Positioned(
                      top: 0,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Subscribe',
                          style: GoogleFonts.lato(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: kwhite),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ksizedbox30,
              Text(
                'Select Membership',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff003366),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              ksizedbox10,
              const Text(
                "All Select Membership Cards Choose Anything",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    color: Color(0xff003366)),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                     height: 500,
                     width:700,
                      child: GridView.builder(
                       shrinkWrap: true,
                       itemCount: subscriptionapiController.plansdataList.length,
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 40,
                        crossAxisSpacing: 40,
                        childAspectRatio: 6,
                        crossAxisCount: 2), 
                      itemBuilder: (context,index){
                       return GestureDetector(
                        onTap: (){
                          print("------------------------------------------------${subscriptionapiController.plansdataList[index].cardImg}");
                          setState(() {
                            temindex= index;
                            cardimgae= subscriptionapiController.plansdataList[index].cardImg;
                          });
                        },
                         child: Container(
                          height: 30,
                           alignment: Alignment.center,
                          decoration: BoxDecoration(
                             color:temindex==index ?kOrange:kwhite,
                             borderRadius: BorderRadius.circular(10),
                             border: Border.all(
                              color:temindex== index?kwhite:kblue
                             )
                          ),
                           child: Text(
                            subscriptionapiController.plansdataList[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              color:temindex==index? kwhite:kblue
                            ),
                            
                           ),
                                                   ),
                       );
                      }),
                    ),
                  ),
                  Column(
              mainAxisAlignment: MainAxisAlignment.start,
                children: [
              
                InkWell(
                    onTap: () {
                      Get.to(Payment(image: subscriptionapiController.plansdataList[temindex].cardImg, 
                      htext: subscriptionapiController.plansdataList[temindex].title, 
                      text:subscriptionapiController.plansdataList[temindex].planDescription,
                      id: subscriptionapiController.plansdataList[temindex].id));
                    },
                    child: subscriptionapiController.plansdataList.isEmpty ? Container(

                    ): Image(
                      image: cardimgae == "" ? NetworkImage(subscriptionapiController.plansdataList.first.cardImg): NetworkImage(cardimgae),
                      height: 234,
                      
                    ),
                    
                    ),
              //if (settingsController.index.value == 1)
                // InkWell(
                //     onTap: () {
                //       Get.to(Payment(image: "assets/images/e2.png", 
                //       htext: subscriptionapiController.plansdataList.first.title, 
                //       text: subscriptionapiController.plansdataList.first.planDescription,
                //       id: subscriptionapiController.plansdataList.first.id.toString(),));
                //     },
                //     child:  Image(
                //       image: NetworkImage(cardimgae),
                //       height: 234,
                //     )),
             // if (settingsController.index.value == 2)
        //         InkWell(
        //             onTap: () {
        //               Get.to(Payment(image: subscriptionapiController.plansdataList.first.cardImg,
        //                text: subscriptionapiController.plansdataList.first.title, 
        // htext:subscriptionapiController.plansdataList.first.planDescription,
        // id: subscriptionapiController.plansdataList.first.id.toString(),));
        //             },
        //             child:  Image(
        //               image: NetworkImage(subscriptionapiController.plansdataList.first.cardImg),
        //               height: 234,
        //             )),
             // if (settingsController.index.value == 3)
                // InkWell(
                //     onTap: () {
                //       Get.to(Payment(image: subscriptionapiController.plansdataList.first.cardImg, 
                //       htext: subscriptionapiController.plansdataList.first.title, 
                //       text: subscriptionapiController.plansdataList.first.planDescription,
                //       id: subscriptionapiController.plansdataList.first.id.toString(),));
                //     },
                //     child:  Image(
                //       image: NetworkImage(cardimgae),
                //       height: 234,
                //     )),
        //       if (settingsController.index.value == 4)
        //         InkWell(
        //             onTap: () {
        //               Get.to(Payment(image: subscriptionapiController.plansdataList.first.cardImg,
        //                text: subscriptionapiController.plansdataList.first.planDescription,
        //  htext: subscriptionapiController.plansdataList.first.title,
        //  id: subscriptionapiController.plansdataList.first.id.toString(),));
        //             },
        //             child:  Image(
        //               image: NetworkImage(cardimgae),
        //               height: 234,
        //             )),
             // if (settingsController.index.value == 5)
        //         InkWell(
        //             onTap: () {
        //               Get.to(Payment(image:cardimgae,
        //                text:subscriptionapiController.plansdataList.first.planDescription, 
        // htext: subscriptionapiController.plansdataList.first.title,
        
        // id: subscriptionapiController.plansdataList.first.id.toString(),));
        //             },
        //             child:  Image(
        //               image: NetworkImage(cardimgae),
        //               height: 234,
        //             )),
                ],
              ),
                ],
              ),
              
               
 ksizedbox40,
              
              ksizedbox40,
              RegisterCommonBottom()
            ]
            
            );
            
          }
        ),
    
    );
  }
}
