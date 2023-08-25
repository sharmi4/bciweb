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
      "https://bci.batechnology.in/api/profile";



  //profile update API URL
  final String profileUpdateURL =
      "https://bci.batechnology.in/api/profile_update";



  final String serviceListurl =
      'https://bci.batechnology.in/api/service_list';



  //Get plan list
  final String getPlanList =
      "https://bci.batechnology.in/api/get_plan_list";



  //Get payment
  final String addSubscriptionPlan =
      'https://bci.batechnology.in/api/add_subscription_plan';



  //Get Coupons
  final String getCoupons =
      'https://bci.batechnology.in/api/getUserCoupons';



  //Get  OtherBooking
  final String getothersBooking =
      'https://bci.batechnology.in/api/booking_list';



  final String addToCartApiUrl =
      'https://bci.batechnology.in/api/addtocart';



  final String CartListApiUrl =
      'https://bci.batechnology.in/api/cartlists';



  //delete cart
  final String deleteCartApiUrl =
      "https://bci.batechnology.in/api/deletecart";



  //add booking api
  final String addBookingApiUrl =
      "https://bci.batechnology.in/api/addbooking";



  //offers api
  final String todayoffersApiUrl =
      "https://bci.batechnology.in/api/today_offers_list";



  //coupons redeem api
  final String redeemCouponsApiUrl =
      "https://bci.batechnology.in/api/redeemCoupon";



  //get plan detsila
  final String getPlanDetailsURL =
      "https://bci.batechnology.in/api/get_plan_details";

      

  // un reddem coupon api
  final String unRedeemCouponsApiUrl =
      "https://bci.batechnology.in/api/redeemCoupon";

  // ----------- Flight bookings  ----------- //

  final String airSearchUrl =
      "https://bci.batechnology.in/api/flight_search";

  final String airportSearch =
   "https://openflights.org/php/apsearch.php";

  //----------- holidays bookings ---------------//


    final String getEnquiryListApiUrl =
      "https://bci.batechnology.in/api/get_enquiry";

  final String getPackageCategoryApiUrl =
      "https://bci.batechnology.in/api/get_package_category";

  final String getPackageListApiUrl =
      "https://bci.batechnology.in/api/get_package_list";

  final String getPackageDetailsApiUrl =
      "https://bci.batechnology.in/api/get_package_details";

  final String createEnquiryApiUrl =
      "https://bci.batechnology.in/api/create_enquiry";

  final String searchPackageListApiUrl =
      "https://bci.batechnology.in/api/search_packages";

//busbooking 

  final String getCityListApiUrl =
      "https://bci.batechnology.in/api/Bus_CityList";

   final String searchBusApiUrl =
      "https://bci.batechnology.in/api/Bus_Search";

   final String busSeatMapApiUrl =
      "https://bci.batechnology.in/api/bus_seat_map";

   final String busTempBooking =
      "https://bci.batechnology.in/api/bus_temp_booking";

   final String busTicketing =
      "https://bci.batechnology.in/api/bus_ticketing";

   final String busRequiryURL = "https://bci.batechnology.in/api/bus_requery";

  final String addBusBookingHistoryURL =
      "https://bci.batechnology.in/api/add_bus_booking_history";
        final String airAddPayment =
      "https://bci.batechnology.in/api/add_payment";

  final String getBusBookingHistoryURL =
      "https://bci.batechnology.in/api/get_bus_booking_history";

    //get wallet details
  final String getWalletDetailsApiUrl = "https://bci.batechnology.in/api/getUserwallet";
// final String testURL = "https://bci.batechnology.in.net/api/sub_category";


  //https://bci.batechnology.in/api
   final String generateReferralCodeApiUrl =
      "https://bci.batechnology.in/api/generateReferralCode";

     final String recomendedListApiUrl =
      "https://bci.batechnology.in/api/recomended_list";  
       
      final String ourPartnersApiUrl =
      "https://bci.batechnology.in/api/getpartners";  

       final String createSupportApiUrl =
      "https://bci.batechnology.in/api/create_ticket";

        final String registerreferalURL =
      "https://bci.batechnology.in/api/generateReferralregister";


//flight history
  final String getFlightBookingHistoryURL =
      "https://bci.batechnology.in/api/get_flight_booking_history";

      //updated 10-8-23
     
   //hotelbooking
   final String hoteldestinationURL = 'https://bci.batechnology.in/api/destination_list';  

     //fcmtoken
   final String fcmtokenURL = 'https://bci.batechnology.in/api/fcm-token';  
}
