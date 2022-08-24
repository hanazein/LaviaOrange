import 'package:dio/dio.dart';
import 'package:hakathon_orange/repo/src/local/cache_helper.dart';
import 'package:hakathon_orange/repo/src/local/cache_keys.dart';



class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://lavie.orangedigitalcenteregypt.com",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": 'Bearer $token',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    String? token,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (token != null)  "Authorization": 'Bearer ${PreferenceUtils.getString(SharedKeys.apiToken)}',
      "forumId": PreferenceUtils.getString(SharedKeys.forumId)
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postForm({
    required String url,
    required FormData data,
    String? token,
 String?forumId,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": 'Bearer $token',
     "forumId":forumId
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": 'Bearer ${PreferenceUtils.getString(SharedKeys.apiToken)}',
    };

    // print('TOKEN => ${PreferenceUtils.getString(SharedKeys.apiToken)}');
    return await dio.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": 'Bearer $token',
    };
    return await dio.delete(
      url,
      data: data,
      queryParameters: query,
    );
  }
  static Future<Response> putData({
    required String url,
    String? token,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": 'Bearer $token',

    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}