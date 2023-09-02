import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/constans.dart';
import '../../models/hotel_model/get_hotel_room_model.dart';
import '../../models/hotel_model/hotel_info_model.dart';
import '../../models/hotel_model/hotel_search_model.dart';
import '../../models/hotel_model/hoteldestination_model.dart';
import '../../services/networks/hotel_api_service/get_hotel_room_api_service.dart';
import '../../services/networks/hotel_api_service/hotel_info_api_service.dart';
import '../../services/networks/hotel_api_service/hoteldestination_api_service.dart';
import '../../services/networks/hotel_api_service/search_hotel_api_service.dart';

class HotelController extends GetxController {
  HotelDestinationApiService hoteldestinationapiservice =
      HotelDestinationApiService();
  RxInt child = 0.obs;
  RxInt adult = 1.obs;
  RxInt roomno = 1.obs;
  RxString cityid = ''.obs;
  RxBool isLoading = false.obs;
  List<SearchCityListModel> getHotelCityList = [];

  hoteldestination({required String city}) async {
    dio.Response<dynamic> response =
        await hoteldestinationapiservice.hoteldestination(city: city.trim());

    if (response.statusCode == 200) {
      getHotelCityList = List<SearchCityListModel>.from(
          response.data.map((x) => SearchCityListModel.fromJson(x)));
      print(":::::::::length of the list::::::::::::");
      print(getHotelCityList.length);
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

  // hotel search

  SearchHotelApiService searchhotelapiservice = SearchHotelApiService();

  RxString hotelSearchKey = "".obs;
  RxString hotelSearchKeyCode = "".obs;
  List<SearchHotelData> searchHotelData = [];
  searchHotel({
    required String destination,
    required String countryCode,
    required int child,
    required int adult,
    required String checkindate,
    required String checkoutdate,
    required String roomsno,
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
      await prefs.setString("searchtoken", response.data["Search_Token"]);
      SearchHotelModel searchHotelModel =
          SearchHotelModel.fromJson(response.data);
      searchHotelData = searchHotelModel.result;
      // Get.to(HotelListScreen());

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
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
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
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    update();
  }
}
