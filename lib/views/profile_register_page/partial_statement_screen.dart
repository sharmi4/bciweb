import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/setting_controller/setting_controller.dart';
import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartialStatementScreen extends StatefulWidget {
  const PartialStatementScreen({super.key});

  @override
  State<PartialStatementScreen> createState() => _PartialStatementScreenState();
}

class _PartialStatementScreenState extends State<PartialStatementScreen> {
  @override
  void initState() {
    super.initState();
    settingController.getCreditProfile();
    settingController.getCreditStatement();
  }
  final settingController= Get.find<ApiSettingController>(); 
  bool hotelbool = false;
  bool busbool = false;
  bool flightbool = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
           width: MediaQuery.of(context).size.width,
           child: Column(
            children: [
               Stack( children: [
                            Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset('assets/images/businesswalletbackgroundimage.png',
                              fit: BoxFit.cover,)),
                            Positioned(
                              top:0,
                              left:0,
                              right:0,
                              bottom:0,
                              child: Center(
                                child: Text('Statement',
                                   style: displayfont,
                                                          
                                ),
                              ))
                          ],
                        ),
                    
                          ksizedbox30,
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Row(
                            children: [
                              Text('Transactions Details',
                              style: TextStyle(
                                fontSize: 22,
                                color: kblue,
                                fontWeight: FontWeight.w600
                              ),),
                            ],
                          ),
                        ),
                        ksizedbox20,
                       Padding(
                          padding: const EdgeInsets.only(left: 40,right: 40,bottom: 50),
                          child: Container(
                              height: 300,
                            width:size.width ,
                            decoration: BoxDecoration(
                              color: kwhite,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  offset:const Offset(0.0, 0.75),
                                  blurRadius: 5,
                                  color: kgrey
                                )
                              ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: GetBuilder<ApiSettingController>(
                                builder: (_) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: settingController.creditTransactionsList.length,
                                    itemBuilder: ( context, index) {
                                            return Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                            ksizedbox20,            
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                  
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                                    const Icon(
                                                          Icons.check_circle_rounded,
                                                          size: 20,
                                                          color: Colors.green,
                                                        ),
                                                             Container(
                                                      height:30,
                                                      width: 1.5,
                                                      color: kgrey,
                                                    ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(settingController.creditTransactionsList[index].creditFor,
                                                            style: TextStyle(
                                                              
                                                              fontWeight: FontWeight.w500,
                                                              color: kblue
                                                            ),),
                                                            settingController.creditTransactionsList[index].isPaid == "2" ? 
                                              Text("Credited on ${formatDate(settingController.creditTransactionsList[index].createdAt, [
                                                                dd,
                                                                " ",
                                                                M,
                                                                " ",
                                                                yyyy
                                                              ])}",
                                                          style: const TextStyle(
                                                              fontSize: 14,
                                                              color: Color(
                                                                  0xFF05406E),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ) :
                                              Text(
                                                "Paid on ${formatDate(settingController.creditTransactionsList[index].createdAt, [
                                                      dd,
                                                      " ",
                                                      M,
                                                      " ",
                                                      yyyy
                                                    ])}",
                                                     style: TextStyle(
                                                    fontSize: 13, color: kblue),
                                                        )  ,
                                                            Text(settingController.creditTransactionsList[index].creditForId,
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              color: kblue
                                                            ),)
                                                          ],
                                                                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                   
                                                   
                                                  
                                                  ],
                                                ),
                                              
                                              ],
                                            ),
                                          
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    ksizedbox10,
                                                    Text('₹${settingController.creditTransactionsList[index].amount}',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: settingController
                                                      .creditTransactionsList[
                                                          index]
                                                      .isPaid ==
                                                  "2"
                                              ? Colors.green
                                              : Colors.pink,
                                                      fontWeight: FontWeight.w500
                                                    ),),
                                                    
                                                  ],
                                                )
                                          ],
                                        ),
                                         Divider()
                                      ],
                                    );
                                      },
                                   
                                  );
                                }
                              ),
                            ),
                          ),
                        ),
                      
            ],
           ),
        ),
      ),
    );
  }
}