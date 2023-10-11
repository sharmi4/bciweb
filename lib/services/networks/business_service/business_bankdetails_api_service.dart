import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/business_model/business_updatebank_details_model.dart';
import '../../base_url/base_url.dart';

class UpdateBankApiServices extends BaseApiService {
  Future updateBank({
    required UpdateBankModel merchantUpdateModel,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      FormData formData = FormData.fromMap({
        "bank_name": merchantUpdateModel.bankName,
        "bank_account_name": merchantUpdateModel.bankAccountName,
        "account_type": merchantUpdateModel.accountType,
        "bank_account_number": merchantUpdateModel.bankAccountNumber,
        "ifsc_code": merchantUpdateModel.ifscCode,
      });

      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(profileUpdateURL,
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      print("::::::::<profile bank update URL>::::::::status code::::::::::");
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
