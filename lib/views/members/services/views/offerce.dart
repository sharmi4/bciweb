


import 'package:bciweb/controller/service_controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../constant/constans.dart';
//import '../../../../registerhomescreen/common_reg_appbar';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../common_widget/common.dart';

class OfferScreen extends StatefulWidget {
   OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  final seriveoffersController=Get.find<HomeServiceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(),
          preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterCommonContainer(),
            Container(
              child: Stack(
                children: [
                  Image.asset('assets/images/offer.png'),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'OFFERS',
                        style:displayfont
                        // GoogleFonts.lato(
                          //  fontSize: 80,
                            //fontWeight: FontWeight.bold,
                            //color: kwhite),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ksizedbox20,
            Text(
              'All Offers Available',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff003366),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
           
            ksizedbox30,
            ksizedbox40,
               GetBuilder<HomeServiceController>(
              builder: (_){
                return Padding(
                  padding: const EdgeInsets.only(left: 50,right: 50),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: seriveoffersController.todayofferslist.length,
                    
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3,
                      mainAxisSpacing: 60,
                      crossAxisSpacing: 50,
                    crossAxisCount: 2), 
                    itemBuilder: (context,index){
                      return offers_container(
                        
                        image: seriveoffersController.todayofferslist[index].image,
                        title: seriveoffersController.todayofferslist[index].title,
                        description: seriveoffersController.todayofferslist[index].description,);
                    }),
                );
              // return Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
                 
              //     offers_container(
                    
              //       image: seriveoffersController.todayofferslist.first.image,
              //       description: seriveoffersController.todayofferslist.first.description,),
              //     offers_container(image: seriveoffersController.todayofferslist.first.image,
              //     description: seriveoffersController.todayofferslist.first.description,),
              //   ],
              // );
              }
            ),
            
          
            ksizedbox40,
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: kwhite,
                    ),
                    Text(
                      'BACK',
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                    color: kOrange, borderRadius: BorderRadius.circular(15)),
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

class offers_container extends StatelessWidget {
  String image;
  String description;
  String title;
 offers_container({
    super.key,
    required this.description,required this.image,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(125, 158, 158, 158).withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: kwhite,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 500,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              width: MediaQuery.of(context).size.width*0.15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(image,fit: BoxFit.cover,))),
          ),
        
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Column(
             
              children: [
                ksizedbox10,
                Container(
                  width: 150,
                  child: Text(
                  
                    title,
              
                    style: TextStyle(
                       fontWeight: FontWeight.bold,
                      fontSize: 20,
                      
                    ),
                  ),
                ),
                              ksizedbox10,
                Container(
                  width: 150,
                  child: Text(
                  
                 description ,
              
                    style: TextStyle(
                       fontSize: 16
                      
                    ),
                  ),
                ),
               
                ksizedbox10,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
