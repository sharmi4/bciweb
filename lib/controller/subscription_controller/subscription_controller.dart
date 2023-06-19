import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../models/get_plansmodel.dart';
import '../../services/networks/subscription/get_planlist_api_service.dart';

class SubscriptionController extends GetxController{
   GetPlansApiServices getPlansApiServices = GetPlansApiServices();

    List<PlansData> plansdataList = [];
     getplansList() async {
    dio.Response<dynamic> response = await getPlansApiServices.getPlans();
    if (response.statusCode == 200) {
      PlansModel plansModel = PlansModel.fromJson(response.data);
      plansdataList = plansModel.data;
    }
    update();
  }
}