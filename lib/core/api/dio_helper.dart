import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quran/core/api/api_constant.dart';

class DioHelper {
  final Dio _dio;
  DioHelper(this._dio);
  Future<Map<String, dynamic>> getData() async {
    try {
      var response = await _dio.get(ApiConstant.url + ApiConstant.endPoint);
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        debugPrint("Request Faild with status code:${response.statusCode}");
        throw Exception(
            "Request Faild with status code:${response.statusCode}");
      }
    } catch (error) {
      debugPrint("Error:${error.toString()}");
      throw Exception("Error:$error");
    }
  }
  Future<Map<String, dynamic>> getRadios() async {
    try {
      var response =
          await _dio.get(ApiConstant.url2 + ApiConstant.radioEndPoint);
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        debugPrint("Request Faild with status code:${response.statusCode}");
        throw Exception(
            "Request Faild with status code:${response.statusCode}");
      }
    } catch (error) {
      debugPrint("Error:${error.toString()}");
      throw Exception("Error:$error");
    }
  }

  Future<Map<String, dynamic>> getSuraha() async {
    try {
      var response =
          await _dio.get(ApiConstant.url + ApiConstant.surahEndPoint);
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        debugPrint("Request Faild with status code:${response.statusCode}");
        throw Exception(
            "Request Faild with status code:${response.statusCode}");
      }
    } catch (error) {
      debugPrint("Error:${error.toString()}");
      throw Exception("Error:$error");
    }
  }

  Future<Map<String, dynamic>> getAyahs({required int number}) async {
    try {
      final url ="https://api.alquran.cloud/v1/surah/$number";
      var response =
          await _dio.get(url);
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        debugPrint("Request Faild with status code:${response.statusCode}");
        throw Exception(
            "Request Faild with status code:${response.statusCode}");
      }
    } catch (error) {
      debugPrint("Error:${error.toString()}");
      throw Exception("Error:$error");
    }
  }
}
