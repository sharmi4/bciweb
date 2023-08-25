import 'package:bciweb/constant/constans.dart';
import 'package:flutter/material.dart';

import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';
import '../common_widget/common.dart';

class WalletDepositScreen extends StatefulWidget {
  const WalletDepositScreen({super.key});

  @override
  State<WalletDepositScreen> createState() => _WalletDepositScreenState();
}

class _WalletDepositScreenState extends State<WalletDepositScreen> {
  
   Future<void> _showAlertDialog() async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 120,bottom: 120),
        child: AlertDialog( // <-- SEE HERE
         title: Image.asset('assets/images/paymentsuccess.png',height: 140,fit: BoxFit.fitHeight,),
         content: Center(child: Column(
           children: [
             Text('Payment Successful',
             style: TextStyle(
              fontWeight: FontWeight.w600
             ),),
             Text('Thank you! Your payment is complete',
             style: TextStyle(
              fontSize: 13
             ),),
             ksizedbox30,
             GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
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
                Text('Are you sure want to cancel booking?',
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
                        minimumSize: Size(100, 40)
                      ),
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, 
                    child:Text('Yes')),
                
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kblue,
                           minimumSize: Size(100, 40)
                        ),
                        onPressed: (){
                            Navigator.of(context).pop();
                        }, 
                      child:Text('No')),
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
    return Scaffold(
       appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonScreen(),
              RegisterCommonContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/walletdepositbackground.png')
                  ],
                ),ksizedbox10,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Deposit Cash',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('All Select Membership Cards Choose Anything',
                      style: TextStyle(
                        fontSize: 16,
                        color: kblue
                      ),),
                    )
                  ],
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
                            Text('Add To Wallet Amounts or Default \nAmount Choose Payment Methods...',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700
                            ),),
                            ksizedbox40,
                            Container(
                              height: 42,
                              width: 180,
                              decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Center(
                              child: Text('Enter Amount',
                              style: TextStyle(
                                fontSize: 17,
                                color: kwhite
                              ),),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),ksizedbox40,
                Column(
                  children: [
                    Text('Others Amounts',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                    ksizedbox30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                            color: kwhite,
                            border: Border.all(
                              color: kblue
                            ),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Center(child: Text('+2000')),
                        ),
                        
                       
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            height: 35,
                            width: 130,
                            decoration: BoxDecoration(
                              color: kwhite,
                              border: Border.all(
                                color: kblue
                              ),
                                borderRadius: BorderRadius.circular(7)
                            ),
                            child: Center(child: Text('+4000')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            height: 35,
                            width: 130,
                            decoration: BoxDecoration(
                              color: kwhite,
                              border: Border.all(
                                color: kblue
                              ),
                                borderRadius: BorderRadius.circular(7)
                            ),
                            child: Center(
                              child: Text('+8000'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            height: 35,
                            width: 130,
                            decoration: BoxDecoration(
                              color: kwhite,
                              border: Border.all(
                                color: kblue
                              ),
                               borderRadius: BorderRadius.circular(7)
                            ),
                            child: Center(child: Text('+10000')),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40,left: 0,right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                         _showAlertDialog();
                        },
                        child: Container(
                          height: 40,
                          width: 1000,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              kOrange,
                              kyellow
                            ]),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Center(child: Text('Payments',
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
                          width: 1000,
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
                 RegisterCommonBottom()
              ],
              
            ),
          ),

    );
  }
}