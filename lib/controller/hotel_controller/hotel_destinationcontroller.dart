import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import '../../constant/constans.dart';
import '../../models/hotel_model/hoteldestination_model.dart';
import '../../services/networks/hotel_api_service/hoteldestination_api_service.dart';

class HotelDestinationController extends GetxController{
HotelDestinationApiService hoteldestinationapiservice = HotelDestinationApiService();
   RxString cityid=''.obs;
  List<HotelDestinationModel>destinationlist=[];

  hoteldestination({required String city})async{
    destinationlist.clear(); 
    dio.Response<dynamic> response = await hoteldestinationapiservice.hoteldestination(city: city);
    if(response.statusCode==200){
      List<HotelDestinationModel>  hotelDestinationModelList = hotelDestinationModelFromJson(response.data);
      destinationlist = hotelDestinationModelList;
       Get.rawSnackbar(
        backgroundColor: Colors.green,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          )
       );

    }else{
       Get.rawSnackbar(
         backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          )
      );
    }


  }

}