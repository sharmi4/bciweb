import 'package:flutter/material.dart';

import '../../../mobile_wdgets/comomappbar.dart';

class MobilePartnerScreen extends StatefulWidget {
  const MobilePartnerScreen({super.key});

  @override
  State<MobilePartnerScreen> createState() => _MobilePartnerScreenState();
}

class _MobilePartnerScreenState extends State<MobilePartnerScreen> {
  List mobilePartnerimage=[
  'assets/images/partnerimage1.png',
  'assets/images/partnerimage2.png',
  'assets/images/partnerimage3.png',
  'assets/images/partnerimage4.png',
  'assets/images/partnerimage5.png',
  'assets/images/partnerimage6.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      body: Column(
        children: [
            Padding(
                                 padding: const EdgeInsets.only(top:100),
                                 child: Container(
                                      width: MediaQuery.of(context).size.width,
                                   child:GridView.builder(
                                    
                                    itemCount: mobilePartnerimage.length,
                                    shrinkWrap: true,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 40,
                                      crossAxisSpacing: 50,
                                      childAspectRatio: 1.5
                                      ), 
                                    itemBuilder: (context,index){
                                      return Padding(
                                        padding: const EdgeInsets.only(left:0,right:0),
                                        child: Container(
                                             height: 400,
                                             width: 250,
                                               decoration: BoxDecoration(
                                            
                                               ),
                                               child:Image.asset(mobilePartnerimage[index],
                                               fit: BoxFit.fitHeight,)    
                                        ),
                                      );
                                    })
                                    
                                 ),
                               ),
        ],
      ),
    );
  }
}