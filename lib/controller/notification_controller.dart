import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/models/notification_model.dart';
import 'package:bciweb/services/networks/notification_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;


class NotificationController extends GetxController{

 NotificationAPiService notificationAPiService = NotificationAPiService();

List<NotificationData> notificationlist = []; 

Future notification()async{
notificationlist.clear();
 dio.Response<dynamic>response = await  notificationAPiService.notification();
 if(response.statusCode==200){
  NotificationModel notificationModel = NotificationModel.fromJson(response.data);
  notificationlist = notificationModel.data; 
 }else{
   Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
 }update();

}
}