abstract class BaseApiService {


  final String registerURl =
      'https://bci.batechnology.in/api/register_user';

  //category
  final String categoryApiUrl = "https://bci.batechnology.in/api/category";

  //login url
  // final String getOtpUrl = "https://bci.batechnology.in/api/category";
  final String getOtpUrl = "https://bci.batechnology.in/api/get_otp";



  //login url[i]
  final String loginURL = "https://bci.batechnology.in/api/login";


  //get profile api
  final String getProfileURL =
      "https://bci.batechnology.in/api/auth/profile";



  //profile update API URL
  final String profileUpdateURL =
      "https://bci.batechnology.in/api/auth/profile_update";



  final String serviceListurl =
      'https://bci.batechnology.in/api/auth/service_list';



  //Get plan list
  final String getPlanList =
      "https://bci.batechnology.in/api/auth/get_plan_list";



  //Get payment
  final String addSubscriptionPlan =
      'https://bci.batechnology.in/api/auth/add_subscription_plan';



  //Get Coupons
  final String getCoupons =
      'https://bci.batechnology.in/api/auth/getUserCoupons';



  //Get  OtherBooking
  final String getothersBooking =
      'https://bci.batechnology.in/api/auth/booking_list';



  final String addToCartApiUrl =
      'https://bci.batechnology.in/api/auth/addtocart';



  final String CartListApiUrl =
      'https://bci.batechnology.in/api/auth/cartlists';



  //delete cart
  final String deleteCartApiUrl =
      "https://bci.batechnology.in/api/auth/deletecart";



  //add booking api
  final String addBookingApiUrl =
      "https://bci.batechnology.in/api/auth/addbooking";



  //offers api
  final String todayoffersApiUrl =
      "https://bci.batechnology.in/api/auth/today_offers_list";



  //coupons redeem api
  final String redeemCouponsApiUrl =
      "https://bci.batechnology.in/api/auth/redeemCoupon";



  //get plan detsila
  final String getPlanDetailsURL =
      "https://bci.batechnology.in/api/auth/get_plan_details";

      

  // un reddem coupon api
  final String unRedeemCouponsApiUrl =
      "https://bci.batechnology.in/api/auth/redeemCoupon";

  // ----------- Flight bookings  ----------- //

  final String airSearchUrl =
      "https://bci.batechnology.in/api/auth/flight_search";

  final String airportSearch =
   "https://openflights.org/php/apsearch.php";

  //----------- holidays bookings ---------------//


    final String getEnquiryListApiUrl =
      "https://bci.batechnology.in/api/auth/get_enquiry";

  final String getPackageCategoryApiUrl =
      "https://bci.batechnology.in/api/auth/get_package_category";

  final String getPackageListApiUrl =
      "https://bci.batechnology.in/api/auth/get_package_list";

  final String getPackageDetailsApiUrl =
      "https://bci.batechnology.in/api/auth/get_package_details";

  final String createEnquiryApiUrl =
      "https://bci.batechnology.in/api/auth/create_enquiry";

  final String searchPackageListApiUrl =
      "https://bci.batechnology.in/api/auth/search_packages";

//busbooking 

  final String getCityListApiUrl =
      "https://bci.batechnology.in/api/auth/Bus_CityList";

   final String searchBusApiUrl =
      "https://bci.batechnology.in/api/auth/Bus_Search";

   final String busSeatMapApiUrl =
      "https://bci.batechnology.in/api/auth/bus_seat_map";

   final String busTempBooking =
      "https://bci.batechnology.in/api/auth/bus_temp_booking";

   final String busTicketing =
      "https://bci.batechnology.in/api/auth/bus_ticketing";

   final String busRequiryURL = "https://bci.batechnology.in/api/auth/bus_requery";

  final String addBusBookingHistoryURL =
      "https://bci.batechnology.in/api/auth/add_bus_booking_history";
        final String airAddPayment =
      "https://bci.batechnology.in/api/auth/add_payment";

  final String getBusBookingHistoryURL =
      "https://bci.batechnology.in/api/auth/get_bus_booking_history";

    //get wallet details
  final String getWalletDetailsApiUrl = "https://bci.batechnology.in/api/auth/getUserwallet";
// final String testURL = "https://bci.batechnology.in.net/api/sub_category";


  //https://bci.batechnology.in/api
   final String generateReferralCodeApiUrl =
      "https://bci.batechnology.in/api/auth/generateReferralCode";

     final String recomendedListApiUrl =
      "https://bci.batechnology.in/api/auth/recomended_list";  
       
      final String ourPartnersApiUrl =
      "https://bci.batechnology.in/api/auth/getpartners";  

       final String createSupportApiUrl =
      "https://bci.batechnology.in/api/auth/create_ticket";

        final String registerreferalURL =
      "https://bci.batechnology.in/api/auth/generateReferralregister";


//flight history
  final String getFlightBookingHistoryURL =
      "https://bci.batechnology.in/api/auth/get_flight_booking_history";

      //updated 10-8-23
     
   //hotelbooking
   final String hoteldestinationURL = 'https://bci.batechnology.in/api/auth/destination_list';  

     //fcmtoken
   final String fcmtokenURL = 'https://bci.batechnology.in/api/auth/fcm-token';  


   //hotel search
  final String searchHotelApiUrl =
      "https://bci.batechnology.in/api/auth/search_hotels";


        //hotel info
  final String hotelInfoApiUrl =
      "https://bci.batechnology.in/api/auth/hotelinfo";

        //hotel get hotel room
  final String getHotelRoomApiUrl =
      "https://bci.batechnology.in/api/auth/get_hotel_room";

}
