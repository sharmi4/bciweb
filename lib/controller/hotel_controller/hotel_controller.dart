import 'dart:async';

import 'package:bciweb/models/initiate_payment_model.dart';
import 'package:bciweb/payment_gateway/payment_gateway_services/initiate_payment_api_services.dart';
import 'package:bciweb/services/networks/payment_api_services/payment_status_api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constant/constans.dart';
import '../../models/hotel_model/block_room_api_model.dart';
import '../../models/hotel_model/get_hotel_room_model.dart';
import '../../models/hotel_model/hotel_booking_list_model.dart';
import '../../models/hotel_model/hotel_booking_store_data_model.dart';
import '../../models/hotel_model/hotel_info_model.dart';
import '../../models/hotel_model/hotel_search_model.dart';
import '../../models/hotel_model/hoteldestination_model.dart';
import '../../models/hotel_model/store_temp_search_data.dart';
import '../../views/responsive------------------------------------/hottel/Hotel_members.dart';
import '../../services/networks/hotel_api_service/block_room_api_service.dart';
import '../../services/networks/hotel_api_service/get_hotel_room_api_service.dart';
import '../../services/networks/hotel_api_service/get_room_details_api_services.dart';
import '../../services/networks/hotel_api_service/hotel_booking_api_service.dart';
import '../../services/networks/hotel_api_service/hotel_booking_list_api_service.dart';
import '../../services/networks/hotel_api_service/hotel_info_api_service.dart';
import '../../services/networks/hotel_api_service/hoteldestination_api_service.dart';
import '../../services/networks/hotel_api_service/search_hotel_api_service.dart';
import 'package:bciweb/models/hotel_model/get_hotel_room_model.dart' as ht;
import 'package:bciweb/models/hotel_model/hotel_detials_model.dart'
    as htDetails;
import '../../services/networks/hotel_api_service/store_hotel_booking_data_api.dart';
import '../../services/networks/hotel_api_service/successful_screen.dart';
import '../../views/members/bookins/hotels/hotel_search_list.dart';
import '../auth_controller/auth_profile_controller.dart';
import '../profile_controller.dart';

class HotelController extends GetxController {
  HotelDestinationApiService hoteldestinationapiservice =
      HotelDestinationApiService();

  StoreHotelBookingApiServices storeHotelBookingApiServices =
      StoreHotelBookingApiServices();
  RxInt child = 0.obs;
  RxInt adult = 1.obs;
  RxInt roomno = 1.obs;
  RxString cityid = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isPageLoading = false.obs;
  List<SearchCityListModel> getHotelCityList = [];
  TempBookingModel? tempBookingModel;
 RxBool isHotelSearch = false.obs;

hoteldestination({required String searchCity}) async {
    isHotelSearch(true);
    update();
    dio.Response<dynamic> response = await hoteldestinationapiservice
        .hoteldestination(city: searchCity.trim());
    isHotelSearch(false);
    update();
    if (response.statusCode == 200) {
      getHotelCityList = List<SearchCityListModel>.from(
          response.data.map((x) => SearchCityListModel.fromJson(x)));
      print("---------------->>${getHotelCityList.length}");
      update();
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          "something went wrong ${response.statusCode}",
          style: primaryFont.copyWith(color: Colors.white),
        ),
      );
    }
    update();
  }
  // hoteldestination({required String city}) async {
  //    isHotelSearch(true);
  //    update();
  //   dio.Response<dynamic> response =
  //       await hoteldestinationapiservice.hoteldestination(city: city.trim());
  //   isHotelSearch(false);
  //   update();
  //   if (response.statusCode == 200) {
  //     getHotelCityList = List<SearchCityListModel>.from(
  //         response.data.map((x) => SearchCityListModel.fromJson(x)));
  //     print(":::::::::length of the list::::::::::::");
  //     print(getHotelCityList.length);
  //     update();
  //   } else {
  //     Get.rawSnackbar(
  //       backgroundColor: Colors.red,
  //       messageText: Text(
  //         "something went wrong ${response.statusCode}",
  //         style: primaryFont.copyWith(color: Colors.white),
  //       ),
  //     );
  //   }
  //   update();
  // }

  // hotel search

  SearchHotelApiService searchhotelapiservice = SearchHotelApiService();

  RxString hotelSearchKey = "".obs;
  RxString hotelSearchKeyCode = "".obs;
  List<SearchHotelData> searchHotelData = [];
   List<SearchHotelData> tempSearchHotelData = [];
  searchHotel({
    required String destination,
    required String countryCode,
    required int child,
    required int adult,
    required String checkindate,
    required String checkoutdate,
    required String roomsno,
    required bool isMobile
  }) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await searchhotelapiservice.searchhotelapiservice(
            checkindate: checkindate,
            destination: destination,
            countryCode: countryCode,
            checkoutdate: checkoutdate,
            adult: adult,
            child: child,
            roomsno: roomsno);
    isLoading(false);
    if (response.data["Error"]["ErrorCode"] == 0) {
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      await prefs.setString("searchtoken", response.data["Search_Token"]);
      SearchHotelModel searchHotelModel =
          SearchHotelModel.fromJson(response.data);
      searchHotelData = searchHotelModel.result;
    tempSearchHotelData = searchHotelModel.result;

      if(isMobile==true){
           Get.to(HotelListScreen());
          
      }else{
           Get.to(HotelSearchList(
        adult: adult, 
        checkindate: checkindate, 
        checkoutdate:checkoutdate, 
        countryCode: countryCode,
      destination: destination,
      roomsno: roomsno,
      child: child,));
      print(response.data);
      update();
      }
      if (response.data["Error_Code"] == "0001") {
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "No hotel availbale for the given city Names.",
            style: primaryFont.copyWith(color: Colors.white),
          ),
        );
      
      }
    }

