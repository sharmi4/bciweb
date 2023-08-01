abstract class BaseApiService {
  final String registerURl =
      'https://bci.generation360tech.in/api/register_user';

  //login url
  final String getOtpUrl = "https://bci.generation360tech.in/api/get_otp";
  //login url
  final String loginURL = "https://bci.generation360tech.in/api/login";

  //get profile api
  final String getProfileURL =
      "https://bci.generation360tech.in/api/auth/profile";

  //profile update API URL
  final String profileUpdateURL =
      "https://bci.generation360tech.in/api/auth/profile_update";

  final String serviceListurl =
      'https://bci.generation360tech.in/api/auth/service_list';

  //Get plan list
  final String getPlanList =
      "https://bci.generation360tech.in/api/auth/get_plan_list";

  //Get payment
  final String addSubscriptionPlan =
      'https://bci.generation360tech.in/api/auth/add_subscription_plan';

  //Get Coupons
  final String getCoupons =
      'https://bci.generation360tech.in/api/auth/getUserCoupons';

  //Get  OtherBooking
  final String getothersBooking =
      'https://bci.generation360tech.in/api/auth/booking_list';

  final String addToCartApiUrl =
      'https://bci.generation360tech.in/api/auth/addtocart';

  final String CartListApiUrl =
      'https://bci.generation360tech.in/api/auth/cartlists';

  //delete cart
  final String deleteCartApiUrl =
      "https://bci.generation360tech.in/api/auth/deletecart";

  //add booking api
  final String addBookingApiUrl =
      "https://bci.generation360tech.in/api/auth/addbooking";

  //offers api
  final String todayoffersApiUrl =
      "https://bci.generation360tech.in/api/auth/today_offers_list";

  //coupons redeem api
  final String redeemCouponsApiUrl =
      "https://bci.generation360tech.in/api/auth/redeemCoupon";

  //get plan detsila
  final String getPlanDetailsURL =
      "https://bci.generation360tech.in/api/auth/get_plan_details";

  // un reddem coupon api
  final String unRedeemCouponsApiUrl =
      "https://bci.generation360tech.in/api/auth/redeemCoupon";

  // ----------- Flight bookings  ----------- //

  final String airSearchUrl =
      "https://bci.generation360tech.in/api/auth/flight_search";

  final String airportSearch =
   "https://openflights.org/php/apsearch.php";

  //----------- holidays bookings ---------------//

  final String getPackageCategoryApiUrl =
      "https://bci.generation360tech.in/api/auth/get_package_category";

  final String getPackageListApiUrl =
      "https://bci.generation360tech.in/api/auth/get_package_list";

  final String getPackageDetailsApiUrl =
      "https://bci.generation360tech.in/api/auth/get_package_details";

  final String createEnquiryApiUrl =
      "https://bci.generation360tech.in/api/auth/create_enquiry";

  final String searchPackageListApiUrl =
      "https://bci.generation360tech.in/api/auth/search_packages";



  final String getCityListApiUrl =
      "https://bci.generation360tech.in/api/auth/Bus_CityList";

   final String searchBusApiUrl =
      "https://bci.generation360tech.in/api/auth/Bus_Search";

   final String busSeatMapApiUrl =
      "https://bci.generation360tech.in/api/auth/bus_seat_map";

   final String busTempBooking =
      "https://bci.generation360tech.in/api/auth/bus_temp_booking";

   final String busTicketing =
      "https://bci.generation360tech.in/api/auth/bus_ticketing";

   final String busRequiryURL = "https://bci.generation360tech.in/api/auth/bus_requery";

    //get wallet details
  final String getWalletDetailsApiUrl = "https://bci.generation360tech.in/api/auth/getUserwallet";
// final String testURL = "https://bci.batechnology.in.net/api/sub_category";

//  //get wallet details
//   final String getWalletDetailsApiUrl = "https://bci.generation360tech.in/api/auth/getUserwallet";

}
