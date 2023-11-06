abstract class BaseApiService {
  final String registerURl =
      'https://www.portal.bcipvtltd.com/api/register_user';
  // final String registerURl = 'https://www.portal.bcipvtltd.com/api/register_user';

  //category
  final String categoryApiUrl = "https://www.portal.bcipvtltd.com/api/category";

   //sub category URL
  final String subCategoryURL =
      "https://www.portal.bcipvtltd.com/api/sub_category";

  //login url
  // final String getOtpUrl = "https://www.portal.bcipvtltd.com/api/category";
  final String getOtpUrl = "https://www.portal.bcipvtltd.com/api/get_otp";

  //login url[i]
  final String loginURL = "https://www.portal.bcipvtltd.com/api/login";

  //get profile api
  final String getProfileURL =
      "https://www.portal.bcipvtltd.com/api/auth/profile";

  //profile update API URL
  final String profileUpdateURL =
      "https://www.portal.bcipvtltd.com/api/auth/profile_update";

  final String serviceListurl =
      'https://www.portal.bcipvtltd.com/api/auth/service_list';

  //Get plan list
  final String getPlanList =
      "https://www.portal.bcipvtltd.com/api/auth/get_plan_list";

  //Get payment
  final String addSubscriptionPlan =
      'https://www.portal.bcipvtltd.com/api/auth/add_subscription_plan';

  //Get Coupons
  final String getCoupons =
      'https://www.portal.bcipvtltd.com/api/auth/getUserCoupons';

  //Get  OtherBooking
  final String getothersBooking =
      'https://www.portal.bcipvtltd.com/api/auth/booking_list';

  final String addToCartApiUrl =
      'https://www.portal.bcipvtltd.com/api/auth/addtocart';

  final String CartListApiUrl =
      'https://www.portal.bcipvtltd.com/api/auth/cartlists';

  //delete cart
  final String deleteCartApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/deletecart";

  //add booking api
  final String addBookingApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/addbooking";

  //offers api
  final String todayOffersListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/today_offers_list";

  //coupons redeem api
  final String redeemCouponsApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/redeemCoupon";

  //get plan detsila
  final String getPlanDetailsURL =
      "https://www.portal.bcipvtltd.com/api/auth/get_plan_details";

  // un reddem coupon api
  final String unRedeemCouponsApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/redeemCoupon";

  // ----------- Flight bookings  ----------- //

  final String airSearchUrl =
      "https://www.portal.bcipvtltd.com/api/auth/flight_search";

  final String airportSearch = "https://www.portal.bcipvtltd.com/api/flight_city_search";
  
  final String airCancelApiURL =
      "https://www.portal.bcipvtltd.com/api/auth/air_ticket_cancellation";

    final String airGetSsrURL =
      "https://www.portal.bcipvtltd.com/api/auth/air_get_ssr";

       final String airGetSeatMap =
      "https://www.portal.bcipvtltd.com/api/auth/air_get_seat_map";
      
        final String airRepricingUrl =
      "https://www.portal.bcipvtltd.com/api/auth/air_reprice";

  //----------- holidays bookings ---------------//

  final String getEnquiryListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/get_enquiry";

  final String getPackageCategoryApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/get_package_category";

  final String getPackageListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/get_package_list";

  final String getPackageDetailsApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/get_package_details";

  final String createEnquiryApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/create_enquiry";

  final String searchPackageListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/search_packages";

//busbooking

  final String getCityListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/Bus_CityList";

  final String searchBusApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/Bus_Search";

  final String busSeatMapApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/bus_seat_map";

  final String busTempBooking =
      "https://www.portal.bcipvtltd.com/api/auth/bus_temp_booking";

  final String busTicketing =
      "https://www.portal.bcipvtltd.com/api/auth/bus_ticketing";

  final String busRequiryURL =
      "https://www.portal.bcipvtltd.com/api/auth/bus_requery";

  final String addBusBookingHistoryURL =
      "https://www.portal.bcipvtltd.com/api/auth/add_bus_booking_history";
  final String airAddPayment =
      "https://www.portal.bcipvtltd.com/api/auth/add_payment"; 

  final String getBusBookingHistoryURL =
      "https://www.portal.bcipvtltd.com/api/auth/get_bus_booking_history";

  //get wallet details
  final String getWalletDetailsApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/getUserwallet";
// final String testURL = "https://www.portal.bcipvtltd.com.net/api/sub_category";

  //https://www.portal.bcipvtltd.com/api
  final String generateReferralCodeApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/generateReferralCode";

  final String recomendedListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/recomended_list";

  final String ourPartnersApiUrl =
      "https://www.portal.bcipvtltd.com/api/getpartners";
  // "https://www.portal.bcipvtltd.com/api/auth/getpartners";

  final String createSupportApiUrl =
  "https://www.portal.bcipvtltd.com/api/get/app/support/details";
     // "https://www.portal.bcipvtltd.com/api/auth/create_ticket";

  final String registerreferalURL =
      "https://www.portal.bcipvtltd.com/api/auth/generateReferralregister";

//flight history
  final String getFlightBookingHistoryURL =
      "https://www.portal.bcipvtltd.com/api/auth/get_flight_booking_history";

  //updated 10-8-23

  //hotelbooking
  final String hoteldestinationURL =
      'https://www.portal.bcipvtltd.com/api/auth/destination_list';

  //fcmtoken
  final String fcmtokenURL =
      'https://www.portal.bcipvtltd.com/api/auth/fcm-token';

  //hotel search
  final String searchHotelApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/search_hotels";

  //hotel info
  final String hotelInfoApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/hotelinfo";

  //hotel get hotel room
  final String getHotelRoomApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/get_hotel_room";

  //block room api
  final blockRoomApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/block_room";

  final String storeHotelBookingURL =
      "https://www.portal.bcipvtltd.com/api/auth/store_hotel_booking";

  //hotel booking api
  final String hotelBookingApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/hotel_booking";

  //hotel booking list
  final String hotelBookinglistApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/list_hotel_booking";

  final String hotelBookingDetailsURL =
      "https://www.portal.bcipvtltd.com/api/auth/get_booking_detail";

  //"https://www.portal.bcipvtltd.com/api/auth/get_booking_detail";

  final String airRePrinting =
      "https://www.portal.bcipvtltd.com/api/auth/air_reprint";

  //add transaction
  final String addTransactionApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/add_transaction";

  //get transaction history
  final String transactionHistoryApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/transaction_history";

       // add today offers
  final String addCouponsURL =
      "https://www.portal.bcipvtltd.com/api/auth/vendor_coupon";
        // add today offers
  final String addedCouponListURL =
      "https://www.portal.bcipvtltd.com/api/auth/vendor_coupon_list";

  //vendor list
  final String vendorListURL =
      "https://www.portal.bcipvtltd.com/api/auth/vendor_list";

  //get gallery
  final String getGalleryURI =
      "https://www.portal.bcipvtltd.com/api/auth/get_gallery";

  //support admin details 
  final String supportAdminDetailsApiUrl = "https://portal.bcipvtltd.com/api/get/app/support/details"; 

   //vendor redeemption coupons
  final String redeemprtionCouponsApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/vedorRedeemCoupons";   

   //Add services
  final String addServicesURL =
      "https://www.portal.bcipvtltd.com/api/auth/merchant_create_service";  

       // add today offers
  final String addTodayOffersApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/merchant_offers";  

     //vendor offer list
  final String vendorOfferListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/vendor_offers_list";
       //withdraw amount
  final String withdrawAmountURL =
      "https://www.portal.bcipvtltd.com/api/auth/withdraw_wallet";   

     //get booking list
  final String bookingListApiUrl =
      "https://www.portal.bcipvtltd.com/api/auth/vendor_booking_list";
      
      //add gallery
  final String addGallery =
      "https://www.portal.bcipvtltd.com/api/auth/user_gallery";   
    //  "https://www.portal.bcipvtltd.com/api/auth/vendor_offers_list"; 


 final String deleteUserURL =
  "https://portal.bcipvtltd.com/api/auth/delete_user";  



  //Get notification_list
  final String notificationlistURL =
      "https://www.portal.bcipvtltd.com/api/auth/notification_list";


    //get Services
  final String getServicesURL =
      "https://www.portal.bcipvtltd.com/api/auth/service_list";

    // final String deleteUserURL = "https://portal.bcipvtltd.com/api/auth/delete_user"; 
    
  //support admin details
  final String paymentInitiateURL =
      "https://www.portal.bcipvtltd.com/api/pay_phonepay";

  //plan check api url
  final String paymentStatusURL =
      "https://www.portal.bcipvtltd.com/api/checkPaymentStatus";

  //add subscription plan
  final String addPlanUrl =
      "https://www.portal.bcipvtltd.com/api/auth/add_subscription_plan";



      //get profilebusines api
  final String getbusinesProfileURL =
      "https://www.portal.bcipvtltd.com/api/auth/profile";

  //merchant service category 
  final String getMerchantCaregoryURL = "https://www.portal.bcipvtltd.com/api/auth/merchant_service_category";

}
