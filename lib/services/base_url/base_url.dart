abstract class BaseApiService{

  final String registerURl='https://bci.generation360tech.in/api/register_user';

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

  final String serviceListurl='https://bci.generation360tech.in/api/auth/service_list';

       //Get plan list
  final String getPlanList =
      "https://bci.generation360tech.in/api/auth/get_plan_list";

}