import 'package:flutter/material.dart';

import '../../../constant/constans.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
        child: PreferredSize(
        child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            decoration: BoxDecoration(
              color: kblue
            ),
            child: Column(
              children: [
                ksizedbox10,
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Image.asset('assets/images/phoneimage.png',height: 15,fit: BoxFit.fitHeight,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('+91 98765 43210',
                      style: TextStyle(color: kwhite,fontSize: 13),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Icon(Icons.mail,color: kwhite,size: 15,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('info@gmail.com',style: TextStyle(color: kwhite,fontSize: 13),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Icon(Icons.location_on,size: 15,color: kwhite,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('Chennai, Tamilnadu - 600026',style: TextStyle(fontSize: 13,color: kwhite),),
                    )
                  ],
                )
              ],
            ),
          ),
          // Positioned(
          // left: -2,
          //   top: 0,
          //   child: ClipPath(
          //     clipper: SideCutClipper(),
          //     child: Container(
          //       height: 20,
          //       width: 40  ,
          //       color: kwhite,
                
          //     )
          //   ),
          // ),
          Positioned(
            right: 6,
            top: 0,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width*0.5,
              color: kOrange,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Text('Follow Us :',style: TextStyle(color: kwhite,fontSize: 15),),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset('assets/images/facebook.png',height: 15,fit: BoxFit.fitHeight,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset('assets/images/twitter.png',fit: BoxFit.fitHeight,height: 15,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset('assets/images/linkedin.png',height: 15,fit: BoxFit.fitHeight,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset('assets/images/instagram.png',height: 15,fit: BoxFit.fitHeight,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset('assets/images/whatsappimage.png',height: 15,fit: BoxFit.fitHeight,),
                  )
              
                ]),
              ),
            ),
          )
        ],
        
             ), preferredSize: Size(double.infinity, 
             40)),
       
    );
  }
}