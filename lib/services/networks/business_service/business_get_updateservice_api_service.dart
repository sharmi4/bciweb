import 'dart:io';
import 'package:bciweb/controller/service_controller/home_controller.dart';
import 'package:bciweb/models/time_slot_models.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/business_model/createservice_model.dart';
import '../../base_url/base_url.dart';
import 'package:get/get.dart' as gtx;

class UpdateServicesApiServices extends BaseApiService {
  Future updateServices(
      {required CreateServiceModel createServiceModel, required int id}) async {
    dynamic responseJson;
    try {
      var dio = Dio();

      
 final servicesController = gtx.Get.find<HomeServiceController>();
      List<String> tempWeekList = [];
      List<String> sundayFrom = [];
      List<String> mondayFrom = [];
      List<String> tuesDayFrom = [];
      List<String> wednesdayFrom = [];
      List<String> thuesdayFrom = [];
      List<String> fridayFrom = [];
      List<String> saturdayFrom = [];
      List<String> sundayTo = [];
      List<String> mondayTo = [];
      List<String> tuesDayTo = [];
      List<String> wednesdayTo = [];
      List<String> thuesdayTo = [];
      List<String> fridayTo = [];
      List<String> saturdayTo = [];

      List<TimeSlotAddModels> tempTimeSlotsList = [];

      if (servicesController.sunTimeSlot.isNotEmpty) {
        tempWeekList.add("Sunday");
        servicesController.sunTimeSlot.forEach((element) {
          sundayFrom.add(element.tempFromTime);
          sundayTo.add(element.tempToTime);
          TimeSlotAddModels timeSlotAddModels = TimeSlotAddModels(
              tempFromTime: element.tempFromTime,
              tempToTime: element.tempToTime,
              weedDay: "Sunday");
          tempTimeSlotsList.add(timeSlotAddModels);
        });
      }
      if (servicesController.monTimeSlot.isNotEmpty) {
        tempWeekList.add("Monday");
        servicesController.monTimeSlot.forEach((element) {
          mondayFrom.add(element.tempFromTime);
          mondayTo.add(element.tempToTime);
          TimeSlotAddModels timeSlotAddModels = TimeSlotAddModels(
              tempFromTime: element.tempFromTime,
              tempToTime: element.tempToTime,
              weedDay: "Monday");
          tempTimeSlotsList.add(timeSlotAddModels);
        });
      }
      if (servicesController.tueTimeSlot.isNotEmpty) {
        tempWeekList.add("Tuesday");
        servicesController.tueTimeSlot.forEach((element) {
          tuesDayFrom.add(element.tempFromTime);
          tuesDayTo.add(element.tempToTime);
          TimeSlotAddModels timeSlotAddModels = TimeSlotAddModels(
              tempFromTime: element.tempFromTime,
              tempToTime: element.tempToTime,
              weedDay: "Tuesday");
          tempTimeSlotsList.add(timeSlotAddModels);
        });
      }
      if (servicesController.wedTimeSlot.isNotEmpty) {
        tempWeekList.add("Wednesday");
        servicesController.wedTimeSlot.forEach((element) {
          wednesdayFrom.add(element.tempFromTime);
          wednesdayTo.add(element.tempToTime);
          TimeSlotAddModels timeSlotAddModels = TimeSlotAddModels(
              tempFromTime: element.tempFromTime,
              tempToTime: element.tempToTime,
              weedDay: "Wednesday");
          tempTimeSlotsList.add(timeSlotAddModels);
        });
      }
      if (servicesController.thuTimeSlot.isNotEmpty) {
        tempWeekList.add("Thursday");
        servicesController.tueTimeSlot.forEach((element) {
          thuesdayFrom.add(element.tempFromTime);
          thuesdayTo.add(element.tempToTime);
          TimeSlotAddModels timeSlotAddModels = TimeSlotAddModels(
              tempFromTime: element.tempFromTime,
              tempToTime: element.tempToTime,
              weedDay: "Thursday");
          tempTimeSlotsList.add(timeSlotAddModels);
        });
      }
      if (servicesController.friTimeSlot.isNotEmpty) {
        tempWeekList.add("Friday");
        servicesController.friTimeSlot.forEach((element) {
          fridayFrom.add(element.tempFromTime);
          fridayTo.add(element.tempToTime);
          TimeSlotAddModels timeSlotAddModels = TimeSlotAddModels(
              tempFromTime: element.tempFromTime,
              tempToTime: element.tempToTime,
              weedDay: "Friday");
          tempTimeSlotsList.add(timeSlotAddModels);
        });
      }
      if (servicesController.satTimeSlot.isNotEmpty) {
        tempWeekList.add("Saturday");
        servicesController.satTimeSlot.forEach((element) {
          saturdayFrom.add(element.tempFromTime);
          saturdayTo.add(element.tempToTime);
          TimeSlotAddModels timeSlotAddModels = TimeSlotAddModels(
              tempFromTime: element.tempFromTime,
              tempToTime: element.tempToTime,
              weedDay: "Saturday");
          tempTimeSlotsList.add(timeSlotAddModels);
        });
      }


      var ameneity = List<dynamic>.from(
          createServiceModel.amenities.map((element) => element.toJson()));
      print(createServiceModel.image);
      FormData formData = FormData.fromMap({
        for (int i = 0; i < createServiceModel.image!.length; i++)
          "image[$i]":  MultipartFile.fromBytes(
              createServiceModel.image![i],
              filename: 'image'),
        "title": createServiceModel.title,
        if (createServiceModel.category != "null")
        "category": createServiceModel.category.toString(),
        "sale_amount": createServiceModel.saleAmount,
        "actual_amount": createServiceModel.actualAmount,
        // "share": createServiceModel.share,
        // "bvc_amount": createServiceModel.bvcAmount,
        "booking": createServiceModel.booking,
        "amenties": ameneity.toString(),
        "editor-value": createServiceModel.description,
        "isOffer": createServiceModel.isOfferAvailable,
        "isCoupon": createServiceModel.isCouponsAvailable,
        if (createServiceModel.offerPercentage != null)
          "offerPercentage": "${createServiceModel.offerPercentage}%",
        if (createServiceModel.offerAmount != null)
          "offerUpto_amount": createServiceModel.offerAmount,
        if (createServiceModel.couponAmount != null)
          "coupon_amount": createServiceModel.couponAmount,
        "id": id,
        "cgst": createServiceModel.cgst,
        "sgst": createServiceModel.sgst,
        "quantity":  createServiceModel.quantity,
          "is_recomended": createServiceModel.available,
        "unit": createServiceModel.unit,
         for (int i = 0; i < tempTimeSlotsList.length; i++)
          "weekdays[$i]": tempTimeSlotsList[i].weedDay,
        for (int i = 0; i < tempTimeSlotsList.length; i++)
          "fromTime[$i]": tempTimeSlotsList[i].tempFromTime,
        for (int i = 0; i < tempTimeSlotsList.length; i++)
          "toTime[$i]": tempTimeSlotsList[i].tempToTime,
      });

      print(formData.fields);

      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(addServicesURL,
          options: Options(
              headers: {'Authorization': 'Bearer $authtoken'},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      print("::::::::<update services URL>::::::::status code:::::::::${createServiceModel.quantity}:");
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

  dynamic returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        print("here.>>>>>>>>>>>>");
        return responseJson;
      case 400:
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 404:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      //     'Error occured while communication with server' +
      //         ' with status code : ${response.statusCode}');
    }
  }
}
