import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/home_controller.dart';
import 'package:bciweb/controller/subscription_controller/subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OthersBookingsView extends StatefulWidget {
  const OthersBookingsView({super.key});

  @override
  State<OthersBookingsView> createState() => _OthersBookingsViewState();
}

class _OthersBookingsViewState extends State<OthersBookingsView> {
  final homeController = Get.find<SubscriptionApiController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getothersBookingList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: homeController.othersbookinglist.isEmpty
            ? const Center(
                child: Text("No bookings found"),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.othersbookinglist.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: (){
                        dialogBuilder(context, 
                        homeController.othersbookinglist[index].image, 
                        homeController.othersbookinglist[index].service, 
                        homeController.othersbookinglist[index].description, 
                        homeController.othersbookinglist[index].purchasePrice, 
                        homeController.othersbookinglist[index].quantity
                        );
                      },
                      child: Container(
                        height: 127,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kwhite,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    homeController.othersbookinglist[index].image,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            kwidth10,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ksizedbox10,
                                Text(
                                  homeController.othersbookinglist[index].service
                                      .toString(),
                                  style: const TextStyle(fontSize: 21),
                                ),
                                Container(
                                  width: 250,
                                  child: Text(
                                    '${homeController.othersbookinglist[index].description}',
                                    maxLines: 3,
                                    style: TextStyle(color: kblue),
                                  ),
                                ),
                                // Text(
                                //   'Check in : 03:44PM Check Out 03:43 PM',
                                //   style: TextStyle(color: kblue),
                                // ),
                                // Text(
                                //   'Total Person : 5 Members',
                                //   style: TextStyle(color: kblue),
                                // ),
                                // Text(
                                //   'Ac Rooms',
                                //   style: TextStyle(color: kblue),
                                // ),
                                ksizedbox10
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      );
    });
  }

  Future<void> dialogBuilder(BuildContext context,String img, String tit, String date, String amt, String qty) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context, ) {
        return AlertDialog(
          title: Container(
            height: 400,
            width: 300,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                       Row(
                         children: [
                          Icon(Icons.arrow_back_ios,color: kblue,size: 15,),
                          const SizedBox(width: 10,),
                           Text(
                            'Details',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                         ],
                       ),
                       const SizedBox(height: 5,),
                       Row(
                         children: [
                          Image.network(img,height: 50,width: 60, fit: BoxFit.cover,),
                          const SizedBox(width: 10,),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                tit,
                                style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5,),
                      Text( 'Date : 17/30/34',
                                style: TextStyle(fontSize: 12, color: kblue,fontWeight: FontWeight.w500),
                      ),
                             ],
                           ),
                         ],
                       ),
                       const SizedBox(height: 5,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Place',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            tit,
                            style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
                       const Divider(thickness: 1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Date',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            '19/06/23',
                            style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
                       const Divider(thickness: 1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Trip',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            '03.54 PM',
                            style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
                       const Divider(thickness: 1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Country',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            'India',
                            style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
                       const Divider(thickness: 1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Adult',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            '10',
                            style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
                       const Divider(thickness: 1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(
                            'Quantity',
                            style: TextStyle(fontSize: 16, color: kblue,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            qty,
                            style: TextStyle(fontSize: 15, color: kblue,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
                       const Divider(thickness: 1,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         const Text(
                            'Price',
                            style: TextStyle(fontSize: 16, color: Colors.green,fontWeight: FontWeight.bold),
                      ),
                           Text(
                            amt,
                            style:const TextStyle(fontSize: 15, color: Colors.green,fontWeight: FontWeight.w500),
                      ),
                         ],
                       ),
              ],
            ),
          ),
        );
      },
    );
  }
}
