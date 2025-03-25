import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../config/app_config.dart';

class ApiService extends GetConnect {
  ApiService() {
    httpClient.baseUrl = AppConfig.baseUrl;
    httpClient.timeout = const Duration(seconds: 60);

    /* ------------------------------- Headers ------------------------------ */
    httpClient.addRequestModifier((Request request) {
      request.headers['User-Agent'] = 'FlutterRepoHunter';
      request.headers['Accept'] = 'application/vnd.github+json';
      request.headers['X-GitHub-Api-Version'] = '2022-11-28';
      return request;
    });
  }

  Future<Response> getRequest(String uri, {Map<String, dynamic>? query}) async {
    try {
      Response res = await get(uri, query: query);

      return res;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException {
      throw FormatException("Unable to process the data".tr);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postRequest(String uri, dynamic body) async {
    try {
      return await post(uri, body);
    } on FormatException {
      throw FormatException("Unable to process the data".tr);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> putRequest(String uri, dynamic body) async {
    try {
      return await put(uri, body);
    } on FormatException {
      throw FormatException("Unable to process the data".tr);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteRequest(String uri) async {
    try {
      return await delete(uri);
    } on FormatException {
      throw FormatException("Unable to process the data".tr);
    } catch (e) {
      rethrow;
    }
  }
}
