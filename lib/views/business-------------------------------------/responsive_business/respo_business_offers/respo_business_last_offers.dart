
import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/business_controller/business_service_controller.dart';
import 'package:bciweb/controller/service_controller/home_controller.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LastOffers extends StatefulWidget {
  const LastOffers({super.key});

  @override
  State<LastOffers> createState() => _LastOffersState();
}

class _LastOffersState extends State<LastOffers> {

 final servicesController = Get.find<BusinessServiceController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    servicesController.offerList();
  }

  List lastimage = [
    'assets/images/lastoffers1.png',
    'assets/images/lastjewell.png',
    'assets/images/lastshoe.png',
    'assets/images/lastlaptop.png',
    
  ];
  List title = [
    'New Arrival Men Spring \nSummer Cotton Liner \nShirt Slim',
    'Stunning Temple jewellery \nPieces to Effortless Amp \nUp your Bridal Look',
    'Hollow Out Men PU Leather \nOxford Formal Shoes -9/9.5',
    'Best Buy:Apple Macbook \n"12"Display Intel Core i5\n8GB Memory 512GB Flash \nStorage'
  ];
  List description = [
    'Gender: Men Item Type: Shirts \nType: Casual Shirts Material: \nModal,Linen,Cotton Sleeve quare\nStyle: Casual Shirt',
    'Formerly used to adorn the idols \nof gods and goddesses and latern \nTemple Jewellery has  bride''\ns wedding day look.',
    'Brand Name: US MART NEW \nYORKUpper Material: Shoes \nMaterial:RubberClosure \nType: Lace-upInsole \nMaterial:',
    'Shop Apple Macbook® 12" \nDisplay Intel Core i5 8GB Memory \n512GB Flash Storage (Old Model) \nGold at Best Buy. ',

  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

       appBar: PreferredSize(
        child: AppBarMob(),
        preferredSize: Size(double.infinity, 40),
      ),
      drawer: DrawerBusiness(),


      body: GetBuilder<BusinessServiceController>(
        builder: (_) {
          return Column(
            children: [
              ksizedbox40,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text('LAST OFFERS',
                  
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: kblue
                    ),),
                  ],
                ),
              ),
              ksizedbox40,
              Container(
               child:   ListView.builder(
                  itemCount: servicesController.offerListData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Get.to(() => VendorViewOffers(
                              //       vendorId: homeController
                              //           .todayOfferListData[index].vendorId,
                              //     ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: Container(
                                height: 150,
                            
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius:5,
                                      color: kgrey
                                    )
                                  ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Container(
                                          height: 130,
                                          width: 120,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(
                                              servicesController.offerListData[index].image,
                                                                            
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15, top:10 ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                        
                                          children: [
                                            Container(
                                              width: 150,
                                              child: Text(
                                                servicesController
                                                    .offerListData[index].title,
                                                style: primaryFont.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                                 width: 150,
                                              child: Text(
                                                "Discount value : ₹${servicesController.offerListData[index].discountValue}",
                                                style: primaryFont.copyWith(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                                 width: 150,
                                              child: Text(
                                                "Ends on : ${formatDate(servicesController.offerListData[index].endsAt, [
                                                      dd,
                                                      "-",
                                                      mm,
                                                      "-",
                                                      yyyy
                                                    ])}",
                                                style: primaryFont.copyWith(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                        ],
                      )
                    );
                  }),
              ),
            ],
          );
        }
      ),
    );
  }
}
