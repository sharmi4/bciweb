import 'package:bciweb/constant/constans.dart';

import 'package:bciweb/views/members/bookins/bus/wigets/bus_details_wiget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../controller/bus_controllers.dart';
import '../../../../models/busbookingmodels/bus_contact_details_model.dart';
import '../../../../models/busbookingmodels/pax_list_model.dart';
import '../../../../models/busbookingmodels/search_bus_model.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../common_widget/common.dart';

class PssengesDetails extends StatefulWidget {
  Bus busData;
  String boardingId;
  String dropingId;
  String searchkey;
  List<String> seatIds;
  List<BusContactDetailsModel> busContactmodel;
  String amount;
  String cusName;
  PssengesDetails(
      {super.key,
      required this.boardingId,
      required this.busData,
      required this.dropingId,
      required this.searchkey,
      required this.amount,
      required this.seatIds,
      required this.busContactmodel,
      required this.cusName});

  @override
  State<PssengesDetails> createState() => _PssengesDetailsState();
}

class _PssengesDetailsState extends State<PssengesDetails> {
  //2
  var phoneNumberController2 = TextEditingController();
  var nameController2 = TextEditingController();
  var emailController2 = TextEditingController();
  var ageController2 = TextEditingController();
  String selectedGender2 = '';
  //3
  var phoneNumberController3 = TextEditingController();
  var nameController3 = TextEditingController();
  var emailController3 = TextEditingController();
  var ageController3 = TextEditingController();
  String selectedGender3 = '';
  //4
  var phoneNumberController4 = TextEditingController();
  var nameController4 = TextEditingController();
  var emailController4 = TextEditingController();
  var ageController4 = TextEditingController();
  String selectedGender4 = '';
  //5
  var phoneNumberController5 = TextEditingController();
  var nameController5 = TextEditingController();
  var emailController5 = TextEditingController();
  var ageController5 = TextEditingController();
  String selectedGender5 = '';

  final busController = Get.find<BusController>();

