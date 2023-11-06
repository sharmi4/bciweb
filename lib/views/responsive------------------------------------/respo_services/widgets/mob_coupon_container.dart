import 'package:bciweb/constant/constans.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MobCouponContainer extends StatefulWidget {
  String title;
  String offer;
  String couponCode;
  String description;
  String image;
  MobCouponContainer({super.key,required this.couponCode,required this.description,required this.image,required this.offer,required this.title});

  @override
  State<MobCouponContainer> createState() => _MobCouponContainerState();
}

class _MobCouponContainerState extends State<MobCouponContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 0.4,
              color: kgrey,
              offset:const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(image: 
                NetworkImage(widget.image),
                height: 160,width: double.infinity,
                fit: BoxFit.fill,
                )
                ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
                child: Text(widget.title,style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
                child: Text(widget.description,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: kgrey),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
                child: Text(widget.offer,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: kblue),),
              ),
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
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Coupon Code:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: kblue),),
                            Text(widget.couponCode,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: kwhite),),
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            FlutterClipboard.copy(widget.couponCode).then(
                             (value) =>
                             Fluttertoast.showToast(
                               msg:"Copy to clipboard",
                               toastLength: Toast.LENGTH_SHORT,
                               gravity: ToastGravity.CENTER,
                               timeInSecForIosWeb: 1,
                               backgroundColor: Colors.white,
                               textColor:Colors.black,
                               fontSize: 16.0),
                              //print("code copied")
                              );
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child:const Center(
                              child: Text("Copy"),
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
        ),
      ),
    );
  }
}