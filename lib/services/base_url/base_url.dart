abstract class BaseApiService {
  final String registerURl =
      'https://bci.generation360tech.in/api/register_user';

  //login url
  final String getOtpUrl = 
  "https://bci.generation360tech.in/api/get_otp";
  //login url
  final String loginURL =
   "https://bci.generation360tech.in/api/login";

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
   final String addSubscriptionPlan='https://bci.generation360tech.in/api/auth/add_subscription_plan';

   //Get Coupons
   final  String getCoupons='https://bci.generation360tech.in/api/auth/getUserCoupons';
    
    //Get  OtherBooking
   final String getothersBooking='https://bci.generation360tech.in/api/auth/booking_list';

     final String addToCartApiUrl =
   'https://bci.generation360tech.in/api/auth/addtocart';

  final String CartListApiUrl = 'https://bci.generation360tech.in/api/auth/cartlists';

  //delete cart
  final String deleteCartApiUrl = "https://bci.generation360tech.in/api/auth/deletecart";

    //add booking api
  final String addBookingApiUrl = "https://bci.generation360tech.in/api/auth/addbooking";





    //coupons redeem api
  final String redeemCouponsApiUrl = "https://bci.generation360tech.in/api/auth/redeemCoupon";
}

