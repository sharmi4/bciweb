import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/subscription_controller/subscription_controller.dart';
import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:bciweb/views/members/common_widget/common.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MerchantCouponsListScreen extends StatefulWidget {
  const MerchantCouponsListScreen({super.key});

  @override
  State<MerchantCouponsListScreen> createState() => _MerchantCouponsListScreenState();
}

class _MerchantCouponsListScreenState extends State<MerchantCouponsListScreen> {
  final subscripeController=Get.find<SubscriptionApiController>();
  @override
  Widget build(BuildContext context) {
     var size=MediaQuery.of(context).size;
    return SelectionArea(
      child: Scaffold(
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
    
          child: GetBuilder<SubscriptionApiController>(builder: (_) {
          return Container(
            //height: size.height * 0.55,
            child: subscripeController.merchantCouponData.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/couponnotavailaimage.png',
                          height: 180,
                          fit: BoxFit.fitHeight,
                        ),
                        ksizedbox20,
                        Text(
                          'No Coupon Available',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: kblue),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: subscripeController.merchantCouponData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: kwhite,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: kgrey.withOpacity(0.6),
                                  ),
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                subscripeController
                                            .merchantCouponData[index].image ==
                                        "null"
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/icons/coupon.jpg",
                                          height: 120,
                                          width: size.width,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image(
                                          image: NetworkImage(subscripeController
                                              .merchantCouponData[index].image),
                                          height: 120,
                                          width: size.width,
                                          fit: BoxFit.fill,
                                        )),
                                const SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    subscripeController.merchantCouponData[index].title,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    subscripeController.merchantCouponData[index].description,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: kgrey),
                                  ),
                                ),
                                // Text(
                                //   profileController.couponsData[index].,
                                //   style: TextStyle(
                                //       fontSize: 20,
                                //       fontWeight: FontWeight.bold,
                                //       color: kblue),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: kyellow,
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Coupon Code: ",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: kblue),
                                              ),
                                              Text(
                                                subscripeController
                                                    .merchantCouponData[index]
                                                    .couponCode,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: kwhite),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: (){
                                              FlutterClipboard.copy(
                                                      subscripeController.merchantCouponData[index].couponCode.toString())
                                                  .then(
                                                (value) => Fluttertoast.showToast(
                                                    msg: "Copy to clipboard",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.white,
                                                    textColor: Colors.black,
                                                    fontSize: 16.0),
                                                //print("code copied")
                                              );
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: kblue,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Copy",
                                                  style: primaryFont.copyWith(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  ),
          );
        }),
        ),
      ),
    );
  }
}
class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Color.fromARGB(255, 233, 230, 230)
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}