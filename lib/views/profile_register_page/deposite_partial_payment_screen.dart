import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/views/members/common_widget/common.dart';
import 'package:bciweb/views/members/homescreens/reg_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';
import '../members/widgets/alert_box_widgets.dart';

class DeposiePartialPayment extends StatefulWidget {
  const DeposiePartialPayment({super.key});

  @override
  State<DeposiePartialPayment> createState() => _DeposiePartialPaymentState();
}

class _DeposiePartialPaymentState extends State<DeposiePartialPayment> {
  var amountController = TextEditingController();
  final authprofileController = Get.find<AuthProfileController>();

  final profileController = Get.find<ProfileController>();
  
   Future<void> _showAlertDialog() async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Padding(
        padding:const  EdgeInsets.only(top: 120,bottom: 120),
        child: AlertDialog( // <-- SEE HERE
         title: Image.asset('assets/images/paymentsuccess.png',height: 140,fit: BoxFit.fitHeight,),
         content: Center(child: Column(
           children: [
             const Text('Payment Successful',
             style: TextStyle(
              fontWeight: FontWeight.w600
             ),),
             const Text('Thank you! Your payment is complete',
             style: TextStyle(
              fontSize: 13
             ),),
             ksizedbox30,
             GestureDetector(
              onTap: (){
              Get.to(const RegisterProfileScreen());
              },
               child: Container(
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                  color: kOrange
                ),
                child: Center(
                  child: Text('Done',
                  style: TextStyle(
                    color: kwhite
                  ),),
                ),
               ),
             )
             
           ],
         )),
        ),
      );
    },
  );
}
Future<void> _showAlertDialogcancel() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 180,bottom: 180),
        child: AlertDialog( // <-- SEE HERE
          title: const Text('Cancel Transcation',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          content: Center(
            child: Column(
              children:  <Widget>[
                const Text('Are you sure want to cancel booking?',
                style: TextStyle(
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,),
                ksizedbox40,
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: korange,
                        minimumSize:const Size(100, 40)
                      ),
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, 
                    child:const Text('Yes')),
                
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kblue,
                           minimumSize:const Size(100, 40)
                        ),
                        onPressed: (){
                            Navigator.of(context).pop();
                        }, 
                      child:const Text('No')),
                    )
                  ],
                )
              ],
            ),
          ),
         
        ),
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/images/walletdepositbackground.png')
                    ],
                  ),ksizedbox10,
                  const Center(
                    child: Text('Advance booking',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Image.asset('assets/icons/walletdepositicon.png',
                          height: 200,fit: BoxFit.fitHeight,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Pay some advance amount for\nyour membership',
                              style: TextStyle(
                                fontSize: 24,
                                color: kblue,
                                fontWeight: FontWeight.w700
                              ),),
                              ksizedbox40,
                              Container(
                                height: 42,
                                width: 300,
                                decoration: BoxDecoration(
                                border: Border.all(
                                  color: kblue
                                ),
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: Center(
                                child: TextField(
                                  controller: amountController,
                                  decoration: InputDecoration(
                                    hintText: "Enter Booking Advance Amount",
                                    border: OutlineInputBorder(
                                      borderSide:BorderSide.none,
                                       borderRadius: BorderRadius.circular(8)
                                    )
                                  ),
                                )
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),ksizedbox40,
                  Padding(
                    padding: const EdgeInsets.only(top: 40,left: 0,right: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            print('add transaction');
                            profileController.initiatePartialPayment(
                              amount: double.parse(amountController.text), 
                              id: 0, 
                              gstPercentage: "", 
                              percentageAmount: "", 
                              totalAmount: amountController.text
                              );
                          },
                          child: Container(
                            height: 40,
                            width: 800,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                kOrange,
                                kyellow
                              ]),
                                borderRadius: BorderRadius.circular(7)
                            ),
                            child: Center(child: Text('Pay',
                            style: TextStyle(
                              color: kwhite,
                              fontSize: 17
                            ),)),
                          ),
                        ),
                      ],
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 30,left: 0,right: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                          _showAlertDialogcancel();
                          },
                          child: Container(
                            height: 40,
                            width: 800,
                            decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(7)
                            ),
                            child: Center(child: Text('Cancel',
                            style: TextStyle(
                              color: kwhite,
                              fontSize: 17,
                              
                            ),)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ksizedbox40,
                  const RegisterCommonBottom()
                ],
                
              ),
            ),
    
      ),
    );
  }
}