import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constans.dart';
import '../../../../controller/auth_controller/auth_controller.dart';

class Respooffers_container extends StatefulWidget {
  String image;
  String title;
  String description;
   Respooffers_container({
    super.key,
    required this.description,
    required this.image,
    required this.title
  });

  @override
  State<Respooffers_container> createState() => _Respooffers_containerState();
}

class _Respooffers_containerState extends State<Respooffers_container> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.getservice();
  }
  final authController=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(
      builder: (_) {
      return ListView.builder(
        
        shrinkWrap: true,
        itemCount: authController.dataList.length,
          itemBuilder: (context,index){
            return  Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
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
              height: 150,
              width: size.width*0.8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(authController.dataList[index].images.first,
                      fit: BoxFit.fitHeight,height: 150)),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Text(
                        authController.dataList[index].title,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        authController.dataList[index].title,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        authController.dataList[index].title,
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Text(
                        authController.dataList[index].title,
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      ksizedbox10,
                    ],
                  ),
                ],
              ),
                      ),
            );
          }
                );
      }
    );
  }
}