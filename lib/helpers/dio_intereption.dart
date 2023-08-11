import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


// var endPoints = EndPoints();
var cancelToken = CancelToken();

//BuildContext context = mainContext!;

var dio = Dio(BaseOptions(
  baseUrl: 'https://bci.batechnology.in/api',

  connectTimeout: Duration(milliseconds: 1000000),
  receiveTimeout: Duration(milliseconds: 1000000),

  headers: {
    //  HttpHeaders.userAgentHeader: 'dio',
    //'api': '1.0.0',
    
  },
  contentType: Headers.jsonContentType,
  // Transform the response data to a String encoded with UTF8.
  // The default value is [ResponseType.JSON].
  // responseType: ResponseType.plain,
))
  ..interceptors.add(DioInterceptor());

class DioInterceptor extends Interceptor {
  get mvcColorPrimary => null;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path} trackingg ${DateTime.now()}' );
    // printLongText('URL ' + options.baseUrl);
    // toast(options.baseUrl);
    if(options.data is  Map<String, dynamic>) {
      var postData = options.data! as Map<String, dynamic>; 
      print('postData');
      // printLongText(postData.toString());

    //   if (postData['isAuthRequired'] != null &&
    //       postData['isAuthRequired'] == 'true') {
    //     // options.headers["Authorization"] = loginData?.JwtToken;

    //     // printLongText("auth added " + (loginData!=null?loginData!.JwtToken:"logindata null") + " ---");
    //   } else {
    //     // no authorization required to be added in header.
    //     print("auth not added");
    //   }
    // }else{
    //   print('not a map type data. bypassing auth jwt addition');
    // }

      // if (postData['isAuthRequired'] == 'false') {
      //   //options.baseUrl = 'https://ghopon.com/hopontest/';
      // }



    // Access the query parameters
    if (options.queryParameters != null ) {
      var queryParams = options.queryParameters;
      // Read and process the query parameters as needed
      print('Query Parameters:');
      print(queryParams);
      var auth = 'Bearer ';
      // var token = loginData?.JwtToken;
      // if(token != '' && token != null) {
      //   options.headers["Authorization"] = auth + (token ?? ''); // Use null-aware operator and provide an empty string as fallback
      // }

    

    }

    // printLongText('Option Data');
    // printLongText(options.headers.toString());

    // options.headers["method"] = 'POST';
options.method = "POST";
     print('REQUEST[${options.method}] => PATH: ${options.path} trackingg ${DateTime.now()}' );
    options.headers["Access-Control-Allow-Headers"] = "X-Requested-With";

    //cancelToken.cancel('Cancelled');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
        print('response Data ${response.realUri} trackingg ${DateTime.now()}');
        // printLongText('response Data ${response.data}');
    BuildContext serviceContext;
    

    try {
      var data = response.data as Map<String, dynamic>;
      // var responseData = ApiResponseModel(data);
      response.data = data;
    } on Exception catch (e) {
       print('The provided string is not valid JSON');
      //CommonLoader.showLoader(context, false);
      // var responseData = ApiResponseModel.StringResponse(response.data);
      // response.data = data;
        print('The provided string is not valid JSON');

    }

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.type == DioErrorType.cancel) {
      print('Request cancel by dio');
    } else {
      //print( 'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}', );
      // CommonLoader.showLoader(context, false);
      // toast("Server Error. Please try again later");
      return super.onError(err, handler);
    }
  }
}}