  var phoneNumberContoller = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  List<String> seatIds = [];
  bool isvalue=false;
  bool creditbool = false;
  bool netbankbool = false;
  bool bhimbool = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kwhite,
          appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonScreen(),
              RegisterCommonContainer(),
            ],
          ), preferredSize:const Size(double.infinity, 110)),
      body: ListView(
        children: [
          GetBuilder<BusController>(builder: (_) {
            return Column(
              children: [
               
                ksizedbox20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.83,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('PASSENGERS DETAILS',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: kblue,
                                  fontWeight: FontWeight.w600
                                ),)
                                    
                              ],
                            ),
                          ),
                          // ksizedbox10,
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Container(
                          //     child: Padding(
                          //       padding: const EdgeInsets.symmetric(horizontal: 10),
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text('Login(to Better offer and Services)')
                          //               .text
                          //               .semiBold
                          //               .blue900
                          //               .xl2
                          //               .make(),
                          //           Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceBetween,
                          //             children: [
                          //               Container(
                          //                 child: TextField(
                          //                   decoration: InputDecoration(
                          //                     border: OutlineInputBorder(
                          //                         borderRadius:
                          //                             BorderRadius.circular(5)),
                          //                     hintText: 'Enter Mobile Number',
                          //                   ),
                          //                 ),
                          //                 decoration: BoxDecoration(
                          //                     //  color: Colors.grey[200],
                          //                     borderRadius:
                          //                         BorderRadius.circular(15)),
                          //                 height: size.height * 0.06,
                          //                 width: size.width * 0.4,
                          //               ),
                          //               Row(
                          //                 children: [
                          //                   Container(
                          //                     child: Center(
                          //                         child: Text('Sent Otp')
                          //                             .text
                          //                             .semiBold
                          //                             .xl2
                          //                             .white
                          //                             .make()),
                          //                     height: size.height * 0.06,
                          //                     width: 150,
                          //                     color: korange,
                          //                   ),
                          //                   kwidth10,
                          //                   Text('OR').text.xl2.make(),
                          //                   kwidth10,
                          //                   Container(
                          //                     child: Center(
                          //                         child: Text('Gmail Sign in')
                          //                             .text
                          //                             .semiBold
                          //                             .xl2
                          //                             .white
                          //                             .make()),
                          //                     height: size.height * 0.06,
                          //                     width: 150,
                          //                     color: kgrey,
                          //                   ),
                          //                 ],
                          //               ),
                          //             ],
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //     decoration: kcontainer,
                          //     height: size.height * 0.2,
                          //     width: size.width,
                          //   ),
                          // ),
                          ksizedbox10,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Enter Contact Details (Your Booking Details Will be Sent to your email address and contact no.)',
                                    style: TextStyle(
                                      fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                    ),),
                                        
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: TextField(
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  10),
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              FilteringTextInputFormatter.deny(
                                                  RegExp(r'\s')),
                                            ],
                                            controller: phoneNumberContoller,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              hintText: 'Enter Mobile Number',
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              //  color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: size.height * 0.06,
                                          width: size.width * 0.3,
                                        ),
                                        kwidth10,
                                        Container(
                                          child: TextField(
                                            controller: emailController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              hintText: 'Enter Email ID',
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              //  color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: size.height * 0.06,
                                          width: size.width * 0.3,
                                        ),
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Checkbox(
                                    //       value:this. isvalue, 
                                    //       onChanged: ( value){
                                    //       setState(() {
                                    //         this.isvalue = value!;
                                    //       });
                                    //       }),
                                    //     kwidth10,
                                    //     Text('Sent Me booking details before making the booking',
                                    //     style: TextStyle(
                                    //       fontSize: 18,
                                    //       color: Colors.black,
                                    //       fontWeight: FontWeight.w600
                                    //     ),)
                                            
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                              decoration: kcontainer,
                              height: size.height * 0.4,
                              width: size.width,
                            ),
                          ),
                          ksizedbox10,

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  
                                    for (int i = 0;
                                        i < widget.busContactmodel.length;
                                        i++)
                                       Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Passenger Details').text.xl.semiBold.make(),
                        Text('Seat No : ${widget.busContactmodel[i].seats}')
                            .text
                            .semiBold
                            .make(),
                      ],
                    ),
                    ksizedbox10,
                    const Text('NAME').text.bold.gray500.make(),
                    ksizedbox10,
                    TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      controller: widget.busContactmodel[i].nameController,
                      decoration: const InputDecoration.collapsed(
                          hintText: "Enter your name"),
                    ),
                    ksizedbox10,
                    Divider(color: kgrey, height: 0.5),
                    ksizedbox20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('GENDER').text.gray500.semiBold.make(),
                      ],
                    ),
                    RadioListTile(
            title:const Text('Male'),
            value: 'Male',
            groupValue: widget.busContactmodel[i].gender,
            onChanged: (value) {
              setState(() {
                widget.busContactmodel[i].gender = value!;
              });
            },
          ),
          RadioListTile(
            title:const Text('Female'),
            value: 'Female',
            groupValue: widget.busContactmodel[i].gender,
            onChanged: (value) {
              setState(() {
                widget.busContactmodel[i].gender = value!;
              });
            },
          ),
                    ksizedbox10,
                    const Text('AGE').text.bold.gray500.make(),
                    ksizedbox10,
                    TextField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      controller: widget.busContactmodel[i].ageController,
                      decoration: const InputDecoration.collapsed(hintText: "Enter your age"),
                    ),
                  ksizedbox20
                  ], 
                ),
                                          
                                    // Column(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.start,
                                    //   children: [
                                    //     Row(
                                    //       children: [
                                    //         Container(
                                    //           child: TextField(
                                    //             controller: nameController,
                                    //             decoration: InputDecoration(
                                    //               border: OutlineInputBorder(
                                    //                   borderRadius:
                                    //                       BorderRadius.circular(
                                    //                           5)),
                                    //               hintText:
                                    //                   'Enter Your Full Name',
                                    //             ),
                                    //           ),
                                    //           decoration: BoxDecoration(
                                    //               //  color: Colors.grey[200],
                                    //               borderRadius:
                                    //                   BorderRadius.circular(
                                    //                       15)),
                                    //           height: size.height * 0.06,
                                    //           width: size.width * 0.3,
                                    //         ),
                                    //         kwidth10,
                                    //         Container(
                                    //           child: TextField(
                                    //             controller: ageController,
                                    //             decoration: InputDecoration(
                                    //               border: OutlineInputBorder(
                                    //                   borderRadius:
                                    //                       BorderRadius.circular(
                                    //                           5)),
                                    //               hintText: 'Age',
                                    //             ),
                                    //           ),
                                    //           decoration: BoxDecoration(
                                    //               //  color: Colors.grey[200],
                                    //               borderRadius:
                                    //                   BorderRadius.circular(
                                    //                       15)),
                                    //           height: size.height * 0.06,
                                    //           width: 60,
                                    //         ),
                                    //         Icon(Icons.person),
                                    //         const Text('GENDER')
                                    //             .text
                                    //             .gray500
                                    //             .semiBold
                                    //             .make(),
                                    //         RadioListTile(
                                    //           title: const Text('Male'),
                                    //           value: 'Male',
                                    //          groupValue: widget
                                    //              .busContactmodel[i].gender,
                                    //           onChanged: (value) {
                                    //             setState(() {
                                    //               widget.busContactmodel[i]
                                    //                   .gender = value!;
                                    //             });
                                    //           },
                                    //         ),
                                    //         Row(
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment
                                    //                   .spaceBetween,
                                    //           children: [
                                    //             const Text('Passenger Details')
                                    //                 .text
                                    //                 .xl
                                    //                 .semiBold
                                    //                 .make(),
                                    //            Text('Seat No : ${widget.busContactmodel[i].seats}')
                                    //                .text
                                    //                .semiBold
                                    //                .make(),
                                    //           ],
                                    //         ),
                                    //       ],
                                    //     ),
                                    //     ksizedbox10,

                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                              decoration: kcontainer,
                              // height: size.height * 0.3,
                              width: size.width,
                            ),
                          ),
                          ksizedbox10,
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Container(
                          //     child: Padding(
                          //       padding: const EdgeInsets.symmetric(horizontal: 10),
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text('All Coupons Code Available')
                          //               .text
                          //               .semiBold
                          //               .blue900
                          //               .xl2
                          //               .make(),
                          //           Column(
                          //             mainAxisAlignment: MainAxisAlignment.start,
                          //             children: [
                          //               Row(
                          //                 children: [
                          //                   Container(
                          //                     child: TextField(
                          //                       decoration: InputDecoration(
                          //                         border: OutlineInputBorder(
                          //                             borderRadius:
                          //                                 BorderRadius.circular(5)),
                          //                         hintText: 'Enter Your Full Name',
                          //                       ),
                          //                     ),
                          //                     decoration: BoxDecoration(
                          //                         //  color: Colors.grey[200],
                          //                         borderRadius:
                          //                             BorderRadius.circular(15)),
                          //                     height: size.height * 0.06,
                          //                     width: size.width * 0.3,
                          //                   ),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     decoration: kcontainer,
                          //     height: size.height * 0.2,
                          //     width: size.width,
                          //   ),
                          // ),
                          ksizedbox10,
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Container(
                          //     child: Padding(
                          //       padding: const EdgeInsets.symmetric(horizontal: 10),
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text('All Coupons Code Available')
                          //               .text
                          //               .semiBold
                          //               .blue900
                          //               .xl2
                          //               .make(),
                          //           Column(
                          //             mainAxisAlignment: MainAxisAlignment.start,
                          //             children: [
                          //               Row(
                          //                 children: [
                          //                   Container(
                          //                     child: TextField(
                          //                       decoration: InputDecoration(
                          //                         border: OutlineInputBorder(
                          //                             borderRadius:
                          //                                 BorderRadius.circular(5)),
                          //                         hintText: 'Enter Your Full Name',
                          //                       ),
                          //                     ),
                          //                     decoration: BoxDecoration(
                          //                         //  color: Colors.grey[200],
                          //                         borderRadius:
                          //                             BorderRadius.circular(15)),
                          //                     height: size.height * 0.06,
                          //                     width: size.width * 0.3,
                          //                   ),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     decoration: kcontainer,
                          //     height: size.height * 0.2,
                          //     width: size.width,
                          //   ),
                          // ),
                        
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Obx(
                                  () => busController.isLoading.isTrue
                                          ? Container(
                                              child:  Center(
                                                child:
                                                    const CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              height: size.height * 0.06,
                                              width: 190,
                                              color: korange,
                                            )
                                          : InkWell(
                                      onTap: () {
                                        busController.isLoading(true);
                                        List<PaxDetailslist> paxDetailslists = [];

                                        for (int a = 0;
                                            a < widget.busContactmodel.length;
                                            a++) {
                                          PaxDetailslist paxDetailslistdata =
                                              PaxDetailslist(
                                                  age: widget.busContactmodel[a]
                                                      .ageController.text,
                                                  gender: widget
                                                              .busContactmodel[a]
                                                              .gender ==
                                                          "Male"
                                                      ? 0
                                                      : 1,
                                                  isLadies: false,
                                                  paxName: widget
                                                      .busContactmodel[a]
                                                      .nameController
                                                      .text,
                                                  seatNumber: widget
                                                      .busContactmodel[a].seats);

                                          paxDetailslists.add(paxDetailslistdata);
                                        }
                                        busController.tempBookBusTicket(
                                            boardingId: widget.boardingId,
                                            droppingId: widget.dropingId,
                                            busData: widget.busData,
                                            searcKey: widget.searchkey,
                                            mobileNumber:
                                                phoneNumberContoller.text,
                                            customerEmail: emailController.text,
                                            paxDetailslist: paxDetailslists,
                                            amount: widget.amount,
                                            customerName: widget.cusName,
                                            seatMapKey:
                                                busController.seatMapKey.value);
                                        // Get.to(BusbookingSuccesfullScreen());
                                      },
                                      child: Container(
                                              child: Center(
                                                  child: Text(
                                                          'PAY ₹ ${busController.totalAmount.value}')
                                                      .text
                                                      .semiBold
                                                      .xl2
                                                      .white
                                                      .make()),
                                              height: size.height * 0.06,
                                              width: 190,
                                              color: korange,
                                            )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // BussDetails(
                    //   boardingId: widget.boardingId,
                    //   busData: widget.busData,
                    //   dropingId: widget.dropingId,
                    //   searchkey: widget.searchkey,
                    //   seatIds: seatIds,
                    //   amount: busController.totalAmount.value.toStringAsFixed(2), 
                    //   busContactmodel: [],
                    // )
                  ],
                ),
                ksizedbox30,
                const RegisterCommonBottom()
              ],
            );
          }),
        ],
      ),
    );
  }
}