//  void hotelCityList({required String searchCity}) {}
  }

//get hotel room

  GetHotelRoomApiServices hotelroomsApiServices = GetHotelRoomApiServices();
  List<HotelRoomData> hotelRoomsData = [];

  getHotelRoomApiServices({
    required String userIp,
    required String resultIndex,
    required String hotelCode,
    required String searchToken,
  }) async {
    hotelRoomsData.clear();
    dio.Response<dynamic> response =
        await hotelroomsApiServices.getHotelRoomApiServices(
            userIp: userIp,
            resultIndex: resultIndex,
            hotelCode: hotelCode,
            searchToken: searchToken);

    if (response.statusCode == 200) {
      GetHotelRoomModel hotelRoomsModel =
          GetHotelRoomModel.fromJson(response.data);
      hotelRoomsData.add(hotelRoomsModel.result);
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       "something went wrong",
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
    update();
  }

  //hotel info
  HotelInfoApiServices hotelInfoApiServices = HotelInfoApiServices();
  List<HotelInfoData> hotelInfoData = [];

  hotelInfo({
    required String userIp,
    required String resultIndex,
    required String hotelCode,
    required String searchToken,
  }) async {
    hotelInfoData.clear();

    dio.Response<dynamic> response =
        await hotelInfoApiServices.hotelInfoApiServices(
            userIp: userIp,
            resultIndex: resultIndex,
            hotelCode: hotelCode,
            searchToken: searchToken);

    if (response.statusCode == 200) {
      HotelInfoModel hotelInfoModel = HotelInfoModel.fromJson(response.data);
      hotelInfoData.add(hotelInfoModel.result);
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       "something went wrong",
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
    update();
  }

  //block room

  BlockRoomApiService blockroomapiservice = BlockRoomApiService();
  
 List<Result> blockroomdata = [];
  blockroomapi(
      {required String userIp,
      required String resultIndex,
      required String hotelCode,
      required String hotelName,
      required String searchToken,
      required HotelInfoData hotelInfoData,
      required ht.HotelRoomsDetail hotelRoomsDetail}) async {
    isLoading(true);
    hotelRoomsData.clear();
    dio.Response<dynamic> response =
        await blockroomapiservice.blockRoomApiService(
            hotelCode: hotelCode,
            hotelName: hotelName,
            hotelRoomsDetail: hotelRoomsDetail,
            resultIndex: resultIndex,
            searchToken: searchToken,
            userIp: userIp);
    if (response.statusCode == 200) {
      // BlockRoomApiModel blockroommodel =
      //     BlockRoomApiModel.fromJson(response.data);
      // blockroomdata.add(blockroommodel.result);
      hotelbookingapi(
        hotelCode: hotelCode,
        hotelName: hotelName,
        hotelRoomsDetail: hotelRoomsDetail,
        hotelInfoData: hotelInfoData,
        resultIndex: resultIndex,
        searchToken: searchToken,
        userIp: userIp,
      );
    } else {
      isLoading(false);
      // Get.rawSnackbar(
      //   backgroundColor: Colors.red,
      //   messageText: Text(
      //     "something went wrong",
      //     style: primaryFont.copyWith(color: Colors.white),
      //   ),
      // );
    }
    update();
  }

  //hotel booking

  HotelBookingApiServices hotelbookingapiservice = HotelBookingApiServices();

  hotelbookingapi(
      {required String userIp,
      required String resultIndex,
      required String hotelCode,
      required String hotelName,
      required String searchToken,
      required HotelInfoData hotelInfoData,
      required ht.HotelRoomsDetail hotelRoomsDetail}) async {
    final profileController = Get.find<AuthProfileController>();

    dio.Response<dynamic> response =
        await hotelbookingapiservice.hotelBookingApiServices(
            hotelCode: hotelCode,
            hotelName: hotelName,
            hotelRoomsDetail:hotelRoomsDetail,
            resultIndex: resultIndex,
            searchToken: searchToken,
            emailId: profileController.profileData.first.email,
            userName: profileController.profileData.first.name,
            mobileNumber: profileController.profileData.first.mobile,
            pancard: profileController.profileData.first.panNo,
            userIp: userIp);
    isLoading(false);
    if (response.statusCode == 200) {
      if (response.data["Error"]["ErrorCode"] == 0) {
        // success page
        final profileController = Get.find<AuthProfileController>();
        print(response.statusMessage);
        print(
            "<<---------------------------before booking model-------------------------------->>");
        print(tempBookingModel);
        print(response);
        HotelBookingStroreData hotelBookingStroreData = HotelBookingStroreData(
            bookingDate: tempBookingModel!.bookingDate,
            bookingId: response.data["Result"]["BookingId"].toString(),
            bookingRefNo: response.data["Result"]["BookingRefNo"].toString(),
            confirmationNo:
                response.data["Result"]["ConfirmationNo"].toString(),
            hotelBookingStatus:
                response.data["Result"]["HotelBookingStatus"].toString(),
            isCancelPolicyChanged: response.data["Result"]
                    ["IsCancellationPolicyChanged"]
                .toString(),
            isPriceChanged:
                response.data["Result"]["IsPriceChanged"].toString(),
            noOfDays: tempBookingModel!.noOfDays,
            noOfPeople: tempBookingModel!.noOfPeople,
            place: tempBookingModel!.place,
            userId: profileController.profileData.first.id.toString(),
            hotelContact: hotelInfoData.hotelContactNo.toString(),
            hotelImage: hotelInfoData.images.first,
            hotelName: hotelInfoData.hotelName,
            price: hotelRoomsDetail.dayRates.first.amount.toString(),
            userName: profileController.profileData.first.name.toString());
        print(
            "<<----------------After booking model------------------------>>");
        storeHotlBookingData(hotelBookingStoreData: hotelBookingStroreData);
        print(
            "<<----------------after storing model------------------------>>");
            print(response.statusMessage);

        Get.off(() => const SucssesFullsceen());
      } else {
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            messageText: Text(
              response.data["Error"]["ErrorMessage"],
              style: primaryFont.copyWith(color: Colors.white),
            ));
      }
    } else {
      // Get.rawSnackbar(
      //   backgroundColor: Colors.red,
      //   messageText: Text(
      //     "something went wrong",
      //     style: primaryFont.copyWith(color: Colors.white),
      //   ),
      // );
    }
    update();
  }

  storeHotlBookingData(
      {required HotelBookingStroreData hotelBookingStoreData}) async {
    dio.Response<dynamic> response = await storeHotelBookingApiServices
        .storeHotelBooking(hotelBookingStoreData: hotelBookingStoreData);

    if (response.statusCode == 200) {}
  }

  //get hotel booking list
  HotelBookingListApiServices hotelBookingListApiServices =
      HotelBookingListApiServices();
  List<BookingList> bookingList = [];

  hotelBookingList() async {
    dio.Response<dynamic> response =
        await hotelBookingListApiServices.hotelBookingListApiServices();
    if (response.statusCode == 200) {
      HotelBookingListModel hotelBookingListModel =
          HotelBookingListModel.fromJson(response.data);
      bookingList = hotelBookingListModel.bookingList;
    } else {
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       "something went wrong",
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
    update();
  }

  GetHotelRoomDetailsApiServices getHotelRoomDetailsApiServices =
      GetHotelRoomDetailsApiServices();
  getHotelDetails(String bookingId) async {
    htDetails.Result? result;
    print(bookingId);
    print('-------------------1111111111111111111111-----------------------');
    dio.Response<dynamic> response = await getHotelRoomDetailsApiServices
        .getHotelRoomDetailsApiServices(userIp: "", bookingId: bookingId);
    print(
        '------------------------------222222222222222222222------------------------------');

    if (response.statusCode == 200) {
      htDetails.HotelBookingDetailModel hotelBookingDetailModel =
          htDetails.HotelBookingDetailModel.fromJson(response.data);
      result = hotelBookingDetailModel.result;
      print(
          '----------------------------33333333333333333333333333---------------------------------------');
    }
    return result;
  }

 
       InitiatePaymentApiServices initiatePaymentApiServices 
        = InitiatePaymentApiServices();

    initiatePayment(
      {
      required double amount,
      required String userIp,
      required String resultIndex,
      required String hotelCode,
      required String hotelName,
      required String searchToken,
      required HotelInfoData hotelInfoData,
      required ht.HotelRoomsDetail hotelRoomsDetail,
  }) async {
    print('------------------------------------------------1111111');
    await Get.find<AuthProfileController>().getProfile();
    print('${Get.find<AuthProfileController>().profileData}');
    dio.Response<dynamic> response =
        await initiatePaymentApiServices.initiatePayment(
            userId: Get.find<AuthProfileController>().profileData.first.id,
            totalAmount: amount.toString(),
            status: "Bus");
    print('---------------------------2222222222');
    if (response.statusCode == 200) {
      IninitiatePaymentModel ininitiatePaymentModel =
          IninitiatePaymentModel.fromJson(response.data);

      await launchUrl(Uri.parse(
          ininitiatePaymentModel.data.instrumentResponse.redirectInfo.url));
      //st
      // startTimer(
      //   ininitiatePaymentModel.data.merchantTransactionId,
      //   amount,
      //   hotelCode,
      //   hotelName,
      //   hotelInfoData,
      //   searchToken,
      //   resultIndex,
      //   hotelRoomsDetail.
        
        
        
     
      // );
      print("Payment is over ------------>>");
    }
  }
  Timer? tempTimer;
  startTimer(var  refernceID,
        var amount,
      var userIp,
      var resultIndex,
      var  hotelCode,
      var  hotelName,
      var  searchToken,
       HotelInfoData hotelInfoData,
       ht.HotelRoomsDetail hotelRoomsDetail ) {
    print(":::::::::_________________payment strated---------------");
    tempTimer = Timer.periodic(const Duration(seconds: 6), (timer) async {
      print("timer working ...");
      int status = await Get.find<HotelController>().checkPhonePeStatus(
          refernceID: refernceID,
          amount: amount,
          userIp: userIp, 
          resultIndex: resultIndex, 
          hotelCode: hotelCode, 
          hotelName: hotelName,
           searchToken: searchToken, 
           hotelInfoData: hotelInfoData, 
           hotelRoomsDetail: hotelRoomsDetail,
          );

      print(
          "<<<>>><<<>>><<>>><>><><><><1><><1><------cccccc------><1><><><><><><><><><><><><><><>");
      print(status);

      if (status == 1) {
        print("calceld:::::::::::");
        timer.cancel();
      } else if (status == 2) {
        print("calceld:::::::::::");
        timer.cancel();
      }
    });
  }
    PaymentResponseApiServices paymentResponseApiServices =
     PaymentResponseApiServices();

  checkPhonePeStatus(
      {required String refernceID,
      required double amount,
      required String userIp,
      required String resultIndex,
      required String hotelCode,
      required String hotelName,
      required String searchToken,
      required HotelInfoData hotelInfoData,
      required ht.HotelRoomsDetail hotelRoomsDetail
    }) async {

        int paymentId = 0;
    dio.Response<dynamic> response = await paymentResponseApiServices
        .paymentResponseApi(merchantId: refernceID);

    if (response.data["code"] == "PAYMENT_SUCCESS") {
      paymentId = 1;
      print("<<<<<<<<payment is Success>>>>>>>>");
      
      
      blockroomapi(
          userIp: userIp,
          hotelInfoData: hotelInfoData,
          resultIndex: resultIndex,
          hotelCode: hotelCode,
          hotelName: hotelName,
          searchToken: searchToken,
          hotelRoomsDetail: hotelRoomsDetail);
    } 
    else if (response.data["code"] == "PAYMENT_PENDING")
     {
       paymentId = 0; 
      print("<<<<<<<<payment is Failed>>>>>>>>");

      //   Get.to(() => PaymentFailedScreen());
    }
    else
    {
       paymentId = 2; 
    }

    return paymentId;
  }
}
