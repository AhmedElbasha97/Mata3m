import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:get_storage/get_storage.dart';
import 'package:mata3m/utils/services/app_routes.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../translation_key.dart';

class ApiService extends GetxService {
  static final ApiService _apiUtil = ApiService._();
  ApiService._() {
    init();
  }
  factory ApiService() {
    return _apiUtil;
  }

  Dio dio = new Dio();

  void init() {
    dio.options.baseUrl = "https://mata3m-7e2be-default-rtdb.firebaseio.com";
    dio.options.connectTimeout = Duration(seconds: 6000);
    dio.options.receiveTimeout = Duration(seconds: 6000);
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
  }

  Future<dynamic> request<T>(
    String endPoint,
    String method, {
    dynamic data,
    Map<String, dynamic>? queryParamters,
    String contentType = "application/json",
    Function(String errorMsg)? errorDialog,
    Function(String? successMsg)? onSuccess,
    Function(String errorMsg)? errorMessage,
  }) async {
    print("https://mata3m-7e2be-default-rtdb.firebaseio.com" + endPoint);
    try {
      // var headers = {
      //   "Authorization": "Bearer ${"Get.find<StorageService>().token"}",
      //   "Accept-Language": Get.find<StorageService>().activeLocale.toString()
      // };
      Response response = await dio.request<T>(endPoint,
          data: data ?? {},
          queryParameters: queryParamters,
          options: Options(
            method: method,
            contentType: contentType,
            // headers: headers,
          ));

      print("status: ${response.statusCode}");
      print("response data is : ${response.data}");

      if (response.statusCode != 200) {
        print("status: ${response.statusCode}");
        throw "${response.statusMessage}\n${response.statusCode}";
      }
      //Parse response

      if (response.statusCode != 200 || response.data == null)
        throw "${response.statusMessage}";
      if (onSuccess != null) {
        print('ApiService.request msg= ${response.statusMessage}');
        onSuccess(response.statusMessage);
      }
      return response.data;
    } catch (e) {
      print("Error: $e");
      if (errorDialog == null && errorMessage == null) {

        await Get.defaultDialog(
          title: error.tr,
          //titlePadding: EdgeInsets.zero,
          //contentPadding: EdgeInsets.symmetric(horizontal: 10),
          content: Text("No Internet Connection"),
          middleText: "",
        );
        Get.offAllNamed(AppRoutes.initialRoute);
      }
      if (errorDialog != null) {
        await errorDialog(e.toString());
      }
      if (errorMessage != null) {
        errorMessage(e.toString());
      }
      return null;
    }
  }
}
