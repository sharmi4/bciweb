import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constant/constans.dart';
import '../../../mobile_wdgets/comomappbar.dart';
import '../../../res_controller/yours_coupon_controller.dart';

class YoursCouponsScreen extends StatefulWidget {
  const YoursCouponsScreen({super.key});

  @override
  State<YoursCouponsScreen> createState() => _YoursCouponsScreenState();
}

class _YoursCouponsScreenState extends State<YoursCouponsScreen> {
  final couponsContoller=Get.find<YourCouponController>();
 int yoursindex=0;
 List mobilecouponsimage=[
  'assets/images/offersimage.png',
  'assets/images/couponsimage.png',
  'assets/images/offersimage.png',
  'assets/images/couponsimage.png',
  'assets/images/couponsimage2.png',
  'assets/images/couponsimage3.png',
   'assets/images/couponsimage2.png',
   'assets/images/couponsimage3.png',

 ];
 List mobilecoupontitle=[
  'Lorem Ipsum',
  'Lorem Ipsum',
  'Lorem Ipsum',
  'Lorem Ipsum',
  'Lorem Ipsum',
  'Lorem Ipsum',
  'Lorem Ipsum',
  'Lorem Ipsum',
 ];
 List mobilecoupondescription=[
   'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
 ];
 List mobilevendorimage=[
  'assets/images/vendorimage1.png',
  'assets/images/vendorimage2.png',
  'assets/images/vendorimage1.png',
  'assets/images/vendorimage2.png',
  'assets/images/vendorimage3.png',
  'assets/images/vendorimage4.png',
  'assets/images/vendorimage3.png',
  'assets/images/vendorimage4.png',




 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
          body: Obx(()=>
           ListView(
             children:[ Container(
                               
                                    child: Column(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.only(left: 20,top:30),
                                         child: Row(
                                           children: [
                                             InkWell(
                                               onTap: (){
                                                 setState(() {
                                                     couponsContoller.couponindex(0);
                                                     yoursindex=0;
                                                     couponsContoller.update();
                                                     });
                                               },
                                               child: Padding(
                                                 padding: const EdgeInsets.only(left: 10),
                                                 child: Container(
                                                   height: 30,
                                                    width:150,
                                                   decoration: BoxDecoration(
                                                      color: yoursindex==0?kyellow:kblue,
                                                      borderRadius: BorderRadius.circular(5),
                                                        border: Border.all(
                                                         color: yoursindex==0? kwhite:kyellow
                                                        )                                   
                                                        ),
                                                        child: Center(child: Text('Other Coupons',
                                                        style: TextStyle(
                                                          color: yoursindex==0?kwhite:kwhite,
                                                        ),)),
                                                 ),
                                               ),
                                             ),
                                               Padding(
                                                 padding: const EdgeInsets.only(left:30),
                                                 child: InkWell(
                                                   onTap: (){
                                                     setState(() {
                                                     couponsContoller.couponindex(1);
                                                     yoursindex=1;
                                                     couponsContoller.update();
                                                     });
                                                   },
                                                   child: Container(
                                                   height: 30,
                                                    width:150,
                                                   decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(5),
                                                        border: yoursindex==1?Border.all(
                                                         color: kwhite
                                                        ):null,
                                                      color: yoursindex==1?kyellow:kblue,
                                                      
                                                        ),
                                                        child: Center(child: Text('Vendor Coupons',
                                                        style: TextStyle(
                                                          color: yoursindex==1?kwhite:kwhite,
                                                        ),)),
                                                    ),
                                                 ),
                                               ),
                                           ],
                                         ),
                                       ),
                                       if(couponsContoller.couponindex.value==0)
                                        Container(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              children: [
                                                 Container(
                                                   child: GridView.builder(
                                                    
                                                    shrinkWrap: true,
                                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        childAspectRatio: 0.6,
                                                        crossAxisSpacing: 10), 
                                                        itemCount: 8,
                                                        itemBuilder:(context, index) {
                                                          return Padding(
                                                            padding: const EdgeInsets.only(
                                                              top: 20,left: 10,right: 10
                                                            ),
                                                            child: Container(
                                                              width: 300,
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    height: 120,
                                                                    width: MediaQuery.of(context).size.width,
                                                                    child: Image.asset(mobilecouponsimage[index],
                                                                    fit: BoxFit.cover,)),
                                                                   Row(
                                                                    children: [
                                                                      Text(mobilecoupontitle[index],
                                                                      style: TextStyle(
                                                                        fontSize: 18,
                                                                        color: kblue,
                                                                        fontWeight: FontWeight.bold
                                                                      ),)
                                                                    ],
                                                                   ),
                                                                   Text(mobilecoupondescription[index],
                                                                   style: TextStyle(
                                                                     fontSize: 12,
                                                                     color: kblue,
                                                                    
                                                                   ),),
                                                                   ksizedbox20,
                                                                   Row(
                                                          children: [
                                                            ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: kOrange
                                                              ),
                                                              onPressed: (){},
                                                             child: Text('BASISJWSW')),
                                                          ],
                                                        )
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                                                             ),
                                                 )
                                              ],
                                            ),
                                          )),
                                           if(couponsContoller.couponindex.value==1)
                                        Container(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              children: [
                                                 Container(
                                                   child: GridView.builder(
                                                    
                                                    shrinkWrap: true,
                                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        childAspectRatio: 0.6,
                                                        crossAxisSpacing: 10), 
                                                        itemCount: 8,
                                                        itemBuilder:(context, index) {
                                                          return Padding(
                                                            padding: const EdgeInsets.only(
                                                              top: 20,left: 10,right: 10
                                                            ),
                                                            child: Container(
                                                              width: 300,
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    height: 120,
                                                                    width: MediaQuery.of(context).size.width,
                                                                    child: Image.asset(mobilevendorimage[index],
                                                                    fit: BoxFit.cover,)),
                                                                   Row(
                                                                    children: [
                                                                      Text(mobilecoupontitle[index],
                                                                      style: TextStyle(
                                                                        fontSize: 18,
                                                                        color: kblue,
                                                                        fontWeight: FontWeight.bold
                                                                      ),)
                                                                    ],
                                                                   ),
                                                                   Text(mobilecoupondescription[index],
                                                                   style: TextStyle(
                                                                     fontSize: 12,
                                                                     color: kblue,
                                                                    
                                                                   ),),
                                                                   ksizedbox20,
                                                                   Row(
                                                          children: [
                                                            ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: kOrange
                                                              ),
                                                              onPressed: (){},
                                                             child: Text('BASISJWSW')),
                                                          ],
                                                        )
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                                                             ),
                                                 )
                                              ],
                                            ),
                                          ))
              
                                     ],
                                    ),
                                  ),
                                  
             ]
           ),
          ),
    );
  }
}