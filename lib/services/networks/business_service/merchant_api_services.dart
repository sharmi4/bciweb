import 'dart:io';
import 'package:dio/dio.dart';

import '../../../models/business_model/merchants_register_model.dart';
import '../../base_url/base_url.dart';

class MerchantRegisterApiServices extends BaseApiService {
  Future merchantRegister({
    required MerchantRegisterModel merchantRegisterModel,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      FormData formData = FormData.fromMap({
        //"subcategory_id": merchantRegisterModel.subcategoryId,
        "name": merchantRegisterModel.name,
        "email": merchantRegisterModel.email,
        "mobile": merchantRegisterModel.mobile,
        "role_id": "5",
      });

      var response = await dio.post(registerURl,
          options: Options(
              headers: {
                'Accept': 'application/json',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      print("::::::::<merchant Register URL>::::::::status code::::::::::");
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
