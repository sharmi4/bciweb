// import 'package:bciweb/controller/flaight_show_controller.dart';
// import 'package:bciweb/controller/flaightdate_controller.dart';
// import 'package:bciweb/views/business/bookins/trip/trip_booking.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:date_format/date_format.dart';
// import '../../../../constant/constans.dart';
// import '../../../../controller/flaight _controller.dart';
// import '../../../../registerhomescreen/common_reg_bottom.dart';
// import '../../../../registerhomescreen/common_reg_homescreen.dart';
// import '../../mobile_wdgets/comomappbar.dart';
// import '../../mobile_wdgets/drawer.dart';

// class MobileFlightBooking extends StatefulWidget {
//   const MobileFlightBooking({super.key});

//   @override
//   State<MobileFlightBooking> createState() => _MobileFlightBookingState();
// }

// class _MobileFlightBookingState extends State<MobileFlightBooking> {
//   var dropvalue1 ='';
//   var dropvalue2='';
//    bool nonstop=false; 
//       bool nonstop2=false; 
//   bool refundable=false;
//   bool prenoon=false;
//   bool indiGo=false;
//   bool vistara=false;
//   bool airIndia=false;
//   bool spiceJet=false;
//   bool goFirst=false;
//   bool airAsia=false;
//   bool lateDepartures=false;
//   bool morningDepratures=false;
//   bool stop=false;
//   bool stop2=false;
//   double slider=20;
//   bool airline1=false;
//   bool airline2=false;
//   bool airline3=false;
//   bool airline4=false;
//   bool airline5=false;
//   bool airline6=false;

//    var mobilenumberController=TextEditingController();


//     List flaightimage=[
//       'assets/images/flaightimage3.png', 'assets/images/flaightimage1.png'
   
//     ];
//     List title=[
//       'DOMESTIC FLIGHTS',
//       'INTERNATIONAL FLIGHTS',

//     ];
//     List description=[
//       'Avail up to ₹2000* \noff on domestic \nflights!',
//        'Avail up to ₹2000* \noff on domestic \nflights!',
//     ];
//  DateTime flaight2selectedDate = DateTime.now();
//    DateTime flaightselectedDate = DateTime.now();
 
//   int increament = 0;
//   int decrement = 0;
 
//   Future<void> _flaightselectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: flaightselectedDate,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != flaightselectedDate) {
//       setState(() {
//         flaightselectedDate = picked;
//         falightdobController.text =
//             '${flaightselectedDate.day}-${flaightselectedDate.month}-${flaightselectedDate.year}';
//       });
//     }
//   }

//   Future<void> _flaight2selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: flaight2selectedDate,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != flaight2selectedDate) {
//       setState(() {
//         flaight2selectedDate = picked;
//         falight2dobController.text =
//             '${flaight2selectedDate.day}-${flaight2selectedDate.month}-${flaight2selectedDate.year}';
//       });
//     }
//   }

//   var falightdobController = TextEditingController();
//   var falight2dobController = TextEditingController();
//   var faligsearchController = TextEditingController();
//   var faligsearch2Controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final flaightController=Get.find<FlaightController>();
//      final flaight2Controller=Get.find<Flaight2Controller>();
//       final flaight3Controller=Get.find<Flaight3Controller>();
//       final flaightshowController=Get.find<FlaightShowController>();
//       final flaightdetailsController=Get.find<FlaightDateSCotroller>();

//     var size = MediaQuery.of(context).size;

   
//     return Scaffold( 
//         appBar: PreferredSize(
//           child: AppBarMob(), 
//             preferredSize: Size(double.infinity, 40)),
//       drawer: MobileDrawer(),
//       body: 
//          ListView(
//           children:[ Column(
//             children: [
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Container(
//                                 height: 250,
//                                 width: size.width * 0.98,
//                                 decoration: BoxDecoration(
//                                     color: kwhite,
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.zero,
//                                         bottomLeft: Radius.circular(15),
//                                         topRight: Radius.circular(15),
//                                         bottomRight: Radius.circular(15))),
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(top: 20),
//                                               child: Row(
//                                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                 children: [
//                                                   Container(
//                                                     height: 40,
//                                                     width: MediaQuery.of(context).size.width*0.32,
//                                                     decoration: BoxDecoration(
//                                                            border: Border.all(
//                                                             color: kgrey
//                                                            ),
//                                                            borderRadius: BorderRadius.circular(5)
//                                                       ),
//                                                     child: Row(
//                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                       children: [
//                                                          Padding(
//                                                           padding: const EdgeInsets.only(left: 0),
//                                                           child: Text(dropvalue2),
//                                                         ),
//                                                           PopupMenuButton(
//                                                           child: Icon(Icons.arrow_drop_down_sharp),
//                                                         itemBuilder: (context)=>[
//                                                            PopupMenuItem(
//                                                             value: 'One Way',
//                                                             child: Text('One Way',
//                                                             style: TextStyle(
//                                                               fontSize: 14
//                                                             ),)),
                                                          
//                                                            PopupMenuItem(
//                                                             value: 'Round Way ',
//                                                             child: Row(
//                                                               children: [
                                                              
//                                                                 Text('Round Way',
//                                                                 style: TextStyle(
//                                                                   fontSize: 13
//                                                                 ),),
//                                                               ],
//                                                             ),
                              
//                                                            ),
                                                           
                                                           
                                                  
//                                                       ],
//                                                       onSelected: (value){
//                                                         setState(() {
//                                                         dropvalue2=value.toString();
//                                                         });
//                                                       },
//                                                       ),
                                                      
//                                                       ],
//                                                     ),
//                                                   ),
//                                                    Icon(Icons.compare_arrows_sharp),
//                                                   Container(
//                                                       height: 40,
//                                                       width: MediaQuery.of(context).size.width*0.32,
//                                                       decoration: BoxDecoration(
//                                                            border: Border.all(
//                                                             color: kgrey
//                                                            ),
//                                                            borderRadius: BorderRadius.circular(5)
//                                                       ),
//                                                        child: TextField(
//                                                           textInputAction: TextInputAction.next,
//                                                         controller: faligsearch2Controller,
//                                                         decoration: InputDecoration(
//                                                           hintText: 'Any Airport or City',
//                                                           hintStyle: TextStyle(
//                                                             fontSize: 14
//                                                           ),
//                                                           border: OutlineInputBorder(
                              
//                                                           )
//                                                         ),
//                                                       ),
//                                                     ),
                                                   
                                                    
                                                   
//                                                 ],
//                                               ),
//                                             ), ksizedbox10,
//                                              Row(
//                                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                children: [
//                                                  Container(
//                                                           height: 40,
//                                                         width: MediaQuery.of(context).size.width*0.32,
//                                                           decoration: BoxDecoration(
//                                                                border: Border.all(
//                                                                 color: kgrey
//                                                                ),
//                                                                borderRadius: BorderRadius.circular(5)
//                                                           ),
//                                                           child: TextField(
//                                                               textInputAction: TextInputAction.next,
//                                                             controller: faligsearchController,
//                                                             decoration: InputDecoration(
//                                                               hintText: 'Any Airport or City',
//                                                               hintStyle: TextStyle(
//                                                                 fontSize: 14
//                                                               ),
//                                                               border: OutlineInputBorder(
                              
//                                                               )
//                                                             ),
//                                                           ),
//                                                         ),
//                                                          Icon(Icons.compare_arrows_sharp),
//                                                            Container(
//                                                       height: 40,
//                                                       width: MediaQuery.of(context).size.width*0.32,
//                                                       decoration: BoxDecoration(
//                                                            border: Border.all(
//                                                             color: kgrey
//                                                            ),
//                                                            borderRadius: BorderRadius.circular(5)
//                                                       ),
//                                                       child: Container(
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.only(left: 5),
//                                                           child: Row(
//                                                             mainAxisAlignment: MainAxisAlignment.spaceAround
//                                                             ,
//                                                             children: [
                                                          
//                                                               Text('${formatDate(flaight2selectedDate,[dd,"/",mm,'/',yyyy])}'),
//                                                               IconButton(onPressed: (){
//                                                                 _flaight2selectDate(context);
//                                                               }, 
//                                                               icon: Icon(Icons.date_range_outlined))
                                                              
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
                                                      
//                                                     ),
                                                      
                                                     
                                                   
//                                                ],
//                                              ),ksizedbox10,
//                                                Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                  children: [
//                                                   Container(
//                                                       height: 42,
//                                                       width: MediaQuery.of(context).size.width*0.32,
//                                                       decoration: BoxDecoration(
//                                                            border: Border.all(
//                                                             color: kgrey
//                                                            ),
//                                                            borderRadius: BorderRadius.circular(5)
//                                                       ),
//                                                       child: Container(
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.only(left: 5),
//                                                           child: Row(
//                                                             mainAxisAlignment: MainAxisAlignment.spaceAround
//                                                             ,
//                                                             children: [
                                                          
//                                                               Text('${formatDate(flaightselectedDate,[dd,"/",mm,'/',yyyy])}'),
//                                                               IconButton(onPressed: (){
//                                                                 _flaightselectDate(context);
//                                                               }, 
//                                                               icon: Icon(Icons.date_range_outlined))
                                                              
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
                                                      
//                                                     ),
//                                                      Icon(Icons.compare_arrows_sharp),
//                                                    Container(
//                                                           height: 40,
//                                                           width: MediaQuery.of(context).size.width*0.32,
//                                                           decoration: BoxDecoration(
//                                                                border: Border.all(
//                                                                 color: kgrey
//                                                                ),
//                                                                borderRadius: BorderRadius.circular(5)
//                                                           ),
//                                                           alignment: Alignment.center,
//                                                         child:Row(
//                                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                           children:[
//                                                             Padding(
//                                                               padding: const EdgeInsets.only(left: 10),
//                                                               child: Text(dropvalue1),
//                                                             ), 
//                                                             PopupMenuButton(
//                                                               child: Icon(Icons.arrow_drop_down_sharp),
//                                                             itemBuilder: (context)=>[
//                                                                PopupMenuItem(
//                                                                 value: '01 Traveller',
//                                                                 child: Text('01 Traveller',
//                                                                 style: TextStyle(
//                                                                   fontSize: 14
//                                                                 ),)),
                                                              
//                                                                PopupMenuItem(
//                                                                 value: 'Adults ${flaightController.cout.value}',
//                                                                 child: Row(
//                                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                   children: [
//                                                                 Row(
//                                                                   children: [
//                                                                     Text('${flaightController.cout.value}'),
//                                                                     Text('Adults',
//                                                                     style: TextStyle(
//                                                                       fontSize: 13
//                                                                     ),),
//                                                                   ],
//                                                                 ),
//                                                                 Row(
//                                                                   children: [
//                                                                     IconButton(
//                                                                       onPressed: (){
//                                                                         flaightController.decrement();
//                                                                         flaightController.update();
//                                                                       },
//                                                                       icon: Icon(Icons.do_not_disturb_on_outlined)),
//                                                                       Obx(()=> Text('${flaightController.cout.value}',
//                                                                 style: TextStyle(
//                                                                   fontSize: 14
//                                                                 ),)),
//                                                                 IconButton(
//                                                                   onPressed: (){
//                                                                     flaightController.increament();
//                                                                     flaightController.update();
//                                                                   },
//                                                                   icon: Icon(Icons.add_circle_outline_outlined))
//                                                                   ],
//                                                                 ),
                                                                
//                                                                ],
//                                                                ),
                              
//                                                                ),
//                                                                PopupMenuItem(
//                                                                 value: 'Children (2-12 yrs)',
//                                                                 child: Row(
//                                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                 children: [
//                                                                        Text('Children (2-12 yrs)',
//                                                                        style: TextStyle(
//                                                                         fontSize: 14
//                                                                        ),),
//                                                                        Row(
//                                                                          children: [
//                                                                            IconButton(
//                                                                   onPressed: (){
//                                                                     flaight2Controller.decrement();
//                                                                     flaight2Controller.update();
//                                                                   },
//                                                                   icon: Icon(Icons.do_not_disturb_on_outlined)),
                              
//                                                                    Obx(()=> Text('${flaight2Controller.cout.value}',
//                                                                 style: TextStyle(
//                                                                   fontSize: 14
//                                                                 ),)),
//                                                                 IconButton(
//                                                                   onPressed: (){
//                                                                     flaight2Controller.increament();
//                                                                     flaight2Controller.update();
//                                                                   },
//                                                                   icon: Icon(Icons.add_circle_outline_outlined))
//                                                                          ],
//                                                                        ),
                                                               
//                                                                 ],
//                                                                )),
//                                                                PopupMenuItem(
//                                                                 child: Row(
//                                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                 children: [
//                                                                       Text('Infants (Below 2 yrs)',
//                                                                       style: TextStyle(
//                                                                         fontSize: 14
//                                                                       ),),
//                                                                                                                                  Row(
//                                                                          children: [
//                                                                            IconButton(
//                                                                   onPressed: (){
//                                                                     flaight3Controller.decrement();
//                                                                     flaight3Controller.update();
//                                                                   },
//                                                                   icon: Icon(Icons.do_not_disturb_on_outlined)),
                              
//                                                                    Obx(()=> Text('${flaight3Controller.cout.value}',
//                                                                 style: TextStyle(
//                                                                   fontSize: 14
//                                                                 ),)),
//                                                                 IconButton(
//                                                                   onPressed: (){
//                                                                     flaight3Controller.increament();
//                                                                     flaight3Controller.update();
//                                                                   },
//                                                                   icon: Icon(Icons.add_circle_outline_outlined))
//                                                                          ],
//                                                                        ),
//                                                                 ],
//                                                                ),
                                                               
//                                                                )
                                                      
//                                                           ],
//                                                           onSelected: (value){
//                                                             setState(() {
//                                                             dropvalue1=value.toString();
//                                                             });
//                                                           },
//                                                           ),
//                                                           ]
//                                                         )
                                                          
//                                                         ),
//                                                  ],
//                                                ), 
//                                             Padding(
//                                               padding: const EdgeInsets.only(left: 10,top:40),
//                                               child: Row(
//                                                 children: [
//                                                   Container(
//                                                     height: 21,
//                                                 width: MediaQuery.of(context).size.width*0.2,
//                                                     decoration: BoxDecoration(
//                                                       color: kOrange
//                                                     ),
//                                                     child: Center(
//                                                       child: Text('Economy',
//                                                       textAlign: TextAlign.center,
//                                                       style: TextStyle(
//                                                         fontSize: 11,
//                                                         color: kwhite
//                                                       ),),
//                                                     ),
                                            
//                                                   ),
                                              
//                                                      Padding(
//                                                        padding: const EdgeInsets.only(left: 5),
//                                                        child: Container(
//                                                               height: 20,
//                                                               width: MediaQuery.of(context).size.width*0.7,
//                                                               decoration: BoxDecoration(
//                                                         color: kblue
//                                                          ),
//                                                         child: Center(
//                                                           child: Row(
//                                                           children: [
//                                                             Padding(
//                                                               padding: const EdgeInsets.only(left: 12),
//                                                               child: Text('Premimum Economy ',
//                                                               textAlign: TextAlign.center,
//                                                               style: TextStyle(
//                                                                 fontSize: 11,
//                                                                 color: kwhite
//                                                               ),),
//                                                             ),
//                                                             Padding(
//                                                               padding: const EdgeInsets.only(left: 20),
//                                                               child: Text('Business',
//                                                               textAlign: TextAlign.center,
//                                                               style: TextStyle(
//                                                                 fontSize: 11,
//                                                                 color: kwhite
//                                                               ),),
//                                                             ),
//                                                              Padding(
//                                                                padding: const EdgeInsets.only(left: 20),
//                                                                child: Text('First Class',
//                                                                textAlign: TextAlign.center,
//                                                                 style: TextStyle(
//                                                                 fontSize: 11,
//                                                                 color: kwhite
//                                                                  ),),
//                                                              ),
//                                                           ],
                                                                                                       
//                                                                                                  ),
//                                                         ),
                                                       
//                                                                                              ),
//                                                      )
//                                                 ],
//                                               ),
//                                             ),
                                           
//                                           ],
//                                         ),
//                               ),
//               ),
//                                                Container(
//                                       height: 40,
//                                        width: MediaQuery.of(context).size.width*0.3,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(10),
//                                           border: Border.all(color: kwhite),
//                                         gradient: LinearGradient(colors: [
//                                         kOrange,
//                                         kyellow
//                                                      ])
//                                                   ),
//                                                   child: GestureDetector(
//                                                     onTap: (){
//                                                       flaightshowController.flaightshowindex(1);
//                                                       flaightshowController.update();
//                                                     },
//                                                     child: Center(
//                                                       child: Text('SEARCH',
//                                                       style: TextStyle(
//                                                         color: kwhite,
//                                                         fontSize: 16
//                                                       ),
//                                                       textAlign: TextAlign.center,)),
//                                                   ),
//                                                 ),
//               ksizedbox30,
//               // RegisterCommonBottom()
//             ],
//           ),
//           ]
//         ),
    
//     );
//   }
// }